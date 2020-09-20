/**
 * 1. 发送请求，获取数据
 * 2. 点击轮播图 预览大图
 *    1. 在轮播图上 绑定点击事件
 *    2. 调用小程序api —— previewImage
 * 3. 点击加入 购物车
 *    1. 绑定点击事件
 *    2. 获取缓存中的购物车数据 数组格式
 *    3. 判断当前商品是否已经存在于购物车中
 *    4. 已经存在 则修改商品数据 数量加一 重新将购物车数组填充入缓存
 *    5. 不存在 在数组中添加一个新元素 带上数量num=1，填充进入缓存
 *    6. 弹出提示
 *    
 */

// 导入 request 方法 发送请求
import { request } from "../../request/index.js";

// pages/goos_detail/index.js
Page({
  
  //页面初始数据
  data: {
    goodObj:{}
  },

  // 商品对象
  GoodInfo:{},

  //生命周期函数--监听页面加载
  onLoad: function (options) {
    const {good_id}=options;
    this.getGoodDetail(good_id);
  },

  // 获取商品详情数据
  async getGoodDetail(good_id){
    const goodObj=await request({url:"/good/detail",data:{good_id}});
    this.GoodInfo=goodObj;
    this.setData({
      goodObj:{
        good_name:goodObj.good_name,
        good_price:goodObj.good_price,
        // iphone部分手机无法识别webp格式的图片
        // 最好后台更改数据，临时修改时，要保证后台存在webp=>jpg,使用正则表达式替换
        good_introduce:goodObj.good_introduce.replace(/\.webp/g,'.jpg'),
        good_number:goodObj.good_number,
        pics:goodObj.pics
      }
    })
  },

  // 点击轮播图 放大预览功能
  handlePreviewImage(e){
    // 1. 先构造预览图片的数组
    const urls=this.GoodInfo.pics.map(v=>v.image_src);
    // 2. 接收点击的图片url参数
    const current=e.currentTarget.dataset.url;
    wx.previewImage({
      current,
      urls
    });      
  },

  // 点击加入购物车事件
  handleCartAdd(e){
    // 0. 检测商品库存是否满足
    let number=this.GoodInfo.good_number;
    if(number>1){
      // 1. 获取缓存中购物车数组
      let cart=wx.getStorageSync("cart")||[];
      // 2. 商品是否存在于购物车数组中
      let index=cart.findIndex(v=>v.good_id===this.GoodInfo.good_id);
      if(index===-1){
        // 3. 不存在 第一次添加
        this.GoodInfo.num=1;
        this.GoodInfo.checked=true;
        cart.push(this.GoodInfo)
      }else{
        // 4. 已经存在 数量加一
        cart[index].num++;
      }
      // 5. 将数据填入缓存
      wx.setStorageSync("cart", cart);
      // 6. 弹窗提示
      wx.showToast({
        title: '加入成功',
        icon: 'success',
        duration: 1500,
        //添加蒙版 防止手抖多次添加
        mask: true
      });     
    }
    else{
      wx.showToast({
        title: '商品库存不足',
        icon:'none',
        duration: 1500,
        //添加蒙版 防止手抖
        mask: true
      });  
    }
  }
})