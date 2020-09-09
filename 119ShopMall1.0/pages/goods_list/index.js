/**
 *  1. 用户上划界面，滚动条触底，开始加载下一页数据
 *    1.找到滚动条触底事件  （官方开发文档中查询 onReachBottom）
 *    2.判断是否存在下一页数据
 *      1.获取总页数 （=Math.ceil(总条数/页容量 pagesize)）
 *      2.获取当前页码
 *      3.判断当前页码是否大于等于总页数
 *          是 则无下一页
 *    3.假如没有下一页数据 弹出提示
 *    4.假如有下一页数据 加载下一页
 *      1.当前页码++
 *      2.重发请求
 *      3.获得数据，对data中的数组进行数组拼接而非直接替换！！！
 * 
 *  2. 下拉刷新页面
 *    1. 触发下拉刷新事件 页面json文件添加两个配置
 *       找到触发下拉刷新的事件
 *    2. 重置 数组数据
 *    3. 重置 页码 为 1
 *    4. 重发 请求
 */

// 引入request方法，发送请求
import { request } from "../../request/index.js";

// pages/goods_list/index.js
Page({
  /**
   * 页面的初始数据
   */
  data: {
    tabs:[
      {
        id:0,
        value:"综合",
        isActive:true
      },
      {
        id:1,
        value:"销量",
        isActive:false
      },
      {
        id:1,
        value:"价格",
        isActive:false
      }
    ],

    goodsList:[]
  },

  //接口要的参数
  QueryParams:{
    query:"",
    cid:"",
    pagenum:1,
    pagesize:10
  },

  //总页数
  totalPages:1,

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    this.QueryParams.cid=options.cid;
    this.getGoodsList();     
  },

  //获取商品列表数据
  async getGoodsList(){
    const res=await request({url:"/goods/search",data:this.QueryParams});
    //获取总条数
    const total=res.total;
    //计算总页数
    this.totalPages=Math.ceil(total/this.QueryParams.pagesize);
    console.log(this.totalPages);
    this.setData({
      // 拼接了数组
      goodsList:[...this.data.goodsList,...res.goods]
    })

    // 请求成功 关闭下拉刷新
    wx.stopPullDownRefresh();
  },

  
  // 标题点击事件 （从子组件传递过来）
  handleTabsChange(e){
    // 1. 获取被点击的标题索引
    const {index} = e.detail;
    // 2. 修改源数组
    let {tabs} = this.data;
    tabs.forEach((v,i)=>i===index?v.isActive=true:v.isActive=false);
    this.setData({
      tabs
    })
  },

  // 页面上滑 滚动条触底事件
  onReachBottom(){
    // 1. 判断还有没有下一页数据
    if(this.QueryParams.pagenum>=this.totalPages){
      // 没有下一页
      wx.showToast({
        title: '没有更多商品了'
      });        
    } else{
      this.QueryParams.pagenum++;
      this.getGoodsList();
      console.log("还有下一页");
    }
  },

  //下拉刷新事件
  onPullDownRefresh(){
    // 1. 重置数组
    this.setData({
      goodsList:[]
    })
    // 2. 重置页码
    this.QueryParams.pagenum=1;
    // 3. 重发请求
    this.getGoodsList();
  }
 
})