import { request } from "../../request/index.js";

// pages/order/index.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    nickName:"",
    currentState:0,
    formList:[],
    tabs:[
      {
        id:0,
        value:"全部订单",
        isActive:false
      },
      {
        id:1,
        value:"待审核",
        isActive:false
      },
      {
        id:2,
        value:"待发货",
        isActive:false
      },
      {
        id:3,
        value:"配送中",
        isActive:false
      },
      {
        id:4,
        value:"已送达",
        isActive:false
      },
      {
        id:5,
        value:"已完成",
        isActive:false
      },
    ]
  },

  QueryParams:{
    nick_name:"",
    state:0
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    // 1. 获取参数 用户昵称，订单类型
    this.QueryParams=options;
    //2. 修tabs原数组
    let {tabs}=this.data;
    tabs[this.QueryParams.state].isActive=true;
    //3. 赋值给data
    this.setData({
      tabs:tabs,      
      currentState:this.QueryParams.state,
      nickName:this.QueryParams.nick_name
    })   
    // 3. 获取订单列表
    this.getOrderList();
  },

   //顶部导航栏点击切换
   handleTabsItemChange(e){
    //1.获取被点击的标题索引
    const {index}=e.detail;
    //2. 修改原数组
    let {tabs}=this.data;
    tabs.forEach((v,i)=>i===index?v.isActive=true:v.isActive=false);
    //3. 赋值给data
    this.setData({
      tabs:tabs,
      currentState:index
    })
    this.getOrderList();
  },

  //获取订单列表
  async getOrderList(){
    this.QueryParams.state=this.data.currentState;
    const res=await request({url:"/form/detail",data:this.QueryParams});
    this.setData({
      formList:[]
    })
    this.setData({
      formList:[...this.data.formList,...res]
    })
  },
  
 
})