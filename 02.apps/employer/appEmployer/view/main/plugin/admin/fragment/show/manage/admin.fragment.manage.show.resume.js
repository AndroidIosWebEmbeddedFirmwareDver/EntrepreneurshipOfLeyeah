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
} from 'react-native';

import ToastManager from '../../../../../../../utils/toast/Toast.util'
import UserRnaStatus from '../../../../../../../stable/json/user.rna.status'
import HeaderCommonView from '../../../../../../views/header/header.common.view'
import Communications from '../../../../../../../utils/call.email.text.common.util'
import CommonListItemView from '../../../../../../views/common/common.list.item.view'
import BaseActivity from "../../../../../../views/base.activity";


export default class AdminFragmentManageShowResume extends BaseActivity {
    constructor(props) {
        super(props);
    };

    //2.
    componentWillMount() {
        super.componentWillMount();
    }

    //3.
    componentDidMount() {
        super.componentDidMount();
    }

    //4.
    componentWillUnmount() {
        super.componentWillUnmount();
    }


    //工种
    _myWorkTypesShow = () => {
        if (this.props.OrderGetOrderEmploysDown
            && this.props.OrderGetOrderEmploysDown.employee
            && this.props.OrderGetOrderEmploysDown.employee.resume
            && this.props.OrderGetOrderEmploysDown.employee.resume.workTypes
        ) {
            let cachShow = '';
            for (let work of JSON.parse(this.props.OrderGetOrderEmploysDown.employee.resume.workTypes)) {
                cachShow = cachShow + work.name + ' ';
            }
            return cachShow;
        } else {
            return '';
        }
    };
    //擅长
    _myWorkGoodAtsShow = () => {

        if (this.props.OrderGetOrderEmploysDown
            && this.props.OrderGetOrderEmploysDown.employee
            && this.props.OrderGetOrderEmploysDown.employee.resume
            && this.props.OrderGetOrderEmploysDown.employee.resume.workGoodAts
        ) {
            let cachShow = '';
            for (let work of JSON.parse(this.props.OrderGetOrderEmploysDown.employee.resume.workGoodAts)) {
                cachShow = cachShow + work.name + ' ';
            }
            return cachShow;
        } else {
            return '';
        }
    };
    //自我评价
    _myWorkSelfEvalsShow = () => {
        if (this.props.OrderGetOrderEmploysDown
            && this.props.OrderGetOrderEmploysDown.employee
            && this.props.OrderGetOrderEmploysDown.employee.resume
            && this.props.OrderGetOrderEmploysDown.employee.resume.workSelfEvals
        ) {
            let cachShow = '';
            for (let work of JSON.parse(this.props.OrderGetOrderEmploysDown.employee.resume.workSelfEvals)) {
                cachShow = cachShow + work.name + ' ';
            }
            return cachShow;
        } else {
            return '';
        }
    };

    _jumpToCallUs = () => {
        if (this.props.OrderGetOrderEmploysDown
            && this.props.OrderGetOrderEmploysDown.employee
            && this.props.OrderGetOrderEmploysDown.employee.user
            && this.props.OrderGetOrderEmploysDown.employee.user.phone) {
            ToastManager.alertDialog('提示', '是否立即拨打' + this.props.OrderGetOrderEmploysDown.employee.user.phone, '取消', () => {
            }, '确定', () => {
                Communications.phonecall(this.props.OrderGetOrderEmploysDown.employee.user.phone, false);
            });
        }
    };

    render() {
        return (
            <View style={AdminFragmentManageShowResumeStyles.container}>
                <HeaderCommonView navigator={this.props.navigator}
                                  bgColor={'#FFCC33'}
                                  headerLeftShow={true}
                                  headerCenterShow={true}
                                  headerRightShow={false}
                                  showCenterAfterLeft={true}
                                  headerCenterTitle={'查看简历'}/>
                {this.props.OrderGetOrderEmploysDown ?
                    <ScrollView style={AdminFragmentManageShowResumeStyles.function_list}
                                contentContainerStyle={AdminFragmentManageShowResumeStyles.function_list_contentContainer}
                    >
                        <View style={AdminFragmentManageShowResumeStyles.function_list_container}>
                            <View style={{height: 10, backgroundColor: 'transparent',}}/>
                            <CommonListItemView
                                leftTitle={'头像'}
                                rightType={'next'}
                                rootNotTouchable={true}
                                showRightAvator={true}
                                showRightAvatorUrl={this.props.OrderGetOrderEmploysDown
                                && this.props.OrderGetOrderEmploysDown.employee
                                && this.props.OrderGetOrderEmploysDown.employee.user
                                && this.props.OrderGetOrderEmploysDown.employee.user.avatarUrl
                                    ? {uri: this.props.OrderGetOrderEmploysDown.employee.user.avatarUrl} : require('../../../../../../../stable/image/app_a.png')}
                                bottomViewHeight={2}
                            />
                            <CommonListItemView
                                leftTitle={'实名认证'}
                                rightType={'next'}
                                rootNotTouchable={true}
                                rightShowTitleShowAtRight={true}
                                showRightTextWithBgView={true}
                                rightShowTitle={
                                    UserRnaStatus.leMobileUserEntityRnaShow(this.props.OrderGetOrderEmploysDown.employee.user)
                                }
                                bottomViewHeight={9.6}
                            />
                            <CommonListItemView
                                leftTitle={'姓名'}
                                rightType={'next'}
                                rootNotTouchable={true}
                                showRightAvator={false}
                                rightShowTitleShowAtRight={true}
                                showRightTextWithBgView={false}
                                rightShowTitle={
                                    this.props.OrderGetOrderEmploysDown
                                    && this.props.OrderGetOrderEmploysDown.employee
                                    && this.props.OrderGetOrderEmploysDown.employee.user
                                    && this.props.OrderGetOrderEmploysDown.employee.user.name
                                        ? this.props.OrderGetOrderEmploysDown.employee.user.name : ''
                                }
                                bottomViewHeight={2}
                            />
                            <CommonListItemView
                                itemOnpress={() => this._jumpToCallUs()}
                                leftTitle={'手机号码'}
                                rightType={'next'}
                                rootNotTouchable={false}
                                showRightAvator={false}
                                rightShowTitleShowAtRight={true}
                                showRightTextWithBgView={false}
                                rightShowTitleColor={'#0088F3'}
                                rightShowTitle={this.props.OrderGetOrderEmploysDown
                                && this.props.OrderGetOrderEmploysDown.employee
                                && this.props.OrderGetOrderEmploysDown.employee.user
                                && this.props.OrderGetOrderEmploysDown.employee.user.phone
                                    ? this.props.OrderGetOrderEmploysDown.employee.user.phone : ''
                                }
                                bottomViewHeight={2}
                            />
                            <CommonListItemView
                                leftTitle={'所在地址'}
                                rightType={'next'}
                                rootNotTouchable={true}
                                showRightAvator={false}
                                rightShowTitleShowAtRight={true}
                                showRightTextWithBgView={false}
                                rightShowTitle={
                                    this.props.OrderGetOrderEmploysDown
                                    && this.props.OrderGetOrderEmploysDown.employee
                                    && this.props.OrderGetOrderEmploysDown.employee.user
                                    && this.props.OrderGetOrderEmploysDown.employee.user.areaProvinceName ?
                                        this.props.OrderGetOrderEmploysDown.employee.user.areaProvinceName +
                                        this.props.OrderGetOrderEmploysDown.employee.user.areaCityName +
                                        this.props.OrderGetOrderEmploysDown.employee.user.areaAreaAndCountyName +
                                        this.props.OrderGetOrderEmploysDown.employee.user.areaAddress : ''
                                }
                                bottomViewHeight={9.6}
                            />

                            <CommonListItemView
                                leftTitle={'工种'}
                                rightType={'next'}
                                rootNotTouchable={true}
                                showRightAvator={false}
                                rightShowTitleShowAtRight={true}
                                showRightTextWithBgView={false}
                                rightShowTitle={this._myWorkTypesShow()}
                                bottomViewHeight={2}
                            />
                            <CommonListItemView
                                leftTitle={'工龄'}
                                rightType={'next'}
                                rootNotTouchable={true}
                                showRightAvator={false}
                                rightShowTitleShowAtRight={true}
                                showRightTextWithBgView={false}
                                rightShowTitle={this.props.OrderGetOrderEmploysDown
                                && this.props.OrderGetOrderEmploysDown.employee
                                && this.props.OrderGetOrderEmploysDown.employee.resume
                                && this.props.OrderGetOrderEmploysDown.employee.resume.workExperienceTypeDesc
                                    ? this.props.OrderGetOrderEmploysDown.employee.resume.workExperienceTypeDesc : ''}
                                bottomViewHeight={2}
                            />

                            <CommonListItemView
                                leftTitle={'擅长'}
                                rightType={'next'}
                                rootNotTouchable={true}
                                showRightAvator={false}
                                rightShowTitleShowAtRight={true}
                                showRightTextWithBgView={false}
                                rightShowTitle={this._myWorkGoodAtsShow()}
                                bottomViewHeight={2}
                            />


                            <CommonListItemView
                                leftTitle={'自我评价'}
                                rightType={'next'}
                                rootNotTouchable={true}
                                showRightAvator={false}
                                rightShowTitleShowAtRight={true}
                                showRightTextWithBgView={false}
                                rightShowTitle={this._myWorkSelfEvalsShow()}
                                bottomViewHeight={2}
                            />

                            {/*<CommonListItemView*/}
                            {/*leftTitle={'技术证书'}*/}
                            {/*rightType={'next'}*/}
                            {/**/}
                            {/*bottomViewHeight={2}*/}
                            {/*/>*/}
                        </View>
                    </ScrollView>
                    : <View/>
                }
            </View>
        );
    };
}
const {
    width,
    height
} = Dimensions.get('window');

AdminFragmentManageShowResumeStyles = StyleSheet.create({
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