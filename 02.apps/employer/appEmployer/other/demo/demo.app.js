// import React, {Component, Animated, Easing} from 'react';
// import {
//     StackNavigator,
//     createNavigator,
//     TabNavigator,
//     StackRouter,
// } from 'react-navigation';
//
// import {
//     View,
//     AppRegistry
// } from 'react-native';
//
// import {
//     Navigator,
// } from 'react-native-deprecated-custom-components';
//
// import MainScreen from './main/main.screen'
// import HireMainScreen from './main/plugin/hire/hire.mian.screen'
// import FindMainScreen from './main/plugin/find/find.mian.screen'
// import AdminMainScreen from './main/plugin/admin/admin.mian.screen'
// import OrderMainScreen from './main/plugin/order/order.mian.screen'
// import NotificationMainScreen from './main/plugin/notification/notification.mian.screen'
// import AccountMainScreen from './main/plugin/account/account.mian.screen'
//
// import WorkTypeHireScreen from './main/plugin/hire/workType/work.type.hire.screen'
//
// import NavigatorMainScreen from './other/navigator/navigator.screen'
//
// import styles from './app.style'
//
//
// //方案一
// // export default appTempleApp = StackNavigator(
// //     {
// //         MainScreen: {screen: MainScreen},
// //         HireMainScreen: {screen: HireMainScreen},
// //         FindMainScreen: {screen: FindMainScreen},
// //         AdminMainScreen: {screen: AdminMainScreen},
// //         OrderMainScreen: {screen: OrderMainScreen},
// //         NotificationMainScreen: {screen: NotificationMainScreen},
// //         AccountMainScreen: {screen: AccountMainScreen},
// //
// //         WorkTypeHireScreen: {screen: WorkTypeHireScreen},
// //     },
// //     {
// //         headerMode: 'none',//设置为无默认头部样式
// //         mode: 'modal',
// //         navigationOptions: {
// //             gesturesEnabled: false,
// //         },
// //         transitionConfig: () => ({
// //             transitionSpec: {
// //                 duration: 100,
// //                 // easing: Easing.out(Easing.poly(4)),
// //                 // timing: Animated.timing,
// //             },
// //             screenInterpolator: sceneProps => {
// //                 const {layout, position, scene} = sceneProps;
// //                 const {index} = scene;
// //
// //                 const height = layout.initHeight;
// //                 const translateY = position.interpolate({
// //                     inputRange: [index - 1, index, index + 1],
// //                     outputRange: [height, 0, 0],
// //                 });
// //
// //                 const opacity = position.interpolate({
// //                     inputRange: [index - 1, index - 0.99, index],
// //                     outputRange: [0, 1, 1],
// //                 });
// //
// //                 return {opacity, transform: [{translateY}]};
// //             },
// //         }),
// //     }
// // );
//
//
// // 方案二
//
// // export default class appTempleApp extends Component {
// //     render() {
// //         return (
// //             <MainScreen/>
// //         );
// //     }
// // }
//
//
// //方案三
// export default class EmployerAppliction extends Component {
//     render() {
//         let defaultName = 'NavigatorMainScreen';
//         // 控制器的跳转是根据这个参数信息来进行路由查找的
//         let defaultComponent = NavigatorMainScreen;
//         return (
//             <Navigator
//                 // 初始化路由，导航控制器是通过component参数来查找要跳转到的控制器
//                 initialRoute={{name: defaultName, component: defaultComponent}}
//                 // 设置导航控制器的跳转方式
//                 configureScene={(route) => {
//                     return Navigator.SceneConfigs.HorizontalSwipeJumpFromRight;
//                 }}
//
//                 // 渲染场景
//                 renderScene={(route, navigator) => {
//                     let Component = route.component;
//                     //这个语法是把 routes.params 里的每个key作为props的一个属性，在下个页面即可用this. props.id调用
//                     //navigator对象在导航容器跳转时一直存在
//                     return <Component {...route.params} navigator={navigator}/>
//                 }}
//             />
//         );
//     }
// }
