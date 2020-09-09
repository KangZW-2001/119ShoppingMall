// pages/mycart/mycart.js
Page({

	/**
	 * 页面的初始数据
	 */
	data: {
	  goods: [{
		id: 1,
		name: "会议截图1",
		price: 122.56,
		num: 1,
		preferential:"满2件88折",
		imgurl: "../../images/goods1.jpg"
	  },
	  {
		id: 2,
		name: "会议截图2",
		price: 25.34,
		num: 1,
		preferential:"满3件95折",
		imgurl: "../../images/goods1.jpg"
  
	  },
	  {
		id: 3,
		name: "会议截图3",
		price: 28.26,
		num: 1,
		preferential:"满10件68折",
		imgurl: "../../images/goods1.jpg"
	  },
	  {
		id: 4,
		name: "会议截图4",
		price: 32.44,
		num: 1,
		preferential:"满4件78折",
		imgurl: "../../images/goods1.jpg"
	  },
	  {
		id: 5,
		name: "会议截图5",
		price: 32.00,
		num: 1,
		preferential:"满3件88折",
		imgurl: "../../images/goods1.jpg"
	  },
	  {
		id: 6,
		name: "会议截图6",
		price: 22.99,
		num: 1,
		preferential:"满2件85折",
		imgurl: "../../images/goods1.jpg"
	  },
	  {
		id: 7,
		name: "会议截图7",
		price: 122.25,
		num: 1,
		preferential:"满4件78折",
		imgurl: "../../images/goods1.jpg"
	  }
	  ],
	  //所有商品的数
	  goodscount: 0,
	  // is_edit说明购物车目前所处模式，0为默认值即正常模式
	  // 注：购物车分为管理模式与正常模式，当进入购物车时为正常模式，可以进行商品的结算；当进入购物车删除模式时，可以对已添加进购物车的商品进行删除
	  is_edit: 0,
	  //是否全选，s是管理模式
	  is_check_all_s: 0,
	  is_check_all_d: 0,
	  //结算时被选中的件数
	  select_scount: 0,
	  money: 0,
	  num_input: 1
	},
  
	/**
	 * 生命周期函数--监听页面加载
	 */
	onLoad: function (options) {
	  let goods = this.data.goods
	  let goodscount = 0
	  for (let i = 0; i < goods.length; i++) {
		// 直接+=1相当于添加购物车默认添加一件商品
		goodscount += goods[i].num
		//添加一个新的属性默认值为0,这个属性用来判断在管理模式商品是否被选中
		goods[i].dot_s = 0
		//在正常模式下商品是否被选中
		goods[i].dot_d = 0
	  }
	  this.setData({
		goodscount: goodscount,
		goods: goods
	  })
	},
	// 当购物车内无商品时，会跳转到商城首页
	goshopping_func() {
	  wx.navigateTo({
		url: '/pages/index/index',
	  })
	},
	//跳转回商品详情页（未完成）
	turn_good_detial(){
	   wx.navigateTo({
		  url:'item.image.url',
	   }
	   )
	},
	//改变购物车模式
	change_edit_func() {
	  let is_edit = this.data.is_edit
	  let goods = this.data.goods
	  let is_check_all_s = this.data.is_check_all_s
	  let is_check_all_d = this.data.is_check_all_d
	  //is_edit == 1证明此时页面处于管理模式
	  // 在每一次点击右上角的管理按钮对商品进行编辑时，所有已勾选内容均清空
	  if (is_edit == 1) {
		for (let i = 0; i < goods.length; i++) {
		  //添加一个新的属性默认值为0
		  goods[i].dot_s = 0
		}
	  } else {
		for (let i = 0; i < goods.length; i++) {
		  //添加一个新的属性默认值为0
		  goods[i].dot_d = 0
		}
	  }
	  this.setData({
		is_edit: !is_edit,
		goods: goods,
		//改变购物车模式时，之前所做的选择均被清空
		is_check_all_s: 0,
		is_check_all_d: 0,
		//改变购物车模式时，所有选中商品数清零
		select_scount: 0,
		money: 0
	  })
	},
	//商品被选中
	select_goods_func(e) {
	  let id = e.currentTarget.dataset.id
	  let goods = this.data.goods
	  let is_edit = this.data.is_edit
	  if (is_edit) {
		for (let i = 0; i < goods.length; i++) {
		  if (goods[i].id == id) {
			goods[i].dot_s = !goods[i].dot_s
		  }
		}
	  } else {
		for (let i = 0; i < goods.length; i++) {
		  if (goods[i].id == id) {
			goods[i].dot_d = !goods[i].dot_d
		  }
		}
		//正常模式下统计选中商品数量和总金额
		this.count_money(goods)
	  }
	  this.setData({
		goods: goods,
	  })
	},
	//统计结算金额和结算商品数量
	count_money(goods) {
	  let select_scount = 0
	  let money = 0
	  //正常模式下每次选中商品重新统计被选中商品的件数
	  for (let i = 0; i < goods.length; i++) {
		if (goods[i].dot_d) {
		  select_scount += goods[i].num
		  money += goods[i].num * goods[i].price
		}
	  }
	  this.setData({
		select_scount: select_scount,
		money: money
	  })
	},
	//全选
	is_check_all_func() {
	  let is_edit = this.data.is_edit
	  let goods = this.data.goods
	  let is_check_all_s = this.data.is_check_all_s
	  let is_check_all_d = this.data.is_check_all_d
	  //处于管理模式下时
	  if (is_edit) {
		if (is_check_all_s) {
		  for (let i = 0; i < goods.length; i++) {
			goods[i].dot_s = 0
		  }
		} else {
		  for (let i = 0; i < goods.length; i++) {
			goods[i].dot_s = 1
		  }
		}
		is_check_all_s = !is_check_all_s
	  }
	  //正常模式下时 
	  else {
		if (is_check_all_d) {
		  for (let i = 0; i < goods.length; i++) {
			goods[i].dot_d = 0
		  }
		} else {
		  for (let i = 0; i < goods.length; i++) {
			goods[i].dot_d = 1
		  }
		}
		is_check_all_d = !is_check_all_d
		//正常模式下每次全选商品重新统计被选中商品的金额和数量
		this.count_money(goods)
	  }
	  this.setData({
		goods: goods,
		is_check_all_s: is_check_all_s,
		is_check_all_d: is_check_all_d,
	  })
	},
	//在管理模式下删除按钮
	delete_func() {
	  let that = this
	  let goods = this.data.goods
	  let goodscount = 0
	  let numofcheck = 0
	  for (let i = 0; i < goods.length; i++) {
		if (goods[i].dot_s) {
		  numofcheck += 1
		} else {
		  numofcheck = numofcheck
		}
	  }
	  //必须选择超过一件商品才可以删除
	  if (numofcheck >= 1) {
		wx.showModal({
		  content: '确认将这些宝贝删除？',
		  cancelText: "我再想想",
		  success: function (res) {
			if (res.confirm) {
			  goods = goods.filter(function (item) {
				return !item.dot_s
			  });
			  //删除时重新计算所有商品数
			  for (let i = 0; i < goods.length; i++) {
				goodscount += goods[i].num
			  }
			  that.setData({
				goods: goods,
				goodscount: goodscount
			  })
			} else if (res.cancel) {
			  console.log('用户点击取消')
			}
		  }
		})
	  } else {
		wx.showModal({
		  content: '请至少选择一件删除的商品',
		  success(res) {
			if (res.confirm) {
			  console.log('用户点击确定')
			} else if (res.cancel) {
			  console.log('用户点击取消')
			}
		  }
		}
		)
	  }
	},
	//购物车商品数量改变
	num_input_change_func(e) {
	  let num_input = e.detail.value
	  let id = e.currentTarget.dataset.id
	  let goods = this.data.goods
	  if (num_input.length == 1) {
		num_input = parseInt(num_input.replace(/[^1-9]/g, ''))
	  } else if (num_input.length > 1) {
		num_input = parseInt(num_input.replace(/\D/g, ''))
	  } else {
		num_input = 1
	  }
	  for (let i = 0; i < goods.length; i++) {
		if (goods[i].id == id) {
		  goods[i].num = num_input
		}
	  }
	  //正常模式下统计选中商品数量和总金额
	  this.count_money(goods)
	},
	//减少选中商品的一个数量，减一
	reduce_func(e) {
	  let id = e.currentTarget.dataset.id
	  let goods = this.data.goods
	  for (let i = 0; i < goods.length; i++) {
		if (goods[i].id == id) {
		  if (goods[i].num > 1) {
			goods[i].num = goods[i].num - 1
		  }
		}
	  }
	  //再重新统计
	  this.count_money(goods)
	  this.setData({
		goods: goods
	  })
	},
	//增加选中商品的一个数量，加一
	add_func(e) {
	  let id = e.currentTarget.dataset.id
	  let goods = this.data.goods
	  for (let i = 0; i < goods.length; i++) {
		if (goods[i].id == id) {
		  if (goods[i].num < 9999) {
			goods[i].num = goods[i].num + 1
		  }
		}
	  }
	  //再重新统计
	  this.count_money(goods)
	  this.setData({
		goods: goods
	  })
	},
  
  })
  
  