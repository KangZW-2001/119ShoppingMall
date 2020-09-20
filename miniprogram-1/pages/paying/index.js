// 引入request方法，发送请求
import { request } from "../../request/index.js";
import { getSetting,chooseAddress,openSetting,showModel,showToast } from "../../utils/asyncWx.js";

// pages/paying/index.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    num:0,
    totalPrice:0,
    currentMoney:0
  },

  formParam:{
    nick_name:"",
    form_date:"",
    form_price:"",
    form_num:"",
    goods:""
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function () {
    let num=wx.getStorageSync("totalNum");
    let totalPrice=wx.getStorageSync("totalPrice");
    this.getUserMoney(wx.getStorageSync("userInfo").nickName);

    let currentMoney=wx.getStorageSync("currentMoney")
    this.setData({
      num,
      totalPrice,
      currentMoney
    });   
  },

  //支付事件
  handlePaying(){
    let currentMoney=currentMoney-this.totalPrice;
    wx.setStorageSync("currentMoney", currentMoney);
    this.createForm();
    // 3. 跳转到支付界面
    wx.switchTab({
      url: '/pages/index/index'
    });
  },

  //获取用户余额
  async getUserMoney(userName){
    let url = "/user/money?nick_name="+userName;
    console.log(url);
    const res = await request({url:url});
    this.setData({
        currentMoney:res
    })
    wx.setStorageSync("currentMoney", this.data.currentMoney);
  },

  //创建订单
  async createForm(){
    this.formParam.nick_name=wx.getStorageSync("userInfo").nickName;
    console.log(this.formParam.nick_name);
    this.formParam.form_date="today";
    console.log(this.formParam.form_date);
    this.formParam.form_price=this.data.totalPrice;
    console.log(this.formParam.form_price);
    this.formParam.form_num=this.data.num;
    console.log(this.formParam.form_num);
    // this.formParam.goods=wx.getStorageSync("cart");

    console.log("-----------");
    console.log(wx.getStorageSync("cart"));
    
    console.log("-----------");

    var str = "";
    for(var i = 0; i < wx.getStorageSync("cart").length;i++){
      var tempGoodId = wx.getStorageSync("cart")[i].good_id;
      var tempNum = wx.getStorageSync("cart")[i].num;
      str = str + tempGoodId+ ":"+tempNum+";"; 
    }
    this.formParam.goods=str;
    

    console.log(this.formParam.goods);
    const res=await request({url:"/form/create",data:this.formParam});
    console.log(res);
    if(res.state){
      wx.showToast({
        title: '支付成功',
        icon: 'success',
        duration: 1500,
        //添加蒙版 防止手抖多次添加
        mask: true
      });   
      wx.setStorageSync("cart",[])
      return;
    }else{
      wx.showToast({
        title: '支付失败',
        icon: 'none',
        duration: 1500,
        //添加蒙版 防止手抖多次添加
        mask: true
      });   
    }
  }
})