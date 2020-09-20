// 引入request方法，发送请求
import { request } from "../../request/index.js";

//Page Object
Page({
  data: {
    // 轮播图数组   存入商品id和轮播图地址
    swiperList:[],
    // 活动数组   存入二级分类
    activityList:[],
    // 展示数据  存入商品id数组
    showList:[]
  },
  //options(Object)
 
  //页面开始加载时，触发的函数
  onLoad: function(options) {        
    this.getSwiperList();
    this.getActivityList();
    this.getShowList();    
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
  getActivityList(){
    request({url:"/home/activity"})
      .then(result=> {
        this.setData({
          activityList:result
        })
      })
  },

  //获取展示数据方法
  getShowList(){
    request({url:"/home/show"})
      .then(result=> {
        this.setData({
          showList:result
        })
      })
  },
});
  