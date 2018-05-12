import React, {PureComponent, Component} from 'react';
import {
    StyleSheet,
    TouchableOpacity,
    View,
    Text,
    TextInput,
    Button,
    ScrollView,
    Dimensions,
    Alert,
    Modal,
    Image,
} from 'react-native';

const {
    width,
    height
} = Dimensions.get('window');


import HeaderCommonView from '../../../views/header/header.common.view'
import NetworkCommonUtil from '../../../../utils/network.common.util'
import UserDataManager from '../../../../utils/storage/user.data.manager.common.util'
import UserRnaStatus from '../../../../stable/json/user.rna.status'
import AsyncstorageKeyCommonUtil from '../../../../utils/storage/asyncstorage.key.common.util'
import ToastManager from '../../../../utils/toast/Toast.util'
import DialogManagerUtil from '../../../views/dialog/dialog.manager.util'
import CommonListItemView from '../../../views/common/common.list.item.view'

import AvatorActivity from './data/avator.activity'
import NameActivity from './data/name.activity'
import MeRnaActivity from './data/rna/me.rna.activity'
import PhoneActivity from './data/phone/phone.activity'

import CallPhoneActivity from './data/call.phone.activity'
import IdCardNoActivity from './data/id.card.no.activity'
import BaseActivity from "../../../views/base.activity";

export default class MyDataAccountScreen extends BaseActivity {
    //1.
    constructor(props) {
        super(props);
        this.state = {
            mobileUserData: null,
        };
    };

    //2.
    componentWillMount() {
        super.componentWillMount();
        this._refreshUserData();
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


    _onUserDataRefreshCallback = (key, param) => {
        this._refreshUserData().then(ret => {
            if (this.props.onUserDataRefreshCallback) {
                this.props.onUserDataRefreshCallback();
            }
        });
    };


    render() {
        return (
            <View style={MyDataAccountScreenStyles.container}>
                <HeaderCommonView navigator={this.props.navigator}
                                  bgColor={'#FFCC33'}
                                  headerLeftShow={true}
                                  headerCenterShow={true}
                                  headerRightShow={false}
                                  showCenterAfterLeft={true}
                                  headerCenterTitle={'我的资料'}/>

                <ScrollView style={MyManagerAccountScreenStyles.function_list}>
                    <View style={MyManagerAccountScreenStyles.function_list_container}>
                        <View style={{height: 10, backgroundColor: 'transparent',}}/>

                        <CommonListItemView
                            itemOnpress={() => this._pushCompoent(AvatorActivity, {
                                mobileUserData: this.state.mobileUserData,
                                onUserDataRefreshCallback: this._onUserDataRefreshCallback
                            }, false)}
                            leftTitle={'我的头像'}
                            rightType={'next'}
                            showRightAvator={true}
                            showRightAvatorUrl={this.state.mobileUserData && this.state.mobileUserData.data && this.state.mobileUserData.data.avatarUrl ? {uri: this.state.mobileUserData.data.avatarUrl} : require('../../../../stable/image/app_a.png')}
                            rightNextImage={require('../../../../stable/image/ic_app_more.png')}
                            bottomViewHeight={2}
                        />
                        <CommonListItemView
                            itemOnpress={() => this._pushCompoent(MeRnaActivity, {
                                mobileUserData: this.state.mobileUserData,
                                onUserDataRefreshCallback: this._onUserDataRefreshCallback
                            }, false)}
                            leftTitle={'实名认证'}
                            rightType={'next'}
                            rightNextImage={require('../../../../stable/image/ic_app_more.png')}
                            rightShowTitleShowAtRight={true}
                            showRightTextWithBgView={true}
                            rightShowTitle={
                                UserRnaStatus.rnaShow(this.state.mobileUserData)
                            }
                            bottomViewHeight={9.6}
                        />


                        <CommonListItemView
                            itemOnpress={() => this._pushCompoent(NameActivity, {
                                mobileUserData: this.state.mobileUserData,
                                onUserDataRefreshCallback: this._onUserDataRefreshCallback
                            }, true)}
                            leftTitle={'公司名称'}
                            rightType={'next'}
                            rightNextImage={require('../../../../stable/image/ic_app_more.png')}
                            rightShowTitleShowAtRight={true}
                            showRightTextWithBgView={false}
                            rightShowTitle={
                                this.state.mobileUserData && this.state.mobileUserData.data &&
                                this.state.mobileUserData.data.name ? this.state.mobileUserData.data.name : ''
                            }
                            bottomViewHeight={2}
                        />

                        <CommonListItemView
                            itemOnpress={() => this._pushCompoent(IdCardNoActivity, {
                                mobileUserData: this.state.mobileUserData,
                                onUserDataRefreshCallback: this._onUserDataRefreshCallback
                            }, true)}
                            leftTitle={'统一代码'}
                            rightType={'next'}
                            rightNextImage={require('../../../../stable/image/ic_app_more.png')}
                            rightShowTitleShowAtRight={true}
                            showRightTextWithBgView={false}
                            rightShowTitle={
                                this.state.mobileUserData && this.state.mobileUserData.data &&
                                this.state.mobileUserData.data.rnaOrder && this.state.mobileUserData.data.rnaOrder.userIdCardNo ? this.state.mobileUserData.data.rnaOrder.userIdCardNo : ''
                            }
                            bottomViewHeight={9.6}
                        />

                        <CommonListItemView
                            itemOnpress={() => this._pushCompoent(CallPhoneActivity, {
                                mobileUserData: this.state.mobileUserData,
                                onUserDataRefreshCallback: this._onUserDataRefreshCallback
                            }, true)}
                            leftTitle={'联系电话'}
                            rightType={'next'}
                            rightNextImage={require('../../../../stable/image/ic_app_more.png')}
                            rightShowTitleShowAtRight={true}
                            showRightTextWithBgView={false}
                            rightShowTitle={
                                this.state.mobileUserData && this.state.mobileUserData.data &&
                                this.state.mobileUserData.data.callPhone ? this.state.mobileUserData.data.callPhone : ''
                            }
                            bottomViewHeight={2}
                        />


                        <CommonListItemView
                            itemOnpress={() => this._pushCompoent(PhoneActivity, {
                                mobileUserData: this.state.mobileUserData,
                                onUserDataRefreshCallback: this._onUserDataRefreshCallback
                            }, false)}
                            leftTitle={'手机号码'}
                            rightType={'next'}
                            rightNextImage={require('../../../../stable/image/ic_app_more.png')}
                            rightShowTitleShowAtRight={true}
                            showRightTextWithBgView={false}
                            rightShowTitle={
                                this.state.mobileUserData ? this.state.mobileUserData.data ?
                                    this.state.mobileUserData.data.phone ? this.state.mobileUserData.data.phone : '' : '' : ''
                            }
                            bottomViewHeight={9.6}
                        />


                        {/*<CommonListItemView*/}
                        {/*itemOnpress={() => this._pushCompoent(NameActivity, {*/}
                        {/*mobileUserData: this.state.mobileUserData,*/}
                        {/*onUserDataRefreshCallback: this._onUserDataRefreshCallback*/}
                        {/*}, true)}*/}
                        {/*leftTitle={'营业执照'}*/}
                        {/*rightType={'next'}*/}
                        {/*rightNextImage={require('../../../../stable/image/ic_app_more.png')}*/}
                        {/*rightShowTitleShowAtRight={true}*/}
                        {/*showRightTextWithBgView={false}*/}
                        {/*bottomViewHeight={2}*/}
                        {/*/>*/}


                    </View>
                </ScrollView>

            </View>
        );
    };
}

MyDataAccountScreenStyles = StyleSheet.create({
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
    function_list_container: {
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FBFBFB',
    },
});