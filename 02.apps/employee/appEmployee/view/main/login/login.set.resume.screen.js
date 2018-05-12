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


import BaseActivity from '../../views/base.activity'

import ToastManager from '../../../utils/toast/Toast.util'
import MeRnaActivity from '../fragment/me/rna/me.rna.activity'
import NameActivity from '../fragment/me/account/name.activity'
import UserRnaStatus from '../../../stable/json/user.rna.status'
import PhoneActivity from '../fragment/me/account/phone.activity'
import NetworkCommonUtil from '../../../utils/network.common.util'
import AvatorActivity from '../fragment/me/account/avator.activity'
import HeaderCommonView from '../../views/header/header.common.view'
import CommonListItemView from '../../views/common/common.list.item.view'
import UserDataManager from '../../../utils/storage/user.data.manager.common.util'
import RegionNotsetToSetActivity from '../fragment/me/account/region.notset.toset.activity'
import ResumeChoiceWorkTypeActivity from '../fragment/me/account/resume/resume.choice.work.type.activity'
import ResumeChoiceWorkGoodatsActivity from '../fragment/me/account/resume/resume.choice.work.goodats.activity'
import ResumeChoiceWorkExprenceActivity from '../fragment/me/account/resume/resume.choice.work.exprence.activity'
import ResumeChoiceWorkSelfevalsActivity from '../fragment/me/account/resume/resume.choice.work.selfevals.activity'

export default class LoginSetResumeScreen extends BaseActivity {
    //1.Component构造函数
    constructor(props) {
        super(props);
        this.state = {
            mobileUserData: null,
        };
    }

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

    _goBack() {
        // super._goBack();
        this._onCheckIsSetFullResumeClick(true);
    }

    //页面跳转
    _pushCompoent = (component: Component, params: any, checkRna: boolean) => {
        //这里直接设置简历，先不判断是否已经实名认证
        // if (checkRna && !UserRnaStatus.checkRna(this.state.mobileUserData.data.beRna)) {
        //     ToastManager.alertWithSure('提示', '亲~系统检测到您还未实名认证，请先实名认证后再继续操作哦。', () => {
        //         this._pushCompoent(MeRnaActivity, {
        //             mobileUserData: this.state.mobileUserData,
        //             onUserDataRefreshCallback: this._onUserDataRefreshCallback
        //         }, false)
        //     });
        // } else if (component) {
        //     this.props.navigator.push({
        //         component: component,
        //         params: params,
        //     });
        // }
        if (component) {
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

    _onCheckIsSetFullResumeClick = (goback: boolean) => {
        if (goback) {
            if (this.props.navigator) {
                this.props.navigator.pop();
            }
            if (this.props.onSetFullResumeCallback) {
                this.props.onSetFullResumeCallback();
            }
        } else {
            if (!UserDataManager.getInstance().isHadSetFullResume()) {
                ToastManager.alertWithSure('提示', '亲~系统检测到您还未填写完整的简历哟，请填好写完整的简历后再继续使用吧。', () => {
                });
            } else {
                if (this.props.onSetFullResumeCallback) {
                    this.props.onSetFullResumeCallback();
                }
                if (this.props.navigator) {
                    this.props.navigator.pop();
                }
            }
        }
    };


    render() {
        return (
            <View style={LoginSetResumeScreenStyles.container}>
                <HeaderCommonView navigator={this.props.navigator}
                                  bgColor={'#FFCC33'}
                                  invalidLeftPop={true}
                                  onbackPress={() => this._onCheckIsSetFullResumeClick(true)}
                                  headerLeftShow={true}
                                  headerCenterShow={true}
                                  headerRightShow={true}
                                  showCenterAfterLeft={true}
                                  headerRightButtonTitle={'完成'}
                                  headerRightButtonOnpress={() => this._onCheckIsSetFullResumeClick()}
                                  headerCenterTitle={'我的资料'}/>

                <ScrollView style={LoginSetResumeScreenStyles.function_list}
                            contentContainerStyle={LoginSetResumeScreenStyles.function_list_contentContainer}
                >
                    <View style={LoginSetResumeScreenStyles.function_list_container}>
                        <View style={{height: 10, backgroundColor: 'transparent',}}/>
                        <CommonListItemView
                            itemOnpress={() => this._pushCompoent(AvatorActivity, {
                                mobileUserData: this.state.mobileUserData,
                                onUserDataRefreshCallback: this._onUserDataRefreshCallback
                            })}
                            leftTitle={'我的头像'}
                            rightType={'next'}
                            showRightAvator={true}
                            showRightAvatorUrl={this.state.mobileUserData && this.state.mobileUserData.data && this.state.mobileUserData.data.avatarUrl ? {uri: this.state.mobileUserData.data.avatarUrl} : require('../../../stable/image/app_a.png')}
                            rightNextImage={require('../../../stable/image/ic_app_more.png')}
                            bottomViewHeight={2}
                        />

                        <CommonListItemView
                            itemOnpress={() => this._pushCompoent(NameActivity, {
                                mobileUserData: this.state.mobileUserData,
                                onUserDataRefreshCallback: this._onUserDataRefreshCallback
                            }, true)}
                            leftTitle={'我的姓名'}
                            rightType={'next'}
                            rightNextImage={require('../../../stable/image/ic_app_more.png')}
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
                            rightNextImage={require('../../../stable/image/ic_app_more.png')}
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
                            rightNextImage={require('../../../stable/image/ic_app_more.png')}
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
                            rightNextImage={require('../../../stable/image/ic_app_more.png')}
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
                            rightNextImage={require('../../../stable/image/ic_app_more.png')}
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
                            rightNextImage={require('../../../stable/image/ic_app_more.png')}
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
                            rightNextImage={require('../../../stable/image/ic_app_more.png')}
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


LoginSetResumeScreenStyles = StyleSheet.create({
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