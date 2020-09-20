// 引入request方法，发送请求
import { request } from "../../request/index.js";

// pages/goods_list/index.js
Page({
  /**
   * 页面的初始数据
   */
  data: {
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {

  },

  handleInput(e){
    const {value} =e.detail;
    if(!value.trim()){
      return;
    }
    this.qsearch(value);
  },

  async qsearch(query){
    const res=await request({url:"/good/search",data:{query}});
    console.log(res);
  }
 
})