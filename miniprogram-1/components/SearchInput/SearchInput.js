// components/SearchInput/SearchInput.js
Component({
  /**
   * 组件的属性列表
   */
  properties: {

  },

  /**
   * 组件的初始数据
   */
  data: {
    keyword:""
  },

  /**
   * 组件的方法列表
   */
  methods: {
    handleInput(e){
      this.setData({
        keyword:e.detail.value
      })
    }
  }
})
