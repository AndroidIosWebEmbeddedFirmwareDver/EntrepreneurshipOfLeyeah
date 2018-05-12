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


import ToastManager from '../../../../utils/toast/Toast.util'
import NetworkCommonUtil from '../../../../utils/network.common.util'
import UserRnaStatus from '../../../../stable/json/user.rna.status'
import UserDataManager from '../../../../utils/storage/user.data.manager.common.util'
import CommonListItemView from '../../../views/common/common.list.item.view'

import HeaderCommonView from '../../../views/header/header.common.view'

// import UseMeMsgActivity from './manager/use.manager.account.screen'
import AvatorActivity from './account/avator.activity'
import MeRnaActivity from './rna/me.rna.activity'
import NameActivity from './account/name.activity'
import PhoneActivity from './account/phone.activity'
import RegionNotsetToSetActivity from './account/region.notset.toset.activity'
import ResumeChoiceWorkTypeActivity from './account/resume/resume.choice.work.type.activity'
import ResumeChoiceWorkExprenceActivity from './account/resume/resume.choice.work.exprence.activity'
import ResumeChoiceWorkGoodatsActivity from './account/resume/resume.choice.work.goodats.activity'
import ResumeChoiceWorkSelfevalsActivity from './account/resume/resume.choice.work.selfevals.activity'
import BaseActivity from "../../../views/base.activity";

export default class MeMsgActivity extends BaseActivity {
    //1.Component构造函数
    constructor(props) {
        super(props);
        this.state = {
            mobileUserData: null,
        };
    }

    //2.Component要被加载
    componentWillMount() {
        super.componentWillMount();
        this._refreshUserData();
    }

    //3.Component加载完毕
    componentDidMount() {
        super.componentDidMount();
    }

    //4.
    componentWillUnMount() {
        super.componentWillUnmount();
    }

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

    _onUserDataRefreshCallback = () => {
        this._refreshUserData().then((ret) => {
            if (this.props.onUserDataRefreshCallback) {
                this.props.onUserDataRefreshCallback();
            }
        });
    };

    //工种
    _myWorkTypesShow = () => {
        if (this.state.mobileUserData && this.state.mobileUserData.data &&
            this.state.mobileUserData.data.resume &&
            this.state.mobileUserData.data.resume.workTypes) {
            let cachShow = '';
            for (let work of JSON.parse(this.state.mobileUserData.data.resume.workTypes)) {
                cachShow = cachShow + work.name + ' ';
            }
            return cachShow;
        } else {
            return '';
        }
    };
    //擅长
    _myWorkGoodAtsShow = () => {
        if (this.state.mobileUserData && this.state.mobileUserData.data &&
            this.state.mobileUserData.data.resume &&
            this.state.mobileUserData.data.resume.workGoodAts) {
            let cachShow = '';
            for (let work of JSON.parse(this.state.mobileUserData.data.resume.workGoodAts)) {
                cachShow = cachShow + work.name + ' ';
            }
            return cachShow;
        } else {
            return '';
        }
    };
    //自我评价
    _myWorkSelfEvalsShow = () => {
        if (this.state.mobileUserData && this.state.mobileUserData.data &&
            this.state.mobileUserData.data.resume &&
            this.state.mobileUserData.data.resume.workSelfEvals) {
            let cachShow = '';
            for (let work of JSON.parse(this.state.mobileUserData.data.resume.workSelfEvals)) {
                cachShow = cachShow + work.name + ' ';
            }
            return cachShow;
        } else {
            return '';
        }
    };


    render() {
        return (
            <View style={MeMsgActivityStyles.container}>
                <HeaderCommonView navigator={this.props.navigator}
                                  bgColor={'#FFCC33'}
                                  headerLeftShow={true}
                                  headerCenterShow={true}
                                  headerRightShow={false}
                                  showCenterAfterLeft={true}
                                  headerCenterTitle={'我的资料'}/>
                <ScrollView style={MeMsgActivityStyles.function_list}
                            contentContainerStyle={MeMsgActivityStyles.function_list_contentContainer}
                >
                    <View style={MeMsgActivityStyles.function_list_container}>
                        <View style={{height: 10, backgroundColor: 'transparent',}}/>
                        <CommonListItemView
                            itemOnpress={() => this._pushCompoent(AvatorActivity, {
                                mobileUserData: this.state.mobileUserData,
                                onUserDataRefreshCallback: this._onUserDataRefreshCallback
                            })}
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
                            })}
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
                            leftTitle={'我的姓名'}
                            rightType={'next'}
                            rightNextImage={require('../../../../stable/image/ic_app_more.png')}
                            rightShowTitleShowAtRight={true}
                            showRightTextWithBgView={false}
                            rightShowTitle={
                                this.state.mobileUserData && this.state.mobileUserData.data && this.state.mobileUserData.data.name ? this.state.mobileUserData.data.name : ''
                            }
                            bottomViewHeight={2}
                        />
                        <CommonListItemView
                            itemOnpress={() => this._pushCompoent(PhoneActivity, {
                                mobileUserData: this.state.mobileUserData,
                                onUserDataRefreshCallback: this._onUserDataRefreshCallback
                            }, true)}
                            leftTitle={'手机号码'}
                            rightType={'next'}
                            rightNextImage={require('../../../../stable/image/ic_app_more.png')}
                            rightShowTitleShowAtRight={true}
                            showRightTextWithBgView={false}
                            rightShowTitle={
                                this.state.mobileUserData && this.state.mobileUserData.data && this.state.mobileUserData.data.phone ? this.state.mobileUserData.data.phone : ''
                            }
                            bottomViewHeight={2}
                        />
                        <CommonListItemView
                            itemOnpress={() => this._pushCompoent(RegionNotsetToSetActivity, {
                                mobileUserData: this.state.mobileUserData,
                                onUserDataRefreshCallback: this._onUserDataRefreshCallback
                            }, true)}
                            leftTitle={'所在地址'}
                            rightType={'next'}
                            rightNextImage={require('../../../../stable/image/ic_app_more.png')}
                            rightShowTitleShowAtRight={true}
                            showRightTextWithBgView={false}
                            rightShowTitle={
                                this.state.mobileUserData && this.state.mobileUserData.data ?
                                    (this.state.mobileUserData.data.areaProvinceName ? this.state.mobileUserData.data.areaProvinceName : '')
                                    + (this.state.mobileUserData.data.areaCityName ? this.state.mobileUserData.data.areaCityName : '')
                                    + (this.state.mobileUserData.data.areaAreaAndCountyName ? this.state.mobileUserData.data.areaAreaAndCountyName : '')
                                    + (this.state.mobileUserData.data.areaAddress ? this.state.mobileUserData.data.areaAddress : '')
                                    : ''
                            }
                            bottomViewHeight={9.6}
                        />

                        <CommonListItemView
                            itemOnpress={() => this._pushCompoent(ResumeChoiceWorkTypeActivity, {
                                mobileUserData: this.state.mobileUserData,
                                onUserDataRefreshCallback: this._onUserDataRefreshCallback
                            }, true)}
                            leftTitle={'我的工种'}
                            rightType={'next'}
                            rightNextImage={require('../../../../stable/image/ic_app_more.png')}
                            rightShowTitleShowAtRight={true}
                            showRightTextWithBgView={false}
                            rightShowTitle={this._myWorkTypesShow()}
                            bottomViewHeight={2}
                        />
                        <CommonListItemView
                            itemOnpress={() => this._pushCompoent(ResumeChoiceWorkExprenceActivity, {
                                mobileUserData: this.state.mobileUserData,
                                onUserDataRefreshCallback: this._onUserDataRefreshCallback
                            }, true)}
                            leftTitle={'我的工龄'}
                            rightType={'next'}
                            rightNextImage={require('../../../../stable/image/ic_app_more.png')}
                            rightShowTitleShowAtRight={true}
                            showRightTextWithBgView={false}
                            rightShowTitle={this.state.mobileUserData && this.state.mobileUserData.data &&
                            this.state.mobileUserData.data.resume && this.state.mobileUserData.data.resume.workExperienceTypeDesc ? this.state.mobileUserData.data.resume.workExperienceTypeDesc : ''}
                            bottomViewHeight={2}
                        />

                        <CommonListItemView
                            itemOnpress={() => this._pushCompoent(ResumeChoiceWorkGoodatsActivity, {
                                mobileUserData: this.state.mobileUserData,
                                onUserDataRefreshCallback: this._onUserDataRefreshCallback
                            }, true)}
                            leftTitle={'我的擅长'}
                            rightType={'next'}
                            rightNextImage={require('../../../../stable/image/ic_app_more.png')}
                            rightShowTitleShowAtRight={true}
                            showRightTextWithBgView={false}
                            rightShowTitle={this._myWorkGoodAtsShow()}
                            bottomViewHeight={2}
                        />


                        <CommonListItemView
                            itemOnpress={() => this._pushCompoent(ResumeChoiceWorkSelfevalsActivity, {
                                mobileUserData: this.state.mobileUserData,
                                onUserDataRefreshCallback: this._onUserDataRefreshCallback
                            }, true)}
                            leftTitle={'自我评价'}
                            rightType={'next'}
                            rightNextImage={require('../../../../stable/image/ic_app_more.png')}
                            rightShowTitleShowAtRight={true}
                            showRightTextWithBgView={false}
                            rightShowTitle={this._myWorkSelfEvalsShow()}
                            bottomViewHeight={2}
                        />

                        {/*<CommonListItemView*/}
                        {/*leftTitle={'技术证书'}*/}
                        {/*rightType={'next'}*/}
                        {/*rightNextImage={require('../../../../stable/image/ic_app_more.png')}*/}
                        {/*bottomViewHeight={2}*/}
                        {/*/>*/}
                    </View>
                </ScrollView>

            </View>
        );
    };
}


MeMsgActivityStyles = StyleSheet.create({
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
    function_list_container: {
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FBFBFB',
    },
});