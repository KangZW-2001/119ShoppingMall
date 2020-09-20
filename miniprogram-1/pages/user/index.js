import { request } from "../../request/index.js";

// pages/user/index.js
Page({
    data:{
        userInfo:{},
        currentMoney:0
    },

    QueryParams:{
        nick_name:"",
        money:0
    },

    onShow(){
        const userInfo=wx.getStorageSync("userInfo");
        this.setData({
            userInfo:userInfo
        })        
        this.QueryParams.nick_name=userInfo.nickName;
        this.getUserMoney();          
    },

    handleGetUserInfo(e){
        const {userInfo}= e.detail;
        this.QueryParams.nick_name=userInfo.nickName;
        this.QueryParams.money=5000;
        wx.setStorageSync("userInfo", userInfo);
        this.setData({
            userInfo:userInfo,
            currentMoney:5000
        });
        this.sendUserInfo();     
    },

    //获取用户余额
    async getUserMoney(){
        console.log(this.QueryParams); 
        const res = await request({url:"/user/money",data:this.QueryParams});
        this.setData({
            currentMoney:res
        })
        wx.setStorageSync("currentMoney", this.data.currentMoney);
    },

    //将用户信息发送给服务器
    async sendUserInfo(){
        console.log(this.QueryParams);
        const res=await request({url:"/user/detail",data:this.QueryParams});
        console.log(res);
    }
})