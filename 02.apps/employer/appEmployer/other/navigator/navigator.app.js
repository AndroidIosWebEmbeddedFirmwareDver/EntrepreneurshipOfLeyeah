import React, {Component, Animated, Easing} from 'react';
import {
    StackNavigator,
    createNavigator,
    TabNavigator,
    StackRouter,
} from 'react-navigation';

import {
    View,
    AppRegistry
} from 'react-native';

import {
    Navigator,
} from 'react-native-deprecated-custom-components';

import NavigatorMainScreen from './navigator.screen'
//方案三
export default class appTempleApp extends Component {
    render() {
        let defaultName = 'NavigatorMainScreen';
        // 控制器的跳转是根据这个参数信息来进行路由查找的
        let defaultComponent = NavigatorMainScreen;
        return (
            <Navigator
                // 初始化路由，导航控制器是通过component参数来查找要跳转到的控制器
                initialRoute={{name: defaultName, component: defaultComponent}}
                // 设置导航控制器的跳转方式
                configureScene={(route) => {
                    return Navigator.SceneConfigs.HorizontalSwipeJumpFromRight;
                }}

                // 渲染场景
                renderScene={(route, navigator) => {
                    let Component = route.component;
                    //这个语法是把 routes.params 里的每个key作为props的一个属性，在下个页面即可用this. props.id调用
                    //navigator对象在导航容器跳转时一直存在
                    return <Component {...route.params} navigator={navigator}/>
                }}
            />
        );
    }
}



