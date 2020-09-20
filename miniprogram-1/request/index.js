
//同时发送异步代码的次数
let ajaxTime=0;
export const request=(params)=>{
  ajaxTime++;
  //显示 加载中 效果
  wx.showLoading({
    title: '加载中',
    mask: true
  });  
  
  // 定义接口公共url
  const baseUrl="http://172.23.14.251:8080"  
  
  //Promise请求
  return new Promise((resolve,reject)=>{
    wx.request({
      ...params,
      url:baseUrl+params.url,
      success:(result)=>{
        resolve(result.data.message);
      },
      fail:(err)=>{
        reject(err);
      },
      complete:()=>{
        ajaxTime--;
        // 关闭正在等待的图标
        wx.hideLoading();
      }
    });
  })
}
