// pages/address/address.js
Page({
	/**
	 * 页面的初始数据
	 */
	data: {
		address :{
			name: '',
			phone: '',
			detail: ''
		}
	},

	/**
	 * 生命周期函数--监听页面加载
	 */
	onLoad: function (options) {
		var self = this;
		wx.getStorage({
			key: 'address',
			success :function(res){
				self.setData({
					address : res.data
				})
			}
		});
	},

	// 点击btton时提交表单
	formSubmit(e){
		// e指的应该是提交上来的数据
		// value 还是一个对象
		const value = e.detail.value;
		if(value.name && value.phone && value.detail){
			console.log("name phone detail :" + value.name + "  " + value.phone + "   "+value.detail);
			wx.setStorage({
				key: 'address',
				data: value,
				success(){
					wx.navigateBack();
				}
			});
		}else{
			console.log("没有检测到有内容进来");
			wx.showModal({
				title: '提示',
				content :'请填写完整资料',
				showCancel:false
			})
		}
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