// 引入request方法，发送请求
import { request } from "../../request/index.js";

// pages/category/index.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    //左侧一级菜单数据
    leftMenuList:[],
    //右侧二级菜单数据
    rightContent:[],
    //被点击的左侧菜单
    currentIndex:0,
  },

  Cates:[],

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    /*
    1.先判断本地存储有无旧数据
    {time:Date.now(),data:[...]}
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
      //有旧数据 定义过期时间 60s
      if(Date.now()-Cates.time>1000*60){
        //数据已经过期，获取数据
        this.getCates();
      }else{
        //数据未过期，直接使用旧数据
        console.log("使用旧数据");
        this.Cates=Cates.data;
        let leftMenuList=this.Cates.map(v=>v.cat1_name);
        let rightContent=this.Cates[0].cat2;
        this.setData({
          leftMenuList,
          rightContent
        })
      }
    }
  },


  //获取分类数据
  async getCates(){
    // 使用es7的async和await来发送请求
    const res=await request({url:"/categories/cat"});
    this.Cates=res;
    console.log(this.Cates);
    // 把接口数据存入本地存储
    wx.setStorageSync("cates", {time:Date.now(),data:this.Cates});    
    // 构造左侧一级菜单数据
    let leftMenuList=this.Cates.map(v=>v.cat1_name);
    // 构造右侧二级菜单数据
    let rightContent=this.Cates[0].cat2;
    this.setData({
      leftMenuList,
      rightContent
    })
  },

  //左侧一级菜单点击事件
  handleItemTap(e){
    /*
    1.获取点击的标题索引
    2.给data中的currentIndex赋值
    3.根据不同的索引来渲染右侧二级菜单内容
    */
    const {index}=e.currentTarget.dataset;
    console.log(index);
    console.log(this.Cates[index].cat2);
    let rightContent=this.Cates[index].cat2;
      this.setData({
        currentIndex:index,
        rightContent,
      })
  }
})