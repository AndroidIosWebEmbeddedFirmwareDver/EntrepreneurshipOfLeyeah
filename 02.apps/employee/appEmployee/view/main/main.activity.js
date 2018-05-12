import React, {PureComponent} from 'react';

import {
    StyleSheet,
    View,
    Text,
    Platform,
    TouchableOpacity,
    Image,
} from 'react-native';

import BaseActivity from '../views/base.activity'
import ToastManager from '../../utils/toast/Toast.util'
import MainMeFragment from './fragment/main.me.fragment'
import MainFragmentHeaderView from './fragment/header.view'
import MainHomeFragment from './fragment/main.home.fragment'
import MainFindFragment from './fragment/main.find.fragment'
import MainChatFragment from './fragment/main.chat.fragment'
import LoginSetResumeScreen from './login/login.set.resume.screen'
import LoginMainSystemScreen from './login/login.main.system.screen'
import MainNotificationActivity from './notifi/main.notification.activity'
import UserDataManager from '../../utils/storage/user.data.manager.common.util'
import MeWorkActivity from "./fragment/me/me.work.activity";


export default class MainActivity extends BaseActivity {
    //1.
    constructor(props) {
        super(props);
        this.state = {
            showCenterGo: false,
            selectedTabBarItemIndex: 0,
            headBarColor: null,
            headBarLeftText: null,
            headBarRightText: null,
            statusBarColor: null,
            mobileUserData: null,
        };
    }

    //2.
    componentWillMount() {
        super.componentWillMount();
        this._init_local_data();
    }

    //3.
    componentDidMount() {
        super.componentDidMount();
    }

    componentWillUnmount() {
        super.componentWillUnmount();
    }

    _isMainScreen(): boolean {
        return true;
    }

    _init_local_data = () => {
        this._refreshUserData().then((ret) => {
            this._onTabBarItemTouch(0, true);
            // this.setState({
            //     isMeIsTheMainScreen: true,
            // });
        });
    };
    /**
     * 检测并处理是否已经设置完整的简历
     * @private
     */
    _checkIsHadSetResumeAndDo = () => {
        if (!UserDataManager.getInstance().isHadSetFullResume()) {
            ToastManager.alertWithSure('提示', '亲~系统检测到您还未填写完整的个人资料哟，请填好写完整的个人资料后再继续使用吧。', () => {
                this._pushCompoent(LoginSetResumeScreen, {
                    onSetFullResumeCallback: () => {
                        this._init_local_data();
                    }
                });
            });
        }
    };


    //提示信息
    _noticeNotLoginAndAskIsIFNeedLogion = () => {
        ToastManager.alertDialog('提示', '检测到还未登录,是否立即登录！', '稍后提示我', () => {
        }, '现在去登录', () => {
            this._gotoLoginComponent();
        });
    };

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
    //去登录
    _gotoLoginComponent = () => {
        this.props.navigator.push({
            component: LoginMainSystemScreen,
            params: {loginSuccessCallback: this._loginSuccessCallback},
        });
    };

    //页面跳转
    _pushCompoent = (component: Component, params: any) => {
        if (!this.state.mobileUserData) {
            // this._noticeNotLoginAndAskIsIFNeedLogion();
            this._gotoLoginComponent();
        } else if (component !== null) {
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
            this._checkIsHadSetResumeAndDo();
        });

        if (this.props.onUserDataRefreshCallback) {
            this.props.onUserDataRefreshCallback();
        }
    };

    //6.退出成功回调
    _onLogoutSuccessCallback = () => {
        UserDataManager.getInstance().removeAll();
        this._onTabBarItemTouch(0, false);
        this.setState({
            mobileUserData: null,
        });
    };


    //7.切换tab
    _onTabBarItemTouch = (index, checkIsHadSetResume: boolean) => {
        if (typeof(this.state.mobileUserData) === "undefined" || !this.state.mobileUserData) {
            this._gotoLoginComponent();
        } else {
            if (checkIsHadSetResume && index !== 3) {
                this._checkIsHadSetResumeAndDo();
            } else if (index === -1) {
                this._pushCompoent(MeWorkActivity, {}, true);
            } else {
                this.setState({
                    selectedTabBarItemIndex: index,
                });
            }
        }
    };

    //8.子级回调刷新
    _onUserDataRefreshCallback = (index) => {
        this._refreshUserData();
    };

    _changeStatusColor = (color) => {
        if (color) {
            this.setState({
                statusBarColor: color,
            });
        }
    };

    _changeHeadbar = (headBarColor, headBarLeftText, headBarRightText) => {
        if (headBarColor) {
            this.setState({
                headBarColor: headBarColor,
            });
        }
        if (headBarLeftText) {
            this.setState({
                headBarLeftText: headBarLeftText,
            });
        }
        if (headBarRightText) {
            this.setState({
                headBarRightText: headBarRightText,
            });
        }
    };


    _geneerTabContentComponet = (index) => {
        switch (index) {
            case 0:
                return (
                    <MainHomeFragment
                        ref={(mainHomeFragment) => this._mainHomeFragment = mainHomeFragment}
                        navigator={this.props.navigator}
                        changeStatusColor={(color) => this._changeStatusColor(color)}
                        goLogin={() => this._gotoLoginComponent()}
                        onUserDataRefreshCallback={() => this._onUserDataRefreshCallback()}
                        changeHeadbar={(headBarColor, headBarLeftText, headBarRightText) => this._changeHeadbar(headBarColor, headBarLeftText, headBarRightText)}
                    />
                );
            case 1:
                return (
                    <MainFindFragment
                        navigator={this.props.navigator}
                        changeStatusColor={(color) => this._changeStatusColor(color)}
                        onUserDataRefreshCallback={() => this._onUserDataRefreshCallback()}
                        changeHeadbar={(headBarColor, headBarLeftText, headBarRightText) => this._changeHeadbar(headBarColor, headBarLeftText, headBarRightText)}
                    />
                );
            case 2:
                return (
                    <MainChatFragment
                        navigator={this.props.navigator}
                        changeStatusColor={(color) => this._changeStatusColor(color)}
                        onUserDataRefreshCallback={() => this._onUserDataRefreshCallback()}
                        changeHeadbar={(headBarColor, headBarLeftText, headBarRightText) => this._changeHeadbar(headBarColor, headBarLeftText, headBarRightText)}
                    />
                );
            case 3:
                return (
                    <MainMeFragment
                        navigator={this.props.navigator}
                        changeStatusColor={(color) => this._changeStatusColor(color)}
                        onUserDataRefreshCallback={() => this._onUserDataRefreshCallback()}
                        changeHeadbar={(headBarColor, headBarLeftText, headBarRightText) => this._changeHeadbar(headBarColor, headBarLeftText, headBarRightText)}
                        onLogoutSuccessCallback={() => this._onLogoutSuccessCallback()}
                    />
                );
        }
    };

    _geneerTabBarItem = (index) => {
        let templeItem = {icon: '', textTitle: '', textColor: ''};
        switch (index) {
            case 0:
                templeItem.textTitle = '抢单模式';
                if (this.state.selectedTabBarItemIndex === index) {
                    templeItem.icon = require('../../stable/image/main/ic_main_home_pressed.png');
                    templeItem.textColor = '#FFCC33';
                    return templeItem;
                } else {
                    templeItem.icon = require('../../stable/image/main/ic_main_home_normal.png');
                    templeItem.textColor = '#979797';
                    return templeItem;
                }
            case 1:
                templeItem.textTitle = '招聘信息';
                if (this.state.selectedTabBarItemIndex === index) {
                    templeItem.icon = require('../../stable/image/main/ic_main_find_pressed.png');
                    templeItem.textColor = '#FFCC33';
                    return templeItem;
                } else {
                    templeItem.icon = require('../../stable/image/main/ic_main_find_normal.png');
                    templeItem.textColor = '#979797';
                    return templeItem;
                }
            case 2:
                templeItem.textTitle = '工友圈';
                if (this.state.selectedTabBarItemIndex === index) {
                    templeItem.icon = require('../../stable/image/main/ic_main_chat_pressed.png');
                    templeItem.textColor = '#FFCC33';
                    return templeItem;
                } else {
                    templeItem.icon = require('../../stable/image/main/ic_main_chat_normal.png');
                    templeItem.textColor = '#979797';
                    return templeItem;
                }
            case 3:
                templeItem.textTitle = '管理';
                if (this.state.selectedTabBarItemIndex === index) {
                    templeItem.icon = require('../../stable/image/main/ic_main_me_pressed.png');
                    templeItem.textColor = '#FFCC33';
                    return templeItem;
                } else {
                    templeItem.icon = require('../../stable/image/main/ic_main_me_normal.png');
                    templeItem.textColor = '#979797';
                    return templeItem;
                }
        }
    };


    //4.
    render() {
        return (
            <View style={MainActivityStyles.root}>
                <View
                    style={[MainActivityStyles.ststusBar, this.state.statusBarColor ? {backgroundColor: this.state.statusBarColor} : {}]}/>
                <MainFragmentHeaderView
                    rootBgColor={this.state.headBarColor}
                    headerLeftText={this.state.headBarLeftText}
                    headerRightText={this.state.headBarRightText}
                    showNotifiction={true}
                    onUserDataRefreshCallback={() => this._onUserDataRefreshCallback()}
                    onNotifictionPressed={() => this._pushCompoent(MainNotificationActivity, {})}
                />

                <View style={MainActivityStyles.head}>
                    {this._geneerTabContentComponet(this.state.selectedTabBarItemIndex)}
                </View>

                <View style={MainActivityStyles.bottom}>
                    <TouchableOpacity
                        onPress={() => this._onTabBarItemTouch(0)}
                        style={MainActivityStyles.bottomItem}>

                        <Image
                            source={this._geneerTabBarItem(0).icon}
                            style={MainActivityStyles.bottomItemIcon}
                        />
                        <Text style={[MainActivityStyles.normal_text, {
                            fontSize: 12,
                            color: this._geneerTabBarItem(0).textColor,
                            marginTop: 9.6 / 2,
                        }]}>
                            {this._geneerTabBarItem(0).textTitle}
                        </Text>
                    </TouchableOpacity>
                    <TouchableOpacity
                        onPress={() => this._onTabBarItemTouch(1)}
                        style={MainActivityStyles.bottomItem}>
                        <Image
                            source={this._geneerTabBarItem(1).icon}
                            style={MainActivityStyles.bottomItemIcon}
                        />
                        <Text style={[MainActivityStyles.normal_text, {
                            fontSize: 12,
                            color: this._geneerTabBarItem(1).textColor,
                            marginTop: 9.6 / 2,
                        }]}>
                            {this._geneerTabBarItem(1).textTitle}
                        </Text>
                    </TouchableOpacity>
                    {this.state.showCenterGo ?
                        <View style={[MainActivityStyles.bottomItem, {}]}>
                            <TouchableOpacity
                                onPress={() => this._onTabBarItemTouch(-1)}
                                style={[MainActivityStyles.bottomItem, {
                                    flex: 0,
                                    width: 54,
                                    height: 54,
                                    // backgroundColor: 'rgba(0, 0, 0, 0.56)',
                                    backgroundColor: '#FBFBFB',
                                    alignItems: 'center',
                                    justifyContent: 'center',
                                    borderRadius: 54 / 2,
                                    // borderColor: 'rgba(0, 0, 0, 0)',
                                    borderColor: '#FBFBFB',
                                    borderWidth: 2,
                                }]}>
                                <Image
                                    source={require('../../stable/image/main/ic_main_work_go_nm.png')}
                                    style={{width: 36, height: 36, resizeMode: 'center',}}
                                />
                                {/*<Text style={[MainActivityStyles.normal_text, {*/}
                                {/*fontSize: 14,*/}
                                {/*color: this._geneerTabBarItem(2).textColor,*/}
                                {/*marginTop: 9.6 / 2,*/}
                                {/*}]}>*/}
                                {/*{this._geneerTabBarItem(2).textTitle}*/}
                                {/*</Text>*/}
                            </TouchableOpacity>
                        </View>
                        : <View/>
                    }
                    <TouchableOpacity
                        onPress={() => this._onTabBarItemTouch(2)}
                        style={MainActivityStyles.bottomItem}>
                        <Image
                            source={this._geneerTabBarItem(2).icon}
                            style={MainActivityStyles.bottomItemIcon}
                        />
                        <Text style={[MainActivityStyles.normal_text, {
                            fontSize: 12,
                            color: this._geneerTabBarItem(2).textColor,
                            marginTop: 9.6 / 2,
                        }]}>
                            {this._geneerTabBarItem(2).textTitle}
                        </Text>
                    </TouchableOpacity>
                    <TouchableOpacity
                        onPress={() => this._onTabBarItemTouch(3)}
                        style={MainActivityStyles.bottomItem}>
                        <Image
                            source={this._geneerTabBarItem(3).icon}
                            style={MainActivityStyles.bottomItemIcon}
                        />
                        <Text style={[MainActivityStyles.normal_text, {
                            fontSize: 12,
                            color: this._geneerTabBarItem(3).textColor,
                            marginTop: 9.6 / 2,
                        }]}>
                            {this._geneerTabBarItem(3).textTitle}
                        </Text>
                    </TouchableOpacity>
                </View>
            </View>
        );
    }
}

MainActivityStyles = StyleSheet.create({
    root: {
        flex: 1,
        flexDirection: 'column',
    },
    ststusBar: {
        height: Platform.OS === 'ios' ? 20 : 0,
    },
    head: {
        flex: 1,
        flexDirection: 'column',
    },
    bottom: {
        height: 54,//48
        backgroundColor: '#282828',
        flexDirection: 'row',
        // justifyContent: 'flex-end',
        // alignItems: 'flex-end',
    },

    bottomItem: {
        flex: 1,
        flexDirection: 'column',
        justifyContent: 'center',
        alignItems: 'center',
    },
    normal_text: {
        fontSize: 16,
        color: '#777777',
    },
    bottomItemIcon: {
        width: 24,
        height: 24,
        alignSelf: 'auto',
        resizeMode: 'cover',//cover:等比拉伸 strech:保持原有大小 contain:图片拉伸  充满空间
    },
});
