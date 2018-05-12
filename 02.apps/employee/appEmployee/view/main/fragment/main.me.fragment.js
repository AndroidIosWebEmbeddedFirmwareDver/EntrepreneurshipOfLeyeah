import React, {PureComponent} from 'react';

import {
    StyleSheet,
    View,
    ScrollView,
    Text,
    Platform,
    TouchableOpacity,
    Image,
} from 'react-native';

import ToastManager from '../../../utils/toast/Toast.util'
import NetworkCommonUtil from '../../../utils/network.common.util'
import UserDataManager from '../../../utils/storage/user.data.manager.common.util'

import UserRnaStatus from '../../../stable/json/user.rna.status'
import Communications from '../../../utils/call.email.text.common.util'

import CommonListItemView from '../../views/common/common.list.item.view'
import HeaderCommonView from '../../views/header/header.common.view'

import MeMsgActivity from './me/me.msg.activity'
import MeOrderActivity from './me/me.order.activity'
import MeWorkActivity from './me/me.work.activity'
import MeLoveActivity from './me/me.love.activity'
import MeShareActivity from './me/me.share.activity'
import MeRnaActivity from './me/rna/me.rna.activity'
import ManagerAccountActivity from './me/manager.account.screen'


//是否实名认证 ，默认0，默认0，0-未提交，待提交,1-已提交，待审核，2-已审核，未通过，3-已审核，已通过
class MainMeFragment extends PureComponent {
    //1.
    constructor(props) {
        super(props);
        this.state = {
            mainThemeColor: null,
            mobileUserData: null,
            responValue: '',
        };
    }

    //2.
    componentWillMount() {
        this._refreshUserData();
        this.state.mainThemeColor = '#FBFBFB';
        this.setState({
            mainThemeColor: this.state.mainThemeColor,
        });
        if (this.props.changeStatusColor) {
            this.props.changeStatusColor('#FFCC33');
        }

        if (this.props.changeHeadbar) {
            this.props.changeHeadbar('#FFCC33', '我的');
        }
    }


    //3.
    componentDidMount() {

    }

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

    //页面跳转
    _pushCompoent = (component: Component, params: any, checkRna: boolean) => {
        if (checkRna && !UserRnaStatus.checkRna(this.state.mobileUserData.data.beRna)) {
            ToastManager.alertWithSure('提示', '亲~系统检测到您还未实名认证，请先实名认证后再继续操作哦。', () => {
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


    _onLogoutSuccessCallback = () => {

        // this._refreshUserData();
        if (this.props.onLogoutSuccessCallback) {
            this.props.onLogoutSuccessCallback();
            // this.props.navigator.pop();
        }
    };

    _onUserDataRefreshCallback = (key, param) => {
        this._refreshUserData().then(ret => {
            if (this.props.onUserDataRefreshCallback) {
                this.props.onUserDataRefreshCallback();
            }
        });
    };

    _jumpToCallUs = (phone) => {
        if (!phone || phone.isEmpty) {
            return;
        }
        ToastManager.alertDialog('提示', '是否立即拨打' + phone, '取消', () => {
        }, '确定', () => {
            Communications.phonecall(phone, false);
        });
    };

    //4.
    render() {
        return (
            <ScrollView
                style={[MainMeFragmentStyles.root, this.state.mainThemeColor ? {backgroundColor: this.state.mainThemeColor} : {}]}>
                <TouchableOpacity
                    style={[MainMeFragmentStyles.container, {
                        alignItems: 'center',
                        minHeight: 96,
                        backgroundColor: '#FFFFFF',
                    }]}
                    onPress={() => this._pushCompoent(MeMsgActivity, {
                        mobileUserData: this.state.mobileUserData,
                        onUserDataRefreshCallback: this._onUserDataRefreshCallback,
                    })}
                >
                    <View style={[MainMeFragmentStyles.container_view, {
                        flexDirection: 'column',
                        justifyContent: 'center',
                        alignItems: 'center',
                        backgroundColor: 'transparent',
                        padding: 9.6,
                    }]}>
                        <Image
                            source={this.state.mobileUserData && this.state.mobileUserData.data && this.state.mobileUserData.data.avatarUrl ? {uri: this.state.mobileUserData.data.avatarUrl} : require('../../../stable/image/app_a.png')}
                            style={{
                                width: 72,
                                height: 72,
                                resizeMode: 'cover',
                                borderRadius: 72 / 2,
                                borderColor: '#FBFBFB',
                                borderWidth: 2,

                            }}
                        />
                        <Text
                            style={[MainMeFragmentStyles.normal_text, {marginTop: 9.6}]}>
                            评分:{this.state.mobileUserData && this.state.mobileUserData.data && this.state.mobileUserData.data.score >= 0 ? this.state.mobileUserData.data.score : ''}
                        </Text>
                    </View>
                    <View style={[MainMeFragmentStyles.container_view, {
                        flexDirection: 'column',
                        marginLeft: 9.6
                    }]}>
                        <Text
                            style={[MainMeFragmentStyles.normal_text, {}]}>
                            {this.state.mobileUserData && this.state.mobileUserData.data && this.state.mobileUserData.data.name ? this.state.mobileUserData.data.name : ''}
                        </Text>
                        <View style={[{
                            marginTop: 9.6,
                            backgroundColor: '#0088F3',
                            borderRadius: 9.6,
                            paddingLeft: 9.6,
                            paddingRight: 9.6,
                            paddingTop: 2.4,
                            paddingBottom: 2.4,
                        }]}>
                            <Text
                                style={[MainMeFragmentStyles.normal_text, {color: '#FFFFFF'}]}>
                                {UserRnaStatus.rnaShow(this.state.mobileUserData)}
                            </Text>
                        </View>
                    </View>
                    <View style={[MainMeFragmentStyles.container_view, {
                        flex: 1,
                        flexDirection: 'column',
                        alignItems: 'flex-end',
                    }]}>
                        <Image
                            source={require('../../../stable/image/ic_app_more.png')}
                            style={{width: 24, height: 24, resizeMode: 'cover', marginRight: 9.6,}}
                        />
                    </View>
                </TouchableOpacity>
                <View style={{height: 10, backgroundColor: '#FBFBFB',}}/>

                <CommonListItemView
                    itemOnpress={() => this._pushCompoent(MeOrderActivity, {
                        mobileUserData: this.state.mobileUserData,
                        onUserDataRefreshCallback: this._onUserDataRefreshCallback,
                    }, true)}
                    leftTitle={'我的账单'}
                    rightType={'next'}
                    rightNextImage={require('../../../stable/image/ic_app_more.png')}
                    bottomViewHeight={2}
                />
                <CommonListItemView
                    itemOnpress={() => this._pushCompoent(MeWorkActivity, {
                        mobileUserData: this.state.mobileUserData,
                        onUserDataRefreshCallback: this._onUserDataRefreshCallback,
                    }, true)}
                    leftTitle={'我的工作'}
                    rightType={'next'}
                    rightNextImage={require('../../../stable/image/ic_app_more.png')}
                    bottomViewHeight={2}
                />
                <CommonListItemView
                    itemOnpress={() => this._pushCompoent(MeLoveActivity, {
                        mobileUserData: this.state.mobileUserData,
                        onUserDataRefreshCallback: this._onUserDataRefreshCallback,
                    }, true)}
                    leftTitle={'我的收藏'}
                    rightType={'next'}
                    rightNextImage={require('../../../stable/image/ic_app_more.png')}
                    bottomViewHeight={2}
                />
                <CommonListItemView
                    itemOnpress={() => this._pushCompoent(MeShareActivity, {
                        mobileUserData: this.state.mobileUserData,
                        onUserDataRefreshCallback: this._onUserDataRefreshCallback,
                    }, true)}
                    leftTitle={'邀请好友'}
                    rightType={'next'}
                    rightNextImage={require('../../../stable/image/ic_app_more.png')}
                    bottomViewHeight={2}
                />
                <CommonListItemView
                    itemOnpress={() => this._jumpToCallUs('400-1000-2000')}
                    leftTitle={'联系我们'}
                    rightShowTitle={'400-1000-2000'}
                    rightNextImage={require('../../../stable/image/ic_app_more.png')}
                    bottomViewHeight={9.6}
                />
                <CommonListItemView
                    itemOnpress={() => this._pushCompoent(ManagerAccountActivity, {
                        mobileUserData: this.state.mobileUserData,
                        onLogoutSuccessCallback: this._onLogoutSuccessCallback
                    }, false)}
                    leftTitle={'账号设置'}
                    rightType={'next'}
                    rightNextImage={require('../../../stable/image/ic_app_more.png')}
                    bottomViewHeight={2}
                />
            </ScrollView>
        );
    }
}

MainMeFragmentStyles = StyleSheet.create({
    root: {
        flex: 1,
        flexDirection: 'column',
        // justifyContent: 'center',
        // alignItems: 'center',=
    },
    container: {
        minHeight: 20,
        flexDirection: 'row',
        justifyContent: 'flex-start',
        alignItems: 'flex-start',
    },
    container_view: {
        minHeight: 20,
        flexDirection: 'row',
        justifyContent: 'flex-start',
        alignItems: 'flex-start',
    },
    normal_text: {
        fontSize: 16,
    }
});

export default MainMeFragment;