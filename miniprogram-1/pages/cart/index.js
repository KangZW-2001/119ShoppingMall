// pages/cart/index.js
/**
 * 1.获取用户收货地址
 *    1. 绑定点击事件
 *    2. 调用api，获取收货地址 wx.chooseAddress
 *        获取用户对小程序授予 获取地址 权限状态 scope
 *        1. 假设 用户点击 了确定，scope值为true  authSetting scope.address
 *        2. 假设 用户点击 了取消，scope值为false
 *            1. 引导用户 打开授权设置界面 重新授权
 *            2. 获取收货地址
 *        3. 假设 用户从未调用过， scope值为unddfined
 * 2.页面加载完毕（onLoad onShow）
 *    1. 获取本地缓存中的地址数据
 *    2. 将数据 赋值给data中的一个变量
 * 3.onShow
 *    1. 获取缓存中的购物车数组
 *    2. 把购物车数据填充到data中 
 * 4.实现全选 展示数据
 *    1. 在onShow中获取缓存中购物车数组
 *    2. 根据购物车中的商品数据进行计算（所有商品checked=true，全选才被选中）
 * 5.总价格和总数量
 *    1. 商品被选中才计算
 *    2. 获取购物车数组
 *    3. 遍历
 *    4. 判断是否被选中
 *    5. 总价格 += 商品单价 * 商品数量
 *    6. 总数量 += 商品数量
 *    7. 将计算后价格和数量放入data中
 * 6.商品选中功能
 *    1.绑定change事件
 *    2.获取被修改的商品对象
 *    3.商品对象的选中状态取反
 *    4.重新填充会data和本地缓存中
 *    5.重新计算全选、总价格、总数量
 * 7.全选/反选
 *    1.全选复选框绑定时间change
 *    2.获取data中的全选变量 allChecked
 *    3.对allChecked取反
 *    4.遍历购物车数组，让购物车商品选中状态跟随allChecked改变而改变
 *    5.把购车车数组和状态放入data和缓存
 * 8.商品数量的编辑功能
 *    1. "+" 和 "-" 绑定同一个点击事件，用自定义属性区分
 *    2. 传递被点击的商品id good_id
 *    3. 获取data中的购物车数组，获取需要被修改的商品对象
 *    4. 当购物车数量=1 且用户点击 "-"
 *       弹窗提示用户(wx-showModel) 是否删除该商品
 *        1.确定 直接删除
 *        2.取消 什么都不做   
 *    5. 修改商品对象的数量 num
 *    6. 重新填充入data和本地缓存
 * 9.商品结算
 *    1.判断有没有收货地址
 *    2.判断有没有选购商品
 *    3.都满足了，跳转到支付页面 
 */

 import { getSetting,chooseAddress,openSetting,showModel,showToast } from "../../utils/asyncWx.js";

 Page({
   data:{
     address:{},
     cart:[],
     allChecked:false,
     totalPrice:0,
     totalNum:0
   },

   onShow(){
    // 1. 获取本地缓存中的地址数据
    const address=wx.getStorageSync("address");
    // 2. 获取本地缓存中的购物车数据
    const cart=wx.getStorageSync("cart")||[];
    this.setData({address});
    this.setCart(cart);      
   },
  // 点击收货地址按钮事件
  async handleChooseAddress(){
    try {  
      // 1. 获取 权限
      const res1=await getSetting();
      const scopeAddress = res1.authSetting["scope.address"];
      // 2. 判断 权限状态   
      if(scopeAddress===false){
        // 3. 引导用户打开授权页面
        await openSetting();    
      }
      // 4. 调用收货地址api
      let address=await chooseAddress();
      address.all=address.provinceName+address.cityName+address.countyName+address.detailInfo;
      // 5. 将地址存入本地缓存
      wx.setStorageSync("address", address);
           
    } catch (error) {
      console.log(error);
    }
  },

  // 商品选中事件
  handleItemChange(e){
    // 1. 获取被修改的商品id
    const good_id=e.currentTarget.dataset.id;
    // 2. 获取购物车数组
    let {cart} = this.data;
    // 3. 找到被修改的商品对象
    let index=cart.findIndex(v=>v.good_id===good_id);
    // 4. 将选中状态取反
    cart[index].checked=!cart[index].checked;
    // 5. 重新计算，填入data和本地缓存
    this.setCart(cart);   
  },

  // 设置购物车状态 重新计算底部工具栏数据（价格、全选、数量
  setCart(cart){
    let allChecked=true;
    // 1. 计算 总价格、总数量、全选
    let totalPrice=0;
    let totalNum=0;
    cart.forEach(v=>{
      if(v.checked){
        totalPrice+=v.num*v.good_price;
        totalNum+=v.num;
      }else{
        allChecked=false;
      }
    })
    // 2. 判断数组是否为空
    allChecked=cart.length!=0?allChecked:false;
    // 3. 存入data
    this.setData({
      cart,
      totalPrice,
      totalNum,
      allChecked
    });
    // 4. 存入缓存
    wx.setStorageSync("cart", cart);
  },

  // 商品全选、反选功能
  handleItemAllCheck(){
    // 1. 获取data中数据
    let {cart,allChecked}=this.data;
    // 2. 修改值
    allChecked=!allChecked;
    // 3. 循环修改cart数组中的商品选中状态
    cart.forEach(v=>v.checked=allChecked);
    // 4. 放入data和缓存
    this.setCart(cart);
  },

  // 商品数量编辑
  async handleItemNumEdit(e){
    // 1. 获取两个传递过来的参数
    const {operation,id} = e.currentTarget.dataset;
    // 2. 获取购物车数组
    let {cart} = this.data;
    // 3. 找到要修改的商品索引
    const index=cart.findIndex(v=>v.good_id===id);
    // 4. 判断是否要删除商品
    if(cart[index].num===1&&operation===-1){
      //弹窗提示
      const result=await showModel({content:"您是否要删除该商品?"})
      if (result.confirm) {
        cart.splice(index,1);
        this.setCart(cart);
      }       
    }else{
      // 4. 进行数量修改
      cart[index].num+=operation;
      // 5. 保存进data和缓存
      this.setCart(cart);
    }
  },

  // 商品结算
  async handlePay(){
    // 1. 判断收货地址
    const {address,totalNum}=this.data;
    if(!address.userName){
      await showToast({
        title:"您还没有选择收货地址"
      });
      return;
    }
    // 2. 判断商品是否为空
    if(totalNum===0){
      await showToast({
        title:"您还没有选购商品"
      })
      return;
    }
    // 3. 跳转到支付界面
    wx.navigateTo({
      url: '/pages/pay/index'
    });
      
  }
})