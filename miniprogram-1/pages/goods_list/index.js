// 引入request方法，发送请求
import { request } from "../../request/index.js";

// pages/goods_list/index.js
Page({
  /**
   * 页面的初始数据
   */
  data: {
    goodList:[]
  },

  //接口要的参数
  QueryParams:{
    keyword:"",
    cat1_id:"",
    cat2_id:"",
    is_discut:"",
    is_groupbuy:"",
    is_new:""
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    this.QueryParams=options;
    console.log(this.QueryParams);
    this.getGoodList();     
  },

  //获取商品列表数据
  async getGoodList(){
    console.log(this.QueryParams);
    let that = this;
    const res=await request({url:"/good/search",data:that.QueryParams});
    console.log(res);
    this.setData({
      // 拼接了数组
      goodList:[...this.data.goodList,...res]
    })

    // 请求成功 关闭下拉刷新
    wx.stopPullDownRefresh();
  },

  //下拉刷新事件
  onPullDownRefresh(){
    // 1. 重置数组
    this.setData({
      goodsList:[]
    })
    // 2. 重发请求
    this.getGoodsList();
  }
 
})