import React, {Component} from 'react';
import {
    Text,
    View,
    Image,
    Alert,
    Button,
    Platform,
    StyleSheet,
    ScrollView,
    PixelRatio,
    Dimensions,
    TouchableOpacity,
    ActivityIndicator,
} from 'react-native';


import ToastManager from '../../../../utils/toast/Toast.util'
import NetworkCommonUtil from '../../../../utils/network.common.util'
import HeaderCommonView from '../../../views/header/header.common.view'
import UserDataManager from '../../../../utils/storage/user.data.manager.common.util'
import BaseActivity from "../../../views/base.activity";

export default class NotificationMainScreen extends BaseActivity {
    //1.
    constructor(props) {
        super(props);
        this.state = {
            mobileUserData: null,
            responValue: null,
            backNormalShow: '加载中...',
        };
    }

    //2.
    componentWillMount() {
        super.componentWillMount();
        this._refreshUserData().then((ret) => {
            this._initGetIsMeNotifications();
        });
    }

    //3.
    componentDidMount() {
        super.componentDidMount();
    }

    //4.
    componentWillUnmount() {
        super.componentWillUnmount();
    }

    //5.查询本地缓存用户数据
    _refreshUserData = () => {
        return UserDataManager.getInstance().load().then((ret) => {
            if (ret) {
                this.setState({
                    mobileUserData: ret,
                });
            }
            return ret;
        });
    };
    //6.拉取数据
    _initGetIsMeNotifications = () => {
        if (!this.state.mobileUserData || !this.state.mobileUserData.data) {
            return;
        }
        let params = {
            receUserId: this.state.mobileUserData.data.id,
        };
        NetworkCommonUtil.httpPostRequest(JSON.stringify(params), NetworkCommonUtil.SERVERURL_POST_API_MOBILE_NOTI_FOR_EMPLOYER_FIND_ALL_OF_ME).then((val: any) => {
            // alert(JSON.stringify(val));
            if (val && val.code === NetworkCommonUtil.SERVER_HTTP_TASK_STATUS_SUCCESS) {
                if (val.data && val.data.length > 0) {
                    this.setState({
                        responValue: val,
                        backNormalShow: null,
                    });
                } else {
                    this.setState({
                        responValue: null,
                        backNormalShow: '暂无任何新消息',
                    });
                }
            } else if (val) {
                this.setState({
                    responValue: null,
                    backNormalShow: '暂无任何新消息',
                });
            } else {
                ToastManager.show('请求网络出错' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            }
        });
    };

    //页面跳转
    _pushCompoent = (component: Component, params: any) => {
        if (!component) {
            return;
        }
        this.props.navigator.push({
            component: component,
            params: params,
        });
    };


    render() {
        return (
            <View style={NotificationMainScreenStyles.container}>
                <HeaderCommonView navigator={this.props.navigator}
                                  bgColor={'#FFCC33'}
                                  headerLeftShow={true}
                                  headerCenterShow={true}
                                  headerRightShow={false}
                                  showCenterAfterLeft={true}
                                  headerCenterTitle={'通知'}/>
                <View style={NotificationMainScreenStyles.function_list}>
                    {this.state.responValue ?
                        <View/>
                        :
                        <Text style={NotificationMainScreenStyles.normal_text}>
                            {this.state.backNormalShow}
                        </Text>
                    }
                </View>

            </View>
        );
    };
}

NotificationMainScreenStyles = StyleSheet.create({
    //基于flex-box布局
    container: {
        flex: 1,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FBFBFB',
    },
    function_list: {
        flex: 1,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FBFBFB',
        alignItems: 'center',
        justifyContent: 'center',
    },
    normal_text: {
        fontSize: 16,
    }
});