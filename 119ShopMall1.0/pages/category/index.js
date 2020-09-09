// 引入request方法，发送请求
import { request } from "../../request/index.js";

// pages/category/index.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    //左侧菜单数据
    leftMenuList:[],
    //右侧商品数据
    rightContent:[],
    //被点击的左侧菜单
    currentIndex:0,
    //右侧滚动条距离顶部距离
    scrollTop:0
  },

  Cates:[],

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    /*
    1.先判断本地存储有无旧数据
    {tiem:Date.now(),data:[...]}
    2.没有旧数据，发送新请求
    3.有旧数据，且数据未过期，使用本地存储的旧数据
    */

    // 1. 获取本地存储中的数据（小程序本身支持本地存储）
    const Cates=wx.getStorageSync("cates");
    // 2. 判断
    if(!Cates){
      //本地数据不存在，发送新请求，获取数据
      this.getCates();
    }else{
      //有旧数据 定义过期时间 10s
      if(Date.now()-Cates.time>1000*60){
        //数据已经过期，获取数据
        this.getCates();
      }else{
        //数据未过期，直接使用旧数据
        console.log("使用旧数据");
        this.Cates=Cates.data;
        let leftMenuList=this.Cates.map(v=>v.cat_name);
        let rightContent=this.Cates[0].children;
        this.setData({
          leftMenuList,
          rightContent
        })
      }
    }
  },


  //获取分类数据
  async getCates(){
    // request({
    //   url:"/categories"
    // })
    // .then(res => {
    //   this.Cates=res.data.message;

    //   //把接口数据存入本地存储
    //   wx.setStorageSync("cates", {time:Date.now(),data:this.Cates});
            
    //   //构造左侧大菜单数据
    //   let leftMenuList=this.Cates.map(v=>v.cat_name);
    //   //构造右侧商品数据
    //   let rightContent=this.Cates[0].children;
    //   this.setData({
    //     leftMenuList,
    //     rightContent
    //   })
    // })

    // 使用es7的async和await来发送请求
    const res=await request({url:"/categories"});
    this.Cates=res;
    // 把接口数据存入本地存储
    wx.setStorageSync("cates", {time:Date.now(),data:this.Cates});    
    // 构造左侧大菜单数据
    let leftMenuList=this.Cates.map(v=>v.cat_name);
    // 构造右侧商品数据
    let rightContent=this.Cates[0].children;
    this.setData({
      leftMenuList,
      rightContent
    })
  },

  //左侧菜单点击事件
  handleItemTap(e){
    /*
    1.获取点击的标题索引
    2.给data中的currentIndex赋值
    3.根据不同的索引来渲染右侧商品内容
    */
    const {index}=e.currentTarget.dataset;
    
    let rightContent=this.Cates[index].children;
      this.setData({
        currentIndex:index,
        rightContent,
        //重新设置右侧滚动条位置
        scrollTop:0
      })
  },
  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {

  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  }
})