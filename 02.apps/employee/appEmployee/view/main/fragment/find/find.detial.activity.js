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

import ToastManager from '../../../../utils/toast/Toast.util'
import NetworkCommonUtil from '../../../../utils/network.common.util'
import UserDataManager from '../../../../utils/storage/user.data.manager.common.util'
import DialogManagerUtil from '../../../views/dialog/dialog.manager.util'

import Communications from '../../../../utils/call.email.text.common.util';


import HeaderCommonView from '../../../views/header/header.common.view'
import BaseActivity from "../../../views/base.activity";


export default class FindDetialActivity extends BaseActivity {
    //1.
    constructor(props) {
        super(props);
        this.state = {
            mobileUserData: null,
            responValue: '',
            mainThemeColor: null,
            isMeHadSendResume: false,
            isMeHadLoveThisOrder: false,
        };
    }

    //2.
    componentWillMount() {
        super.componentWillMount();
        this._refreshUserData().then((ret) => {
            this._initQueryIsMeHadSendResume(this.props.data);

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


    _initQueryIsMeHadSendResume = (orderDownData) => {
        if (!orderDownData || !this.state.mobileUserData) {
            return;
        }
        let paramsObject = {
            'orderId': orderDownData.order.id,
            'workEmployerId': orderDownData.employer.id,
            'workEmployeeId': this.state.mobileUserData.data.id,//排序方式
        };
        NetworkCommonUtil.httpPostRequest(JSON.stringify(paramsObject), NetworkCommonUtil.SERVERURL_POST_ORDER_RESUME_IS_SENDRESUME).then((val: any) => {
            // alert(JSON.stringify(val));
            this._initQueryIsThisOrderIHadLoved(this.props.data);
            if (val && val.code === NetworkCommonUtil.SERVER_HTTP_TASK_STATUS_SUCCESS) {
                if (val.data && val.data.hadEmployeeSendResume) {
                    this.setState({isMeHadSendResume: true});
                } else {
                    this.setState({isMeHadSendResume: false});
                }
            } else if (val) {
                this.setState({isMeHadSendResume: false});
                // ToastManager.show(JSON.stringify(val) + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            } else {
                this.setState({isMeHadSendResume: false});
                // ToastManager.show('请求网络出错' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            }
        });
    };


    _initQueryIsThisOrderIHadLoved = (orderDownData) => {
        if (!orderDownData || !this.state.mobileUserData) {
            return;
        }
        let paramsObject = {
            'orderId': orderDownData.order.id,
            'orderNum': orderDownData.order.orderNum,
            'workEmployerId': orderDownData.employer.id,
            'workEmployeeId': this.state.mobileUserData.data.id,
        };
        NetworkCommonUtil.httpPostRequest(JSON.stringify(paramsObject), NetworkCommonUtil.SERVERURL_POST_ORDER_LOVE_QUERY_ISMELOVETHISORDER).then((val: any) => {
            // alert(JSON.stringify(val));
            if (val && val.code === NetworkCommonUtil.SERVER_HTTP_TASK_STATUS_SUCCESS) {
                this.setState({isMeHadLoveThisOrder: true});
            } else if (val) {
                this.setState({isMeHadLoveThisOrder: false});
            } else {
                ToastManager.show('请求网络出错' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            }
        });
    };
    //---------------------

    _orderResumeSendResume = (orderDownData) => {
        if (!orderDownData || !this.state.mobileUserData) {
            return;
        }
        DialogManagerUtil.showNormalLoadingDialog();
        let paramsObject = {
            'orderId': orderDownData.order.id,
            'workEmployerId': orderDownData.employer.id,
            'workEmployeeId': this.state.mobileUserData.data.id,
        };
        NetworkCommonUtil.httpPostRequest(JSON.stringify(paramsObject), NetworkCommonUtil.SERVERURL_POST_ORDER_RESUME_SENDRESUME).then((val: any) => {
            DialogManagerUtil.hide();
            // alert(JSON.stringify(val));
            if (val && val.code === NetworkCommonUtil.SERVER_HTTP_TASK_STATUS_SUCCESS) {
                this.setState({isMeHadSendResume: true});
                ToastManager.show(val.msg + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            } else if (val) {
                ToastManager.show(val.msg + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            } else {
                ToastManager.show('请求网络出错' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            }
        });
    };


    _orderToLoveTome = (orderDownData) => {
        if (!orderDownData || !this.state.mobileUserData) {
            return;
        }

        DialogManagerUtil.showNormalLoadingDialog();
        let paramsObject = {
            'orderId': orderDownData.order.id,
            'orderNum': orderDownData.order.orderNum,
            'workEmployerId': orderDownData.employer.id,
            'workEmployeeId': this.state.mobileUserData.data.id,
        };
        NetworkCommonUtil.httpPostRequest(JSON.stringify(paramsObject), NetworkCommonUtil.SERVERURL_POST_ORDER_LOVE_CREATE).then((val: any) => {
            DialogManagerUtil.hide();
            // alert(JSON.stringify(val));
            if (val && val.code === NetworkCommonUtil.SERVER_HTTP_TASK_STATUS_SUCCESS) {
                this.setState({isMeHadLoveThisOrder: true});
                ToastManager.show(val.msg + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            } else if (val) {
                ToastManager.show(val.msg + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            } else {
                ToastManager.show('请求网络出错' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            }
        });
    };


    _orderCllEmployer = (orderDownData) => {
        if (!orderDownData || !this.state.mobileUserData || !orderDownData.employer || !orderDownData.employer.phone) {
            return;
        }
        ToastManager.alertDialog('提示', '是否立即拨打' + orderDownData.employer.phone, '取消', () => {
        }, '确定', () => {
            Communications.phonecall(orderDownData.employer.phone, false);
        });
    };

    render() {
        const {navigator} = this.props.navigator;
        return (
            <View style={FindDetialActivityStyles.root}>
                <HeaderCommonView navigator={this.props.navigator}
                                  bgColor={'#FFCC33'}
                                  headerLeftShow={true}
                                  headerCenterShow={true}
                                  headerRightShow={true}
                                  headerRightButtonTitle={this.state.isMeHadLoveThisOrder ? '已收藏' : '收藏'}
                                  headerRightButtonOnpress={this.state.isMeHadLoveThisOrder ? () => {
                                  } : () => this._orderToLoveTome(this.props.data)}
                                  showCenterAfterLeft={true}
                                  headerCenterTitle={'工作详情'}/>
                <TouchableOpacity style={FindDetialActivityStyles.container_view}>
                    <Image
                        source={this.props.data && this.props.data.employer && this.props.data.employer.avatarUrl ? {uri: this.props.data.employer.avatarUrl} : require('../../../../stable/image/main/ic_main_comp_normal.png')}
                        style={{width: 56, height: 56, resizeMode: 'center',}}
                    />
                    <View style={{
                        flex: 1,
                        minHeight: 56,
                        flexDirection: 'row',
                        justifyContent: 'flex-start',
                        alignItems: 'center',
                        marginLeft: 9.6,
                    }}>
                        <Text
                            style={[FindDetialActivityStyles.normal_text, {
                                flex: 1,
                                marginRight: 9.6,
                            }]}>{this.props.data && this.props.data.employer && this.props.data.employer.name ? this.props.data.employer.name : ''}</Text>
                        <View style={{
                            flexDirection: 'row',
                            justifyContent: 'flex-end',
                            alignItems: 'center',
                        }}>
                            <Image
                                source={require('../../../../stable/image/ic_app_more.png')}
                                style={{width: 12, height: 32, resizeMode: 'cover',}}
                            />
                        </View>
                    </View>
                </TouchableOpacity>
                <View style={{height: 10, backgroundColor: '#FBFBFB',}}/>
                <View style={[FindDetialActivityStyles.container_view, {alignItems: 'center'}]}>
                    <View style={{backgroundColor: '#00CEF3'}}>
                        <Image
                            source={require('../../../../stable/image/ic_app_menu.png')}
                            style={{width: 12, height: 12, resizeMode: 'cover',}}
                        />
                    </View>
                    <Text
                        style={[FindDetialActivityStyles.normal_text, {
                            flex: 1,
                            marginLeft: 9.6,
                        }]}>工作描述</Text>
                </View>
                <View style={[FindDetialActivityStyles.container_view, {alignItems: 'center'}]}>
                    <Text
                        style={[FindDetialActivityStyles.normal_text, {
                            color: '#FF7514',
                            fontSize: 14,
                        }]}>招聘岗位:</Text>
                    <Text
                        style={[FindDetialActivityStyles.normal_text, {
                            flex: 1,
                            marginLeft: 9.6,
                            color: '#FF7514',
                            fontSize: 14,
                        }]}>{this.props.data && this.props.data.order && this.props.data.order.orderWokerTypeName ? this.props.data.order.orderWokerTypeName : ''}</Text>
                </View>
                <View style={[FindDetialActivityStyles.container_view, {alignItems: 'center'}]}>
                    <Text
                        style={[FindDetialActivityStyles.normal_text, {
                            color: '#707070',
                            fontSize: 14,
                        }]}>福利待遇:</Text>
                    <Text
                        style={[FindDetialActivityStyles.normal_text, {
                            flex: 1,
                            marginLeft: 9.6,
                            color: '#707070',
                            fontSize: 14,
                        }]}>
                        {this.props.data && this.props.data.rewards && this.props.data.rewards.rewardMoney >= 0 ? '￥' + this.props.data.rewards.rewardMoney : ''}
                        {this.props.data && this.props.data.rewards && this.props.data.rewards.rewardType >= 0 ? this.props.data.rewards.rewardType === 0 ? ' / 每天' : ' / 总价' : ''}
                        {this.props.data && this.props.data.rewards && this.props.data.rewards.provideBoard >= 0 ? this.props.data.rewards.provideBoard === 0 ? '' : ' / 包吃' : ''}
                        {this.props.data && this.props.data.rewards && this.props.data.rewards.provideRoom >= 0 ? this.props.data.rewards.provideRoom === 0 ? '' : ' / 包住' : ''}
                    </Text>
                </View>
                <View style={[FindDetialActivityStyles.container_view, {alignItems: 'center'}]}>
                    <Text
                        style={[FindDetialActivityStyles.normal_text, {
                            color: '#707070',
                            fontSize: 14,
                        }]}>岗位要求:</Text>
                    <Text
                        style={[FindDetialActivityStyles.normal_text, {
                            flex: 1,
                            marginLeft: 9.6,
                            color: '#707070',
                            fontSize: 14,
                        }]}>{this.props.data && this.props.data.order && this.props.data.order.workDescription ? this.props.data.order.workDescription : ''}</Text>
                </View>
                <View style={[FindDetialActivityStyles.container_view, {alignItems: 'center'}]}>
                    <Text
                        style={[FindDetialActivityStyles.normal_text, {
                            color: '#707070',
                            fontSize: 14,
                        }]}>经验要求:</Text>
                    <Text
                        style={[FindDetialActivityStyles.normal_text, {
                            flex: 1,
                            marginLeft: 9.6,
                            color: '#707070',
                            fontSize: 14,
                        }]}>{this.props.data && this.props.data.order && this.props.data.order.workExperienceRequireTypeDesc ? this.props.data.order.workExperienceRequireTypeDesc : ''}</Text>
                </View>
                <View style={[FindDetialActivityStyles.container_view, {alignItems: 'center'}]}>
                    <Text
                        style={[FindDetialActivityStyles.normal_text, {
                            color: '#707070',
                            fontSize: 14,
                        }]}>工作周期:</Text>
                    <Text
                        style={[FindDetialActivityStyles.normal_text, {
                            flex: 1,
                            marginLeft: 9.6,
                            color: '#707070',
                            fontSize: 14,
                        }]}>
                        {this.props.data && this.props.data.order && this.props.data.order.workStartTime ? this.props.data.order.workStartTime + ' ' : ''}
                        /
                        {this.props.data && this.props.data.order && this.props.data.order.workStopTime ? ' ' + this.props.data.order.workStopTime : ''}
                    </Text>
                </View>

                <View style={[FindDetialActivityStyles.container_view, {alignItems: 'center'}]}>
                    <Text
                        style={[FindDetialActivityStyles.normal_text, {
                            color: '#707070',
                            fontSize: 14,
                        }]}>工作地点:</Text>
                    <Text
                        style={[FindDetialActivityStyles.normal_text, {
                            flex: 1,
                            marginLeft: 9.6,
                            color: '#707070',
                            fontSize: 14,
                        }]}>
                        {this.props.data && this.props.data.order && this.props.data.order.workAddress ? this.props.data.order.workAddress + ' ' : ''}
                    </Text>
                </View>
                <View style={[FindDetialActivityStyles.container_view, {alignItems: 'center'}]}>
                    <Text
                        style={[FindDetialActivityStyles.normal_text, {
                            color: '#707070',
                            fontSize: 14,
                        }]}>联系电话:</Text>
                    <Text
                        style={[FindDetialActivityStyles.normal_text, {
                            flex: 1,
                            marginLeft: 9.6,
                            color: '#707070',
                            fontSize: 14,
                        }]}>
                        {this.props.data && this.props.data.employer && this.props.data.employer.phone ? this.props.data.employer.phone + ' ' : ''}
                    </Text>
                </View>
                <View style={{flex: 1, alignItems: 'center'}}/>
                <View style={[FindDetialActivityStyles.container_view, {
                    alignItems: 'center',
                    marginBottom: 9.6,
                }]}>
                    <TouchableOpacity
                        style={FindDetialActivityStyles.btn_style_full}
                        onPress={() => this._orderCllEmployer(this.props.data)}
                    >
                        <Text
                            style={[FindDetialActivityStyles.normal_text, {
                                color: '#FFFFFF',
                                fontSize: 14,
                            }]}>电话沟通</Text>
                    </TouchableOpacity>
                    {!this.state.isMeHadSendResume ?
                        <TouchableOpacity
                            style={FindDetialActivityStyles.btn_style_border}
                            onPress={() => this._orderResumeSendResume(this.props.data)}
                        >
                            <Text
                                style={[FindDetialActivityStyles.normal_text, {
                                    color: '#FFCC33',
                                    fontSize: 14,
                                }]}>投递简历</Text>
                        </TouchableOpacity>
                        :
                        <View
                            style={[FindDetialActivityStyles.btn_style_border, {
                                backgroundColor: '#D3D3D3',
                                borderColor: '#D3D3D3',
                            }]}
                            onPress={() => this._orderResumeSendResume(this.props.data)}
                        >
                            <Text
                                style={[FindDetialActivityStyles.normal_text, {
                                    color: '#FFFFFF',
                                    fontSize: 14,
                                }]}>已经投递</Text>
                        </View>
                    }
                </View>
            </View>
        );
    };
}


FindDetialActivityStyles = StyleSheet.create({
    root: {
        flex: 1,
        flexDirection: 'column',
        // justifyContent: 'center',
        // alignItems: 'center',
    },
    container: {
        flex: 1,
        flexDirection: 'column',
    },
    container_view: {
        flexDirection: 'row',
        justifyContent: 'flex-start',
        alignItems: 'flex-start',
        marginLeft: 9.6,
        marginRight: 9.6,
        marginTop: 2.4,
        marginBottom: 2.4,
    },
    btn_style_full: {
        flex: 1,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        height: 36,
        backgroundColor: '#FFCC33',
        justifyContent: 'center',
        alignItems: 'center',
        borderRadius: 4.8,
        borderColor: '#FFCC33',
        borderWidth: 2,
    },
    btn_style_border: {
        flex: 2,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        height: 36,
        backgroundColor: 'transparent',
        justifyContent: 'center',
        alignItems: 'center',
        borderRadius: 4.8,
        borderColor: '#FFCC33',
        borderWidth: 2,
        marginLeft: 9.6,
    },
    normal_text: {
        fontSize: 16,
    }
});
