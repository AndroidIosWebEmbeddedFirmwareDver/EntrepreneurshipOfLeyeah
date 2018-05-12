import React, {Component} from 'react';
import {
    Text,
    ScrollView,
    Image,
    Button,
    View,
    Platform,
    PixelRatio,
    Alert,
    TextInput,
    FlatList,
    StyleSheet,
    Dimensions,
    ActivityIndicator,
    TouchableOpacity,
    Linking,
} from 'react-native';

import ToastManager from '../../../../../../../utils/toast/Toast.util'
import DateCommonUtil from '../../../../../../../utils/date.common.util'
import NetworkCommonUtil from '../../../../../../../utils/network.common.util'
import HeaderCommonView from '../../../../../../views/header/header.common.view'
import DialogManagerUtil from '../../../../../../views/dialog/dialog.manager.util'
import MyPublishFragmentListItemView from '../view/my.publish.fragment.list.item.view'
import MobileOrderEmoloyUtils from '../../../../../../../stable/json/mobile.order.emoloy'
import AdminFragmentShowEmploeesItem from '../../../../admin/fragment/view/admin.fragment.show.emploees.item'
import AdminFragmentManageShowResume from '../../../../admin/fragment/show/manage/admin.fragment.manage.show.resume'
import BaseActivity from "../../../../../../views/base.activity";


export default class MyPublishShowManageScreen extends BaseActivity {
    //1.
    constructor(props) {
        super(props);
        this.state = {
            mobileUserData: null,
            order: null,
            responValue: null,
            backViewShow: '努力加载中...',
        };
    }

    //2.
    componentWillMount() {
        super.componentWillMount();
        if (this.props.mobileUserData) {
            this.setState({
                mobileUserData: this.props.mobileUserData,
            });
        }
        if (this.props.order) {
            this.setState({
                order: this.props.order,
            });
        }

    }

    //3.
    componentDidMount() {
        super.componentDidMount();
        this._init_quer_order_employees();
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

    _init_quer_order_employees = () => {
        if (this.props.mobileUserData && this.props.mobileUserData.data && this.props.order) {
            let params = {
                id: this.props.order.id,
                workEmployerId: this.props.mobileUserData.data.id,
                workOrderStatus: this.props.order.workOrderStatus,
            };
            NetworkCommonUtil.httpPostRequest(JSON.stringify(params), NetworkCommonUtil.SERVERURL_POST_ORDER_EMPLOY_EMPLOYER_QUERY_ME_ORDER_EMPLOYEES_WITH_EMPLOY_DETIALS).then((val: any) => {
                // alert(JSON.stringify(val));
                if (val && val.code === NetworkCommonUtil.SERVER_HTTP_TASK_STATUS_SUCCESS) {
                    // this.setState({responValue: this._generNetToLocalData(val)});
                    if (val.data && val.data.length > 0) {
                        this.setState({
                            responValue: val,
                            backViewShow: null,
                        });
                    } else {
                        this.setState({
                            responValue: null,
                            backViewShow: '暂无',
                        });
                    }
                } else if (val) {
                    ToastManager.show(val.msg + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
                } else {
                    ToastManager.show('请求网络出错' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
                }
            });
        }
    };

    _chanage_order_work_recruit_status = () => {
        if (this.props.mobileUserData && this.props.mobileUserData.data && this.props.order) {
            DialogManagerUtil.showNormalLoadingDialog();
            let params = {
                id: this.props.order.id,
                workEmployerId: this.props.mobileUserData.data.id,
                workRecruitStatus: 1,//默认0， 默认0， 0-招聘中 1-招聘完成
            };
            NetworkCommonUtil.httpPostRequest(JSON.stringify(params), NetworkCommonUtil.SERVERURL_POST_ORDER_EMPLOY_EMPLOYER_UPDATE_ORDER_RECRUIT_STATUS).then((val: any) => {
                // alert(JSON.stringify(val));
                DialogManagerUtil.hide();
                if (val && val.code === NetworkCommonUtil.SERVER_HTTP_TASK_STATUS_SUCCESS) {
                    ToastManager.alertWithSure('提示', '订单结束招聘成功', () => this._go_back());
                } else if (val) {
                    ToastManager.show(val.msg + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
                } else {
                    ToastManager.show('请求网络出错' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
                }
            });
        }
    };

    _chanage_order_delete = () => {
        if (this.props.mobileUserData && this.props.mobileUserData.data && this.props.order) {
            let params = {
                id: this.props.order.id,
                workEmployerId: this.props.mobileUserData.data.id,
                workOrderStatus: this.props.order.workOrderStatus,
            };
            NetworkCommonUtil.httpPostRequest(JSON.stringify(params), NetworkCommonUtil.SERVERURL_POST_ORDER_EMPLOY_EMPLOYER_DELETE_ORDER).then((val: any) => {
                // alert(JSON.stringify(val));
                if (val && val.code === NetworkCommonUtil.SERVER_HTTP_TASK_STATUS_SUCCESS) {
                    ToastManager.alertWithSure('提示', '订单删除成功', () => this._go_back());
                } else if (val) {
                    ToastManager.show(val.msg + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
                } else {
                    ToastManager.show('请求网络出错' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
                }
            });
        }
    };

    _go_back = () => {
        if (this.props.onManageCallback) {
            this.props.onManageCallback();
        }
        if (this.props.navigator) {
            this.props.navigator.pop();
        }
    };


    //------------------------->
    //keyExtractor tells the list to use the ids for the react keys instead of the default key property.
    _keyExtractor = (item, index) => index;

    _renderFlatListItem = (item, index) => {
        return (
            <AdminFragmentShowEmploeesItem
                id={item.id}
                itemData={this.state.responValue.data[index].employee}
                showFuntion={this.props.order.workOrderStatus === 1}
                itemFunctionData={null}
                rightIemShowBgColor={this.state.responValue && this.state.responValue.data
                && this.state.responValue.data[index] && this.state.responValue.data[index].employ
                && this.state.responValue.data[index].employ.employs
                    ? this.state.responValue.data[index].employ.employs.employerWorkConfirm === 0 ? '#FFCC33'
                        : this.state.responValue.data[index].employ.employs.employerWorkConfirm === 1 ? '#0088F3'
                            : this.state.responValue.data[index].employ.employs.employerWorkConfirm === -1 ? '#FF0000'
                                : '处理录用' : '处理录用'}
                rightIemShow={this.state.responValue && this.state.responValue.data
                && this.state.responValue.data[index] && this.state.responValue.data[index].employ
                && this.state.responValue.data[index].employ.employs
                    ? this.state.responValue.data[index].employ.employs.employerWorkConfirm === 0 ? '处理录用'
                        : this.state.responValue.data[index].employ.employs.employerWorkConfirm === 1 ? '已经录用'
                            : this.state.responValue.data[index].employ.employs.employerWorkConfirm === -1 ? '已经拒绝'
                                : '处理录用' : '处理录用'}
                onShowDetialPressed={() => this._onShowDetialPressed(index)}
                onShowManagePressed={() => this._onShowManagePressed(index)}
            />
        );
    };

    _onShowDetialPressed = (index) => {
        //查看简历
        this._pushCompoent(AdminFragmentManageShowResume, {OrderGetOrderEmploysDown: this.state.responValue.data[index]});
    };

    _onShowManagePressed = (index) => {
        this._doFunctions(index);//1-同意，0-默认，-1-拒绝'
    };

    _doFunctions = (index) => {
        let tag = MobileOrderEmoloyUtils.adjustDoWhat(this.state.responValue.data[index].employ).tag;
        switch (tag) {
            case MobileOrderEmoloyUtils.next_funcs.gotonone://无
                return;
                break;
            case MobileOrderEmoloyUtils.next_funcs.gotoemployerWorkConfirm://雇主立即处理录用
                ToastManager.alertDialogs('提示', '请选择处理方式',
                    [
                        {
                            text: '拒绝录用',
                            onPress: () => {
                                MobileOrderEmoloyUtils.changeEmployerWorkConfirmStatus(this.state.mobileUserData, this.state.responValue.data[index].employ, -1, () => {
                                    this._init_quer_order_employees()
                                });
                            }
                        },
                        {
                            text: '立即录用',
                            onPress: () => {
                                MobileOrderEmoloyUtils.changeEmployerWorkConfirmStatus(this.state.mobileUserData, this.state.responValue.data[index].employ, 1, () => {
                                    this._init_quer_order_employees()
                                });
                            }
                        },
                        {
                            text: '暂不处理',
                            onPress: () => {
                            }
                        }
                    ]);
                return;
                break;
            default:
                return;
                break;
        }
    };

    //<-------------------------

    _gener_base_info_view = () => {
        return (
            <View style={MyPublishShowManageScreenStyles.function_list}>

                <View style={MyPublishShowManageScreenStyles.cut_line_view}/>
                <MyPublishFragmentListItemView
                    id={0}
                    itemData={this.props.order}
                    hiddenBottomFunction={true}
                    hiddenBottomCutLine={true}
                />
                <View style={[MyPublishShowManageScreenStyles.function_list, {
                    alignItems: 'flex-start',
                    justifyContent: 'center',
                    padding: 4.8,
                }]}>
                    <Text
                        style={[MyPublishShowManageScreenStyles.normal_text, {
                            padding: 4.8,
                            fontSize: 14,
                            color: '#666666'
                        }]}>应聘列表</Text>
                </View>
                <View style={[MyPublishShowManageScreenStyles.cut_line_view, {
                    height: 2,
                }]}/>
            </View>
        );
    };
    _gener_center_info_view = () => {
        if (this.state.responValue) {
            return (
                <View style={MyPublishShowManageScreenStyles.function_list}>
                    <FlatList
                        ref={(flatList) => this._flatList = flatList}
                        data={this.state.responValue.data}
                        extraData={this.state}//额外的能引更新的数据，如果不设置，可能导致不会刷新
                        keyExtractor={this._keyExtractor}
                        renderItem={({item, index}) => this._renderFlatListItem(item, index)}
                        contentContainerStyle={MyPublishShowManageScreenStyles.function_list_contentContainer}
                    />
                </View>);
        } else {
            return (
                <View style={[MyPublishShowManageScreenStyles.function_list, {
                    alignItems: 'center',
                    justifyContent: 'center',
                }]}>
                </View>);
        }
    };

    _gener_bottom_info_view = () => {
        return (
            <TouchableOpacity
                onPress={() => this._on_bottom_goto_pressed()}
                style={{
                    height: 48,
                    flexDirection: 'row',
                    justifyContent: 'center',
                    alignItems: 'center',
                    backgroundColor: '#FFCC33',
                }}
            >
                <Text
                    style={[
                        MyPublishShowManageScreenStyles.normal_text, {
                            color: '#FFFFFF',
                            fontSize: 14,
                        }]}>结束招聘</Text>
            </TouchableOpacity>
        );
    };

    _on_bottom_goto_pressed = () => {
        if (this.props.order === null) {
            return;
        }
        ToastManager.alertDialog('提示', '是否立即结束招聘?', '取消', () => {
        }, '确定', () => this._chanage_order_work_recruit_status());
    };

    _on_bottom_delete_pressed = () => {
    };

    render() {
        return (
            <View style={MyPublishShowManageScreenStyles.container}>
                <HeaderCommonView navigator={this.props.navigator}
                                  bgColor={'#FFCC33'}
                                  headerLeftShow={true}
                                  headerCenterShow={true}
                                  headerRightShow={false}
                                  showCenterAfterLeft={true}
                                  headerCenterTitle={'管理招聘'}/>
                <ScrollView style={MyPublishShowManageScreenStyles.function_list}
                            contentContainerStyle={MyPublishShowManageScreenStyles.function_list_contentContainer}>
                    {this._gener_base_info_view()}
                    {this._gener_center_info_view()}
                </ScrollView>
                {this._gener_bottom_info_view()}


            </View>
        );
    };
}


MyPublishShowManageScreenStyles = StyleSheet.create({
    //基于flex-box布局
    container: {
        flex: 1,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FFFFFF',
    },
    function_list: {
        flex: 1,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
    },
    function_list_contentContainer: {
        // paddingVertical: 16,
        //暂时解决安卓下布局显示不完整
        paddingBottom: 24,
    },
    bottom_line_view: {
        height: 48,
        flexDirection: 'row',
        backgroundColor: '#FFCC33',
    },
    function_bottom_style_cut_line: {
        width: 2,
        height: 48,
        backgroundColor: '#FFCC33',
        flexDirection: 'column',
        justifyContent: 'center',
        alignItems: 'center',
    },
    function_bottom_style_cut_line_View: {
        height: 32,
        width: 2,
        backgroundColor: '#FFFFFF',
    },
    cut_line_view: {
        height: 10,
        backgroundColor: '#FBFBFB',
    },
    normal_text: {
        fontSize: 16,
        color: '#000000',
    }
});
