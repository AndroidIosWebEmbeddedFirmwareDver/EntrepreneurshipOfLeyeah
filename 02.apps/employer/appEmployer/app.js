import React, {Component, Animated, Easing} from 'react';
import {
    StackNavigator,
    createNavigator,
    TabNavigator,
    StackRouter,
} from 'react-navigation';

import {
    View,
    AppRegistry,
    Platform,
} from 'react-native';

import {
    Navigator,
} from 'react-native-deprecated-custom-components';

import MainScreen from './view/main/main.screen'
import SplashScreen from "rn-splash-screen";


//方案三
export default class EmployerAppliction extends Component {
    constructor(props) {
        super(props);
    }

    //1.Component即将加载
    componentWillMount() {

    }

    //2.Component加载完毕
    componentDidMount() {
        // Hide the active splash screen
        SplashScreen.hide();
    }


    render() {
        let defaultName = 'MainScreen';
        // 控制器的跳转是根据这个参数信息来进行路由查找的
        let defaultComponent = MainScreen;
        if (Platform.OS === 'android') {
            //
        }
        return (
            <Navigator
                // 初始化路由，导航控制器是通过component参数来查找要跳转到的控制器
                initialRoute={{name: defaultName, component: defaultComponent}}
                // 设置导航控制器的跳转方式
                // configureScene={(route) => {
                //     return Navigator.SceneConfigs.HorizontalSwipeJump;
                // }}
                //设置不会滑动超出范围
                configureScene={(route) => ({
                    ...Navigator.SceneConfigs.HorizontalSwipeJump,
                    gestures: {pop: false}
                })}

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
