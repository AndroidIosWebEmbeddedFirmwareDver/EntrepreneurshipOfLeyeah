import React, {Component} from 'react';
import {
    Text,
    View,
    Alert,
    Image,
    Button,
    Platform,
    ScrollView,
    Dimensions,
    PixelRatio,
    ActivityIndicator,
    TouchableOpacity,
} from 'react-native';

import styles from './main.style'
import MainScreenHeaderItem from './mainview/main.screen.header.item.main'
import MainScreenBorderItem from './mainview/main.screen.border.item.main'
import ToastManager from '../../utils/toast/Toast.util'

import BaseActivity from '../views/base.activity'
import UserRnaStatus from '../../stable/json/user.rna.status'

import MeRnaActivity from './plugin/account/data/rna/me.rna.activity'

import HireMainScreen from './plugin/hire/hire.mian.screen'
import FindMainScreen from './plugin/find/find.mian.screen'
import AdminMainScreen from './plugin/admin/admin.mian.screen'
import BillsMianScreen from './plugin/bills/bills.mian.screen'
import NotificationMainScreen from './plugin/notification/notification.mian.screen'
import AccountMainScreen from './plugin/account/account.mian.screen'
import LoginMainSystemScreen from './login/login.main.system.screen'
import UserDataManager from '../../utils/storage/user.data.manager.common.util'


export default class MainScreen extends BaseActivity {

    //-----------------------------------------------------
    //1.构造函数
    constructor(props) {
        super(props);
        this.state = {
            mobileUserData: null,
            headBarColor: null,
            statusBarColor: null,
        };
    }

    //2.Component将要加载
    componentWillMount() {
        super.componentWillMount();
        this._refreshUserData().then(data => {
            if (data) {

            }
        });
    }

    //3.Component加载完毕
    componentDidMount() {
        super.componentDidMount();
    }

    //4.Component将要移除
    componentWillUnmount() {
        super.componentWillUnmount();
    }


    _isMainScreen(): boolean {
        return true;
    }

    //-----------------------------------------------------

    //1.查询本地缓存用户数据
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

    //3.去登录
    _gotoLoginComponent = () => {
        this.props.navigator.push({
            component: LoginMainSystemScreen,
            params: {loginSuccessCallback: this._loginSuccessCallback},
        });
    };

    //4.页面跳转
    _pushCompoent = (component: Component, params: any, checkRna) => {
        if (!this.state.mobileUserData) {
            this._gotoLoginComponent();
        } else if (checkRna && !UserRnaStatus.checkRna(this.state.mobileUserData.data.beRna)) {
            ToastManager.alertWithSure('提示', '检测到您还未实名认证，请先实名认证。', () => {
                this._pushCompoent(MeRnaActivity, {
                    mobileUserData: this.state.mobileUserData,
                    onUserDataRefreshCallback: this._onUserDataRefreshCallback
                }, false)
            });
        } else if (component) {
            this.props.navigator.push({
                component: component,
                params: params,
            });
        }
    };


    //5.登录成功回调
    _loginSuccessCallback = () => {
        this._refreshUserData().then((ret) => {
            if (this._mainHomeFragment) {
                this._mainHomeFragment._refreshUserData();
            }
        });
    };
    //6.子级回调刷新
    _onUserDataRefreshCallback = (index) => {
        this._refreshUserData();
    };
    //6.退出成功回调
    _onLogoutSuccessCallback = () => {
        UserDataManager.getInstance().removeAll();
        this.setState({
            mobileUserData: null,
        });
    };


    _hireCallbackPushCompoentToSuccess = (selectedPushHireType) => {
    };

    render() {
        const {navigator} = this.props.navigator;
        return (
            <ScrollView style={{
                backgroundColor: '#f0f0f0',}}>
                <View style={styles.container}>
                    {/*header*/}
                    <MainScreenHeaderItem

                        mobileUserId={this.state.mobileUserData && this.state.mobileUserData.data && this.state.mobileUserData.data.name ? this.state.mobileUserData.data.name : ''}
                        mobileUserAvatorUrl={this.state.mobileUserData && this.state.mobileUserData.data && this.state.mobileUserData.data.avatarUrl ? {uri: this.state.mobileUserData.data.avatarUrl} : require('../../stable/image/app_a.png')}
                        mobileUserBeRna={UserRnaStatus.rnaShow(this.state.mobileUserData)}
                        mobileUserScore={this.state.mobileUserData && this.state.mobileUserData.data ? this.state.mobileUserData.data.score : ''}

                        headerNotificationOnpress={() => this._pushCompoent(NotificationMainScreen, {
                            mobileUserData: this.state.mobileUserData,
                            onUserDataRefreshCallback: this._onUserDataRefreshCallback,
                        })}
                        headerAccountOnpress={() => this._pushCompoent(AccountMainScreen, {
                            mobileUserData: this.state.mobileUserData,
                            onLogoutSuccessCallback: this._onLogoutSuccessCallback,
                            onUserDataRefreshCallback: this._onUserDataRefreshCallback,
                        })}
                        headerNotificationIcon={require('../../stable/image/ic_app_notificationn.png')}
                    />
                    {/*bodyer*/}
                    <View style={styles.bodyer}>
                        <MainScreenBorderItem
                            _index={'0'}
                            item1ImageUri={require('../../stable/image/main/ic_main_hire.png')}
                            // item2Title={'发布工作'}
                            item2Title={'实时订单'}
                            item3ImageUri={require('../../stable/image/ic_app_more.png')}
                            itemOnpress={() => this._pushCompoent(HireMainScreen, {
                                mobileUserData: this.state.mobileUserData,
                                hireCallbackPushCompoentToSuccess: this._hireCallbackPushCompoentToSuccess,
                                onUserDataRefreshCallback: this._onUserDataRefreshCallback,
                            }, true)}
                        />
                        <MainScreenBorderItem
                            _index={'1'}
                            item1ImageUri={require('../../stable/image/main/ic_main_find.png')}
                            // item2Title={'直接聘请工人'}
                            item2Title={'简历库'}
                            item3ImageUri={require('../../stable/image/ic_app_more.png')}
                            itemOnpress={() => this._pushCompoent(FindMainScreen, {
                                mobileUserData: this.state.mobileUserData,
                                onUserDataRefreshCallback: this._onUserDataRefreshCallback,
                            }, true)}
                        />
                        <MainScreenBorderItem
                            _index={'2'}
                            item1ImageUri={require('../../stable/image/main/ic_main_admin.png')}
                            item2Title={'管理工作'}
                            item3ImageUri={require('../../stable/image/ic_app_more.png')}
                            itemOnpress={() => this._pushCompoent(AdminMainScreen, {
                                mobileUserData: this.state.mobileUserData,
                                onUserDataRefreshCallback: this._onUserDataRefreshCallback,
                            }, true)}
                        />
                        <MainScreenBorderItem
                            _index={'3'}
                            item1ImageUri={require('../../stable/image/main/ic_main_bills.png')}
                            item2Title={'我的账单'}
                            item3ImageUri={require('../../stable/image/ic_app_more.png')}
                            itemOnpress={() => this._pushCompoent(BillsMianScreen, {
                                mobileUserData: this.state.mobileUserData,
                                onUserDataRefreshCallback: this._onUserDataRefreshCallback,
                            }, true)}
                        />
                    </View>
                </View>
            </ScrollView>
        );
    }
}

