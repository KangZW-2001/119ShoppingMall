// 引入request方法，发送请求
import { request } from "../../request/index.js";

//Page Object
Page({
  data: {
    // 轮播图数组
    swiperList:[],
    // 导航数组
    catesList:[],
    // 楼层数据
    floorList:[]
  },
  //options(Object)
 
  //页面开始加载时，触发的函数
  onLoad: function(options) {
    // //1.发送异步请求，获取轮播数据
    // //2.promise 解决异步地狱
    // wx.request({
    //   url: 'https://api-hmugo-web.itheima.net/api/public/v1/home/swiperdata',
    //   success: (result) => {
    //     this.setData({
    //       swiperList:result.data.message
    //     })
    //   }
    // });
        
    this.getSwiperList();
    this.getCateList();
    this.getFloorList();
  },

  //获取轮播图数据方法
  getSwiperList(){
    request({url:"/home/swiperdata"})
      .then(result=> {
        this.setData({
          swiperList:result
        })
      })
  },

  //获取分类导航栏数据方法
  getCateList(){
    request({url:"/home/catitems"})
      .then(result=> {
        this.setData({
          catesList:result
        })
      })
  },

  //获取楼层数据方法
  getFloorList(){
    request({url:"/home/floordata"})
      .then(result=> {
        this.setData({
          floorList:result
        })
      })
  },
  
  onReady: function() {
    
  },
  onShow: function() {
    
  },
  onHide: function() {

  },
  onUnload: function() {

  },
  onPullDownRefresh: function() {

  },
  onReachBottom: function() {

  },
  onShareAppMessage: function() {

  },
  onPageScroll: function() {

  },
  //item(index,pagePath,text)
  onTabItemTap:function(item) {

  }
});
  