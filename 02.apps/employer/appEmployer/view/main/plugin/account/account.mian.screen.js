import React, {Component, PureComponent} from 'react';
import {
    View,
    Text,
    Alert,
    Image,
    Button,
    Platform,
    Dimensions,
    ScrollView,
    StyleSheet,
    PixelRatio,
    TouchableOpacity,
    ActivityIndicator,
} from 'react-native';

const {
    width,
    height
} = Dimensions.get('window');

import ToastManager from '../../../../utils/toast/Toast.util'
import UserRnaStatus from '../../../../stable/json/user.rna.status'
import NetworkCommonUtil from '../../../../utils/network.common.util'
import HeaderCommonView from '../../../views/header/header.common.view'
import DialogManagerUtil from '../../../views/dialog/dialog.manager.util'
import CommonListItemView from '../../../views/common/common.list.item.view'
import MainScreenHeaderItem from '../../mainview/main.screen.header.item.main'
import UserDataManager from '../../../../utils/storage/user.data.manager.common.util'
import AsyncstorageKeyCommonUtil from '../../../../utils/storage/asyncstorage.key.common.util'

//child
import MeRnaActivity from './data/rna/me.rna.activity'
import BillsMianScreen from '../bills/bills.mian.screen'
import MyDataAccountScreen from './my.data.account.screen'
import MyManagerAccountScreen from './my.manager.account.screen'
import MyPublishAccountScreen from './my.publish.account.screen'
import MyInvitationAccountScreen from './my.invitation.account.screen'
import BaseActivity from "../../../views/base.activity";


export default class AccountMainScreen extends BaseActivity {

    constructor(props) {
        super(props);
        this.state = {
            mobileUserData: null,
        };
    }

    //2.
    componentWillMount() {
        super.componentWillMount();
        this._refreshUserData().then(data => {
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

    _onLogoutSuccessCallback = () => {
        // this._refreshUserData();
        if (this.props.onLogoutSuccessCallback) {
            this.props.onLogoutSuccessCallback();
            this.props.navigator.pop();
        }
    };

    _onUserDataRefreshCallback = (key, param) => {
        this._refreshUserData().then(ret => {
            if (this.props.onUserDataRefreshCallback) {
                this.props.onUserDataRefreshCallback();
            }
        });
    };


    render() {
        const {navigator} = this.props.navigator;
        return (
            <View style={AccountMainScreenStyles.container}>
                <HeaderCommonView navigator={this.props.navigator}
                                  headerLeftShow={true}
                                  headerCenterShow={false}
                                  headerRightShow={false}
                                  bgColor={'#FFCC33'}
                />
                <ScrollView style={AccountMainScreenStyles.function_list}
                            contentContainerStyle={AccountMainScreenStyles.function_list_contentContainer}
                >
                    <View style={AccountMainScreenStyles.function_header_container}>
                        <MainScreenHeaderItem
                            showForAccount={true}
                            mobileUserId={this.state.mobileUserData && this.state.mobileUserData.data && this.state.mobileUserData.data.name ? this.state.mobileUserData.data.name : ''}
                            mobileUserAvatorUrl={this.state.mobileUserData && this.state.mobileUserData.data && this.state.mobileUserData.data.avatarUrl ? {uri: this.state.mobileUserData.data.avatarUrl} : require('../../../../stable/image/app_a.png')}
                            mobileUserBeRna={UserRnaStatus.rnaShow(this.state.mobileUserData)}
                            mobileUserScore={this.state.mobileUserData && this.state.mobileUserData.data ? this.state.mobileUserData.data.score : ''}
                            headerNotificationOnpress={() => {
                            }}
                            headerAccountOnpress={() => {
                            }}
                        />
                    </View>
                    <View style={AccountMainScreenStyles.function_list_container}>
                        <View style={{height: 10, backgroundColor: 'transparent',}}/>
                        <CommonListItemView
                            itemOnpress={() => this._pushCompoent(MyDataAccountScreen, {
                                mobileUserData: this.state.mobileUserData,
                                onUserDataRefreshCallback: this._onUserDataRefreshCallback,
                            }, false)}
                            leftTitle={'我的资料'}
                            rightType={'next'}
                            rightShowTitle={this.state.selectedExperieceResponse ? this.state.selectedExperieceResponse.description : ''}
                            rightNextImage={require('../../../../stable/image/ic_app_more.png')}
                            bottomViewHeight={9.6}
                        />
                        <CommonListItemView
                            itemOnpress={() => this._pushCompoent(BillsMianScreen, {
                                mobileUserData: this.state.mobileUserData,
                                onUserDataRefreshCallback: this._onUserDataRefreshCallback,
                            }, true)}
                            leftTitle={'我的账单'}
                            rightType={'next'}
                            rightShowTitle={this.state.selectedExperieceResponse ? this.state.selectedExperieceResponse.description : ''}
                            rightNextImage={require('../../../../stable/image/ic_app_more.png')}
                            bottomViewHeight={2}
                        />
                        <CommonListItemView
                            itemOnpress={() => this._pushCompoent(MyPublishAccountScreen, {
                                mobileUserData: this.state.mobileUserData,
                                onUserDataRefreshCallback: this._onUserDataRefreshCallback,
                            }, true)}
                            leftTitle={'我的发布'}
                            rightType={'next'}
                            rightShowTitle={this.state.selectedExperieceResponse ? this.state.selectedExperieceResponse.description : ''}
                            rightNextImage={require('../../../../stable/image/ic_app_more.png')}
                            bottomViewHeight={9.6}
                        />
                        <CommonListItemView
                            itemOnpress={() => this._pushCompoent(MyInvitationAccountScreen, {
                                mobileUserData: this.state.mobileUserData,
                                onUserDataRefreshCallback: this._onUserDataRefreshCallback,
                            }, false)}
                            leftTitle={'邀请好友'}
                            rightType={'next'}
                            rightShowTitle={this.state.selectedExperieceResponse ? this.state.selectedExperieceResponse.description : ''}
                            rightNextImage={require('../../../../stable/image/ic_app_more.png')}
                            bottomViewHeight={9.6}
                        />
                        <CommonListItemView
                            itemOnpress={() => this._pushCompoent(MyManagerAccountScreen, {
                                mobileUserData: this.state.mobileUserData,
                                onLogoutSuccessCallback: this._onLogoutSuccessCallback,
                                onUserDataRefreshCallback: this._onUserDataRefreshCallback,
                            }, false)}
                            leftTitle={'账号设置'}
                            rightType={'next'}
                            rightShowTitle={this.state.selectedExperieceResponse ? this.state.selectedExperieceResponse.description : ''}
                            rightNextImage={require('../../../../stable/image/ic_app_more.png')}
                            bottomViewHeight={2}
                        />
                    </View>
                </ScrollView>
            </View>
        );
    }
}


AccountMainScreenStyles = StyleSheet.create({
    //基于flex-box布局
    container: {
        width: width,
        height: height,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FBFBFB',
    },
    function_list: {
        flex: 1,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FBFBFB',
    },
    function_list_contentContainer: {
        // paddingVertical: 16,
        //暂时解决安卓下布局显示不完整
        paddingBottom: 24,
    },
    function_header_container: {
        flexDirection: 'row',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FFCC33',
        justifyContent: 'center',
        alignItems: 'center',
    },
    function_list_container: {
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FBFBFB',
    },

});