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

const {
    width,
    height
} = Dimensions.get('window');


import ToastManager from '../../../../../../../utils/toast/Toast.util'
import UserRnaStatus from '../../../../../../../stable/json/user.rna.status'
import AdminFragmentManageShowResume from './admin.fragment.manage.show.resume'
import HeaderCommonView from '../../../../../../views/header/header.common.view'
import Communications from '../../../../../../../utils/call.email.text.common.util'
import CommonListItemView from '../../../../../../views/common/common.list.item.view'
import AdminFragmentShowEmploeesItem from '../../view/admin.fragment.show.emploees.item'
import MobileOrderEmoloyUtils from '../../../../../../../stable/json/mobile.order.emoloy'
import AdminFragmentAdminFragmentDateChoiceScreen from './admin.fragment.date.choice.screen'
import BaseActivity from "../../../../../../views/base.activity";


export default class AdminFragmentManageShowEmploy extends BaseActivity {
    constructor(props) {
        super(props);
        this.state = {
            //如有需要，直接设置为 false 即可变更为不支持雇主强制结束模式
            isOpenBeforeChangWorkEnd: true,
        };
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


    //4.页面跳转
    _pushCompoent = (component: Component, params: any) => {
        if (component) {
            this.props.navigator.push({
                component: component,
                params: params,
            });
        }
    };

    _onShowDetialPressed = (index) => {
        //查看简历
        this._pushCompoent(AdminFragmentManageShowResume, {OrderGetOrderEmploysDown: this.props.OrderGetOrderEmploysDown});
    };

    _onShowManagePressed = (index) => {
        if (this.props.OrderGetOrderEmploysDown && this.props.OrderGetOrderEmploysDown.employee && this.props.OrderGetOrderEmploysDown.employee.user) {
            //电话联系
            this._jumpToCallUs(this.props.OrderGetOrderEmploysDown.employee.user.phone);
        }
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

    _toUpdateWorkEmployeeWorkEnd = (tag) => {
        if (!this.props.OrderGetOrderEmploysDown || !this.props.mobileUserData) {
            return;
        }
        if (tag) {
            ToastManager.alertDialog('提示', '雇员还未完成全部打卡，是否立即提前结束工作，为了不引起不不必要的纠纷，请务必同雇员线下沟通好后再进行此项操作。是否继续？', '取消', () => {
            }, '继续', () => {
                MobileOrderEmoloyUtils.changeEmployeeWorkEndStatus(this.props.mobileUserData, this.props.OrderGetOrderEmploysDown.employ, 1, () => {
                    ToastManager.alertWithSure('提示', '结束工作成功!', () => {
                        if (this.props.onPunchCardSuccessCallback) {
                            this.props.onPunchCardSuccessCallback();
                        }
                        if (this.props.navigator) {
                            this.props.navigator.pop();
                        }
                    });
                });
            });
        }
    };

    _gener_bottom_show = () => {
        if (this.state.isOpenBeforeChangWorkEnd) {
            return (
                <TouchableOpacity
                    onPress={() => this._toUpdateWorkEmployeeWorkEnd(true)}
                    style={{
                        height: 48,
                        flexDirection: 'row',
                        justifyContent: 'center',
                        alignItems: 'center',
                        backgroundColor: '#D3D3D3',
                    }}
                >
                    <Text
                        style={[
                            AdminFragmentManageShowEmployStyles.normal_text, {
                                color: '#FFFFFF',
                                fontSize: 14,
                            }]}>提前结束工作
                    </Text>
                </TouchableOpacity>
            );
        }

    };

    render() {
        return (
            <View style={AdminFragmentManageShowEmployStyles.root}>
                <HeaderCommonView navigator={this.props.navigator}
                                  bgColor={'#FFCC33'}
                                  headerLeftShow={true}
                                  headerCenterShow={true}
                                  headerRightShow={false}
                                  showCenterAfterLeft={true}
                                  headerCenterTitle={'查看考勤'}/>
                <ScrollView style={AdminFragmentManageShowEmployStyles.function_list}
                            keyboardShouldPersistTaps={'always'}
                            contentContainerStyle={AdminFragmentManageShowEmployStyles.function_list_contentContainer}
                >
                    <View style={{backgroundColor: '#FFFFFF',}}>
                        <View style={AdminFragmentManageShowEmployStyles.cut_line_view}/>
                        <AdminFragmentShowEmploeesItem
                            id={0}
                            itemData={this.props.OrderGetOrderEmploysDown.employee}
                            showFuntion={this.props.OrderGetOrderEmploysDown.employ.order.workOrderStatus === 1}
                            itemFunctionData={this.props.OrderGetOrderEmploysDown.employ}
                            rightIemShow={'电话联系'}
                            onShowDetialPressed={() => this._onShowDetialPressed(0)}
                            onShowManagePressed={() => this._onShowManagePressed(0)}
                        />
                        <View style={{height: 10, backgroundColor: '#FBFBFB',}}/>
                        <View style={{flex: 1}}>
                            <AdminFragmentAdminFragmentDateChoiceScreen
                                workStartTime={this.props.OrderGetOrderEmploysDown && this.props.OrderGetOrderEmploysDown.employ && this.props.OrderGetOrderEmploysDown.employ.order ? this.props.OrderGetOrderEmploysDown.employ.order.workStartTime + ' ' : null}
                                workStopTime={this.props.OrderGetOrderEmploysDown && this.props.OrderGetOrderEmploysDown.employ && this.props.OrderGetOrderEmploysDown.employ.order ? this.props.OrderGetOrderEmploysDown.employ.order.workStopTime + ' ' : null}
                                punchCards={this.props.OrderGetOrderEmploysDown && this.props.OrderGetOrderEmploysDown.employ && this.props.OrderGetOrderEmploysDown.employ.punchCards ? this.props.OrderGetOrderEmploysDown.employ.punchCards : null}
                            />
                        </View>
                    </View>
                </ScrollView>
                {this._gener_bottom_show()}
            </View>
        );
    };
}
AdminFragmentManageShowEmployStyles = StyleSheet.create({
    //基于flex-box布局
    root: {
        flex: 1,
        flexDirection: 'column',
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
    cut_line_view: {
        height: 10,
        backgroundColor: '#FBFBFB',
    },
});