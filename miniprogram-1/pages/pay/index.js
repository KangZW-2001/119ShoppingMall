// pages/cart/index.js
/**
 *  1. 页面加载时
 *    1. 从缓存中获取购物车数据，渲染到页面中
 *      这些数据 checked=true
 *  2. 微信支付
 *    1. 那些人 那些账号可以实现微信支付
 *      1. 企业账号
 *      2. 企业账号的小程序后台中，必须给开发者白名单
 *        1. 一个appid可以同时绑定多个开发者
 *        2. 这些开发者可以共用这个appid和相应开发权限
 *    2. 我们的解决方式
 *      1. 点击支付直接展示付款码
 *      2. 用户扫码支付后，订单进入预订单状态（等待核实金额）
 *      3. 金额核实完成，订单进入正常状态
 *      4. 用户可以点击订单详情页，查看订单状态
 *    
 *     
 */
import { getSetting,chooseAddress,openSetting,showModel,showToast } from "../../utils/asyncWx.js";

Page({
  data:{
    address:{},
    cart:[],
    totalPrice:0,
    totalNum:0
  },

  onShow(){
   // 1. 获取本地缓存中的地址数据
   const address=wx.getStorageSync("address");
   // 2. 获取本地缓存中的购物车数据
   let cart=wx.getStorageSync("cart")||[];
   // 3. 过滤后的购物车数组
   cart=cart.filter(v=>v.checked);
   this.setData({address});

   // 1. 计算 总价格、总数量、全选
   let totalPrice=0;
   let totalNum=0;
   cart.forEach(v=>{
       totalPrice+=v.num*v.good_price;
       totalNum+=v.num;
   })
   // 2. 存入data
   this.setData({
     cart,
     totalPrice,
     totalNum,
     address
   });
   wx.setStorageSync("totalPrice", totalPrice);
   wx.setStorageSync("totalNum", totalNum);     
  },

  //支付功能
  handlePay(){
    //生成订单信息
      
    //跳转到扫码支付
    wx.navigateTo({
      url: '/pages/paying/index'
    });
  }
})