// pages/my/my.js
Page({

	/**
	 * 页面的初始数据
	 */
	data: {
		user_pic: '',
		user_name: '',
		has_address: false,
		address: {},
		order_array:[
			{
				goods_image : "../../images/goods1.jpg",
				goods_name : "goods1",
				goods_state : "配送中",
				buy_time: "9-16 14:25"
			},
			{
				goods_image : "../../images/goods2.jpg",
				goods_name : "goods2",
				goods_state : "已签收",
				buy_time: "9-16 14:25"
			},
			{
				goods_image : "../../images/goods3.jpg",
				goods_name : "goods3",
				goods_state : "已签收",
				buy_time: "9-16 14:25"
			},
			{
				goods_image : "../../images/goods1.jpg",
				goods_name : "goods4",
				goods_state : "已签收",
				buy_time: "9-16 14:25"
			},
			{
				goods_image : "../../images/goods2.jpg",
				goods_name : "goods5",
				goods_state : "已签收",
				buy_time: "9-16 14:25"
			},
			
		]
	},

	/**
	 * 生命周期函数--监听页面加载
	 */
	onLoad: function (options) {
		var self = this;
		wx.getUserInfo(
			{
				success: function(res){
					self.setData({
						user_pic : res.userInfo.avatarUrl,
						user_name: res.userInfo.nickName
					})
				}
			}
		)
	},

	/**
	 * 生命周期函数--监听页面初次渲染完成
	 */
	onReady: function () {

	},

	/**
	 * 生命周期函数--监听页面显示
	 */
	onShow: function () {
		var self = this;
		wx.getStorage({
			key : 'address',
			success: function(res){
				self.setData({
					has_address: true,
					address : res.data
				})
			}
		})
	},

	/**
	 * 生命周期函数--监听页面隐藏
	 */
	onHide: function () {

	},

	/**
	 * 生命周期函数--监听页面卸载
	 */
	onUnload: function () {

	},

	/**
	 * 页面相关事件处理函数--监听用户下拉动作
	 */
	onPullDownRefresh: function () {

	},

	/**
	 * 页面上拉触底事件的处理函数
	 */
	onReachBottom: function () {

	},

	/**
	 * 用户点击右上角分享
	 */
	onShareAppMessage: function () {

	}
})