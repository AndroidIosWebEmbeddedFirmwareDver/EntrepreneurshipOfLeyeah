import React, {Component, Animated, Easing} from 'react';
import {
    View,
    AppRegistry,
    Platform,
} from 'react-native';

import {
    Navigator,
} from 'react-native-deprecated-custom-components';

import SplashScreen from "rn-splash-screen"
import ToastManager from "./utils/toast/Toast.util"
import MainActivity from './view/main/main.activity'
import NetworkCommonUtil from './utils/network.common.util'
import UserDataManager from './utils/storage/user.data.manager.common.util'
import PermissionAndroidCommonUtil from './utils/permission/android/permission.common'

let AMAP_WEB_KEY = '8437e6fa5c996e77d96bf35850928d40';
//逆地理编码API服务地址
let AMAP_REGEO_URL = 'http://restapi.amap.com/v3/geocode/regeo?parameters';

export default class EmployeeAppliction extends Component {
    constructor(props) {
        super(props);
    }

    //1.Component即将加载
    componentWillMount() {
        this._init_application();
    }

    //2.Component加载完毕
    componentDidMount() {
        // Hide the active splash screen
        SplashScreen.hide();
    }

    _init_application = () => {
        if (Platform.OS === 'android') {
            //申请权限
            if (!PermissionAndroidCommonUtil._checkPermission(PermissionAndroidCommonUtil.androidPermissions.ACCESS_FINE_LOCATION)) {
                PermissionAndroidCommonUtil._requestPermission(PermissionAndroidCommonUtil.androidPermissions.ACCESS_FINE_LOCATION);
            }
            if (!PermissionAndroidCommonUtil._checkPermission(PermissionAndroidCommonUtil.androidPermissions.ACCESS_COARSE_LOCATION)) {
                PermissionAndroidCommonUtil._requestPermission(PermissionAndroidCommonUtil.androidPermissions.ACCESS_COARSE_LOCATION);
            }
        }
        if (navigator.geolocation) {
            this.getPosition();
        }
    };


    /** 获取地理位置（经纬度） */
    getPosition = (): void => {
        /** 获取地理位置 */
        navigator.geolocation.getCurrentPosition(
            (position: any) => {
                // console.warn('成功：' + JSON.stringify(position));
                // ToastManager.alertWithSure('获取位置成功', '' + JSON.stringify(position), () => {
                // });
                const positionData: any = position.coords;
                // 经度：positionData.longitude
                // 纬度：positionData.latitude
                UserDataManager.getInstance().saveAppPosition(positionData.longitude, positionData.latitude);
                // 最后一步 todo：高德 || 百度地图逆地理编码转~~具体就是调个接口把经纬度丢进去就行了
                this._re_geo_loacation(positionData.longitude, positionData.latitude);
            },
            (error: any) => {
                // console.warn('失败：' + JSON.stringify(error.message));
                // ToastManager.alertWithSure('失败', '' + JSON.stringify(error.message), () => {
                // });
            }, {
                // 提高精确度，但是获取的速度会慢一点
                enableHighAccuracy: false,
                // 设置获取超时的时间20秒
                timeout: 20000,
                // 示应用程序的缓存时间，每次请求都是立即去获取一个全新的对象内容
                maximumAge: 1000,
            }
        );
    };
    _re_geo_loacation = (longitude, latitude) => {
        let location = '' + longitude + ',' + latitude;//116.481488,39.990464 经纬度坐标;最多支持20个坐标点;多个点之间用"|"分割。
        let poitype = '商务写字楼';//支持传入POI TYPECODE及名称；支持传入多个POI类型，多值间用“|”分隔
        let radius = 1000;//查询POI的半径范围。取值范围：0~3000,单位：米
        let extensions = 'all';//返回结果控制
        let batch = false;//batch=true为批量查询。batch=false为单点查询
        let roadlevel = 0;//可选值：1，当roadlevel=1时，过滤非主干道路，仅输出主干道路数据
        let realUrl = '' + AMAP_REGEO_URL + '?output=json&location=' + location
            + '&key=' + AMAP_WEB_KEY
            + '&radius=' + radius
            + '&poitype=' + poitype
            + '&extensions=' + extensions
            + '&batch=' + batch
            + '&roadlevel=' + roadlevel;
        NetworkCommonUtil.httpGetRequest(realUrl).then((val: any) => {
            // alert(JSON.stringify(val));
            if (val && val.status === 1 && val.regeocode) {
                // this.setState({responValue: val});
                UserDataManager.getInstance().saveAppPosition(val.regeocode.formatted_address);
            }
        });
    };

    //子级回调刷新
    _onUserDataRefreshCallback = () => {
        this._init_application();
    };


    render() {
        let defaultName = 'MainActivity';
        // 控制器的跳转是根据这个参数信息来进行路由查找的
        let defaultComponent = MainActivity;

        return (
            <Navigator
                // 初始化路由，导航控制器是通过component参数来查找要跳转到的控制器
                initialRoute={{
                    name: defaultName,
                    component: defaultComponent,
                }}
                // 设置导航控制器的跳转方式
                //设置不会滑动超出范围
                configureScene={(route) => ({
                    ...Navigator.SceneConfigs.HorizontalSwipeJump,
                    gestures: {pop: false}
                })}

                // configureScene={(route) => {
                //     return Navigator.SceneConfigs.HorizontalSwipeJump;
                // }}

                // 渲染场景
                renderScene={(route, navigator) => {
                    let Component = route.component;
                    //这个语法是把 routes.params 里的每个key作为props的一个属性，在下个页面即可用this. props.id调用
                    //navigator对象在导航容器跳转时一直存在
                    return <Component {...route.params} navigator={navigator}
                                      onUserDataRefreshCallback={() => this._onUserDataRefreshCallback()}/>
                }}
            />
        );
    }
}
