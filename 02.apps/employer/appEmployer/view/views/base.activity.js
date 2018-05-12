import React, {PureComponent, Component} from 'react';
import {
    Platform,
    BackAndroid,
    BackHandler,
    Navigator,
    Dimensions,
} from 'react-native';

import ToastManager from '../../utils/toast/Toast.util'

const {
    width,
    height
} = Dimensions.get('window');

let mainPressBackTimes = 0;


export default class BaseActivity extends Component {

    //1.
    constructor(props) {
        super(props);
    }

    //2.
    componentWillMount() {
        //判断是否为安卓系统，如果是则监听物理按键回退事件
        if (Platform.OS === 'android') {
            BackHandler.addEventListener('hardwareBackPress', this._onHardWareBackPressed);
        }
    }

    //3.
    /**
     * 页面渲染完毕执行
     */
    componentDidMount() {

    }


    //4.
    /**
     * 页面退出时执行
     */
    componentWillUnmount() {
        //判断是否为安卓系统，如果是则关闭 监听物理按键回退事件
        if (Platform.OS === 'android') {
            BackHandler.removeEventListener('hardwareBackPress', this._onHardWareBackPressed);
        }
    }


    _isMainScreen(): boolean {
        return false;
    };

    _goBack() {
        if (this.props.navigator) {
            this.props.navigator.pop();
        }
    };

    _onHardWareBackPressed = () => {
        if (!this._isMainScreen()) {
            this._goBack();
            return true;
        } else {
            if (mainPressBackTimes && mainPressBackTimes + 2000 >= Date.now()) {
                //最近2秒内按过back键，可以退出应用。
                BackHandler.exitApp();
                return false;
            }
            ToastManager.show('再点击一次退出程序' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            mainPressBackTimes = Date.now();
            return true;
        }
        return true;
    };

    // //页面跳转
    // _pushCompoent = (component: Component, params: any, navigator: any) => {
    //     if (this.props.navigator) {
    //         this.props.navigator.push({
    //             component: component,
    //             params: params,
    //         });
    //     }
    // };
    //
    // //页面跳转
    // _popSeltCompoent = (navigator: Navigator) => {
    //     if (this.props.navigator) {
    //         this.props.navigator.pop();
    //     }
    // }
}