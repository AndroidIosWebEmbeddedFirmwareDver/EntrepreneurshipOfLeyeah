#0x00001
###React Native的中文参考资料，包括开源库，文字/视频资料，相关工具等
https://github.com/LeoMobileDeveloper/ReactNativeMaterials


#0X0000
###React-Native编写针对平台的代码
http://blog.csdn.net/jiangbo_phd/article/details/52794470

###使用Platform模块进行区分
####Platform模块是React Native提供的一个内部模块，主要用于平台的区分，我们看下代码：
~~~code
container: {
    flex: 1,
    ...Platform.select({
      ios: {
        backgroundColor: 'red',
      },
      android: {
        backgroundColor: 'blue',
      },
    }),
  },
~~~

~~~
var Component = Platform.select({
  ios: () => require('ComponentIOS'),
  android: () => require('ComponentAndroid'),
})();

<Component />;
~~~
主要的使用方法为Platform.select, 框架会自动区分当前平台，进行组件选择。
此外我们也可以之间判断平台：
~~~
import { Platform, StyleSheet } from 'react-native';

var styles = StyleSheet.create({
  height: (Platform.OS === 'ios') ? 200 : 100,
});
~~~

Platform模块还有一个附加功能，即在android平台可以检测平台的版本号：

~~~
import { Platform } from 'react-native';

if(Platform.Version === 21){
  console.log('Running on Lollipop!');
}
~~~

#0X0001
###ReactNative 代码调试方法
http://blog.csdn.net/yayayaya20122012/article/details/51067798

#0X0010
###ReactNative FlatList
http://blog.csdn.net/aiynmimi/article/details/76162170

#0X0100
###ReactNative 布局FlexBox
http://www.cnblogs.com/sunshine-anycall/p/5983172.html
http://www.jianshu.com/p/688b9108a922

#0000x
###React Native - 通过onLayout回调获取根View的宽高（对比Dimensions API）
http://www.hangge.com/blog/cache/detail_1747.html


#096789
###React Native 之 Text居中显示
http://blog.csdn.net/haoranli/article/details/68486317


#123423
###React Native 路由使用总结
http://blog.csdn.net/qq_16559905/article/details/71459254
https://reactnavigation.org/docs/navigators/stack

#123341
###React Native页面间传值总结
https://www.2cto.com/kf/201707/653956.html
####React Native中页面跳转、传值与回调
http://www.jianshu.com/p/8a6e21a50438
####React Native 利用通知返回上一页进行传值刷新页面
http://www.jianshu.com/p/847fbba8bf15


#12313
####react-native-ui-xg
https://github.com/xgfe/react-native-ui-xg
~~~
yarn add react-native-ui-xg
~~~


#112314
###CalendarPicker
CalendarPicker Component for React Native
https://github.com/stephy/CalendarPicker
~~~
yarn add react-native-calendar-picker
~~~



#112314
###momentjs 格式化时间
http://momentjs.com/
~~~
yarn add moment
~~~




#112234
### A component to select period from calendar like Airbnb
https://github.com/Tinysymphony/react-native-calendar-select
~~~
yarn add react-native-calendar-select
~~~


#121312
### 一个高效轻量级JavaScript日期处理库
https://date-fns.org/
~~~
 yarn add date-fns
~~~

#123123
###Lodash 是一个具有一致接口、模块化、高性能等特性的 JavaScript 工具库。
https://lodash.com/
http://lodashjs.com/
~~~
 yarn add lodash
~~~



#123123
###React Native Calendar Components 📆
https://github.com/wix/react-native-calendars
~~~
 yarn add react-native-calendars
 yarn remove react-native-calendars
~~~


#1213
###完美解决所有输入框与scrollView间的问题
https://github.com/baijunjie/react-native-input-scroll-view
~~~
yarn add react-native-input-scroll-view
~~~




#1214
### 直接在开发模式中显示打印信息
~~~
//开发模式可以直接在IOS设备上显示出来
// console.warn(err.message);
~~~




#1214 
### react-native-storage
https://github.com/sunnylqm/react-native-storage/blob/master/README-CHN.md
这是一个本地持久存储的封装，可以同时支持react-native(AsyncStorage)和浏览器(localStorage)。
ES6语法，promise异步读取，使用jest进行了完整的单元测试。
~~~
yarn add react-native-storage
~~~



#1215
### React Native 项目常用第三方组件汇总
http://www.jianshu.com/p/53ff78168acc
https://github.com/LeoMobileDeveloper/ReactNativeMaterials




#1216
### 安卓 iOS 白屏解决
https://github.com/mehcode/rn-splash-screen
http://www.jianshu.com/p/3de35fc55abf
~~~
yarn add rn-splash-screen //重要，添加资源
react-native link rn-splash-screen //重要，设置依赖工程
~~~





#1217
### 安卓 iOS 白屏解决
https://github.com/rilyu/teaset




#1217
### A project committed to making file access and data transfer easier, efficient for React Native developers.
https://github.com/wkh237/react-native-fetch-blob

~~~
yarn add react-native-fetch-blob //重要，添加资源
react-native link react-native-fetch-blob
react-native unlink react-native-fetch-blob
yarn remove react-native-fetch-blob
~~~


#1217
### 
https://github.com/itinance/react-native-fs

~~~

yarn add react-native-fs //重要，添加资源
react-native link react-native-fs
react-native unlink react-native-fs
yarn remove react-native-fs
~~~





#1217
### 安卓 iOS 白屏解决
React Native 学习资源精选仓库(汇聚知识，分享精华)
汇集了各类react-native学习资料、工具、组件、开源App、资源下载、以及相关新闻等，只求精不求全。
https://github.com/crazycodeboy/react-native-awesome
http://www.devio.org/tags/#React%20Native

#1218
### 轮播视图
https://github.com/leecade/react-native-swiper
~~~
yarn add react-native-swiper
~~~



#1219
### 图片选择
iOS/Android image picker with support for camera, configurable compression, multiple images and cropping
https://github.com/ivpusic/react-native-image-crop-picker
~~~
yarn add react-native-image-crop-picker
react-native link react-native-image-crop-picker
~~~

#1220
### Base64 implementation for JavaScript
https://github.com/dankogai/js-base64
~~~
yarn add js-base64
~~~



#1220
### qr-js
qr.js is a pure JavaScript library for QR code generation using canvas.
https://www.npmjs.com/package/qr-js
~~~
yarn add qr.js
~~~

#1220
### 

Check and request user permissions in ReactNative (iOS and Android)

https://github.com/yonahforst/react-native-permissions
~~~
yarn add react-native-permissions
react-native link react-native-permissions

or 
npm install --save react-native-permissions
react-native link react-native-permissions
~~~

#1221
### react native 之上传文件 How to upload photo/file in react-native
https://github.com/g6ling/React-Native-Tips/tree/master/How_to_upload_photo%2Cfile_in%20react-native
http://blog.csdn.net/mr_linjw/article/details/56009001
https://github.com/benwixen/react-native-filesystem

#1222
### react native qiniu
https://github.com/qiniudemo/react-native-sdk


#1223
### react native 无法加载HTTP图像的解决办法
http://blog.csdn.net/fucuiping_1314/article/details/52596809

#1223
### React Native 中 component 生命周期
http://blog.csdn.net/ElinaVampire/article/details/51813677
http://img.blog.csdn.net/20160703034722480

#1223
###  react-native当点击TouchableOpacity时，要点击两下才会触发onPress解决办法
http://blog.csdn.net/u013751625/article/details/52840070

#1223
###  【React Native开发】React Native模块之Timers(定时器)详解(67)
http://www.lcode.org/
http://www.lcode.org/react-native%E6%A8%A1%E5%9D%97%E4%B9%8Btimers%E5%AE%9A%E6%97%B6%E5%99%A8%E8%AF%A6%E8%A7%A367/

#1223
###  【REACT NATIVE 系列教程之四】刷新组件RENDER(重新渲染)的三种方式详解
http://blog.csdn.net/xiaominghimi/article/details/51397192

#1223
###  解决FLATLIST数据不刷新的问题
http://reactnative.cn/docs/0.50/flatlist.html#content
extraData?: any 
如果有除data以外的数据用在列表中（不论是用在renderItem还是Header或者Footer中），
请在此属性中指定。同时此数据在修改时也需要先修改其引用地址（比如先复制到一个新的Object或者数组中）
，然后再修改其值，否则界面很可能不会刷新。


#1223
###  Array添加删除元素
http://www.jb51.net/article/60115.htm

#1223
###  date-fns —— 轻量级的 JavaScript 日期库 
https://coyee.com/article/12360-introduction-to-date-fns-a-lightweight-javascript-date-library

#1223
###  react native常见的错误 
http://blog.csdn.net/duyanglu/article/details/51554052
http://www.jianshu.com/p/98c8f2a970eb


#1223
###  #TO resolve bug of:uncompiled PNG file passed as argument. Must be compiled first into .flat file. 
https://stackoverflow.com/questions/45954209/issues-with-resources-generated-by-react-in-android-studio-3




#1223
###  #TO resolve bug of:unable to load script from assets 'index.android bundle'  ,make sure your bundle is packaged correctly or youu're runing a packager server 
http://blog.csdn.net/u014175342/article/details/73823904


#1224
###  ReactNative Text的属性和样式
http://blog.csdn.net/sjzx3142/article/details/53393310


#1224
###  Rename
https://github.com/junedomingo/react-native-rename




----------------------------
#适配
##1.ReactNative与Android中的屏幕适配
 http://blog.csdn.net/vv_bug/article/details/54958200
##2. react-native 屏幕尺寸和文字大小适配
http://blog.csdn.net/u011272795/article/details/73824558
##3. React-Native跨平台多屏幕尺寸适配方案一览
http://blog.csdn.net/jiangbo_phd/article/details/56681981

