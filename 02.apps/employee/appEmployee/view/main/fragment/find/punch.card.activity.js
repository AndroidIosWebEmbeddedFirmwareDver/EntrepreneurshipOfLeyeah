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


import DateChoiceScreen from './date.choice.screen'
import ToastManager from '../../../../utils/toast/Toast.util'
import DateCommonUtil from '../../../../utils/date.common.util'
import NetworkCommonUtil from '../../../../utils/network.common.util'
import HeaderCommonView from '../../../views/header/header.common.view'
import DialogManagerUtil from '../../../views/dialog/dialog.manager.util'
import Communications from '../../../../utils/call.email.text.common.util'
import MobileOrderEmoloyUtils from '../../../../stable/json/mobile.order.emoloy'
import UserDataManager from '../../../../utils/storage/user.data.manager.common.util'
import PunchCardToPunchCardToPunchCardActivity from './punch.card.to.punch.card.activity'
import BaseActivity from "../../../views/base.activity";


export default class PunchCardActivity extends BaseActivity {
    //1.
    constructor(props) {
        super(props);
        this.state = {
            mobileUserData: null,
            responValue: '',
            mainThemeColor: null,
            isNeddShowPunchCardToday: false,
            isMeHadPunchCardToday: false,
            punchCards: null,
            //如有需要，直接设置为true即可变更为支持雇员强制结束模式
            isOpenBeforeChangWorkEnd: false,
        };
    }

    //2.
    componentWillMount() {
        super.componentWillMount();
        if (this.props.data && this.props.data.punchCards) {
            this.setState({
                punchCards: this.props.data.punchCards,
            });
        }
        this._refreshUserData().then((ret) => {
            this._initQueryIsMeTodayPunchCard(this.props.data);
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


    //4.查询本地缓存用户数据
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

    //5.页面跳转
    _pushCompoent = (component: Component, params: any) => {
        if (!component) {
            return;
        }
        this.props.navigator.push({
            component: component,
            params: params,
        });
    };

    _initQueryIsMeTodayPunchCard = (orderDownData) => {
        if (!orderDownData || !this.state.mobileUserData) {
            return;
        }
        let paramsObject = {
            orderId: orderDownData.order.id,
            orderNum: orderDownData.order.orderNum,
            workStartTime: orderDownData.order.workStartTime,
            workStopTime: orderDownData.order.workStopTime,
            workEmployerId: orderDownData.employer.id,
            workEmployeeId: this.state.mobileUserData.data.id,//排序方式
        };
        NetworkCommonUtil.httpPostRequest(JSON.stringify(paramsObject), NetworkCommonUtil.SERVERURL_POST_ORDER_PUNCHCARD_ISPUNCHCARD).then((val: any) => {
            // alert(JSON.stringify(val));
            if (val && val.code === NetworkCommonUtil.SERVER_HTTP_TASK_STATUS_SUCCESS) {
                if (val.data) {
                    this.setState({
                        isNeddShowPunchCardToday: true,
                        isMeHadPunchCardToday: true,
                    });
                } else {
                    this.setState({
                        isNeddShowPunchCardToday: true,
                        isMeHadPunchCardToday: false,
                    });
                }
            } else if (val && val.code === NetworkCommonUtil.SERVER_HTTP_TASK_STATUS_ERROR) {
                this.setState({
                    isNeddShowPunchCardToday: false,
                    isMeHadPunchCardToday: false,
                });
            } else {
                this.setState({
                    isNeddShowPunchCardToday: false,
                    isMeHadPunchCardToday: false,
                });
                // ToastManager.show('请求网络出错' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            }
        });
    };

    //---------------------

    _toUpdateWorkEmployeeWorkEnd = (tag) => {
        if (!this.props.data || !this.state.mobileUserData) {
            return;
        }
        if (tag) {
            ToastManager.alertDialog('提示', '还未完成全部打卡，是否立即提前结束工作，为了不引起不不必要的纠纷，请务必同你的雇主线下沟通好后再进行此项操作。是否继续？', '取消', () => {
                },
                '继续', () => {
                    MobileOrderEmoloyUtils.changeEmployeeWorkEndStatus(this.state.mobileUserData, this.props.data, () => {
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
        } else {
            ToastManager.alertDialog('提示', '已经完成全部打卡，是否立即结束工作，为了不引起不不必要的纠纷，请务必同你的雇主线下沟通好后再进行此项操作。是否继续？', '取消', () => {
                },
                '继续', () => {
                    MobileOrderEmoloyUtils.changeEmployeeWorkEndStatus(this.state.mobileUserData, this.props.data, () => {
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

    _toPunchOrderCardToday = (orderDownData) => {
        if (!orderDownData || !this.state.mobileUserData) {
            return;
        }
        let paramsObject = {
            data: this.props.data,
            params: {
                orderId: orderDownData.order.id,
                orderNum: orderDownData.order.orderNum,
                workStartTime: orderDownData.order.workStartTime,
                workStopTime: orderDownData.order.workStopTime,
                workEmployerId: orderDownData.employer.id,
                workEmployeeId: this.state.mobileUserData.data.id,
            },
            onPunchCardCallback: (tag, data) => this._onPunchCardCallback(tag, data),
        };
        this._pushCompoent(PunchCardToPunchCardToPunchCardActivity, paramsObject);
    };

    _onPunchCardCallback = (tag, data) => {
        this.setState({isMeHadPunchCardToday: tag});
        if (tag && data) {
            this.state.punchCards.push(data);
            this.setState({
                punchCards: this.state.punchCards,
            });
            if (this.props.onPunchCardSuccessCallback) {
                this.props.onPunchCardSuccessCallback();
            }
        }
    };

    _gener_bottom_show = () => {
        if (this.props.data && this.props.data.order && this.state.punchCards.length > 0 && this.state.punchCards.length
            === (DateCommonUtil.twODaysDifferenceValue(this.props.data.order.workStopTime, this.props.data.order.workStartTime) + 1)) {
            return (<TouchableOpacity
                    onPress={() => this._toUpdateWorkEmployeeWorkEnd(false)}
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
                            PunchCardActivityStyles.normal_text, {
                                color: '#FFFFFF',
                                fontSize: 14,
                            }]}>立即结束工作</Text>
                </TouchableOpacity>
            );
        } else if (this.state.isOpenBeforeChangWorkEnd) {
            return (<TouchableOpacity
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
                            PunchCardActivityStyles.normal_text, {
                                color: '#FFFFFF',
                                fontSize: 14,
                            }]}>提前结束工作</Text>
                </TouchableOpacity>
            );
        }

    };

    render() {
        const {navigator} = this.props.navigator;
        return (
            <View style={PunchCardActivityStyles.root}>
                <HeaderCommonView navigator={this.props.navigator}
                                  bgColor={'#FFCC33'}
                                  headerLeftShow={true}
                                  headerCenterShow={true}
                                  headerRightShow={this.state.isNeddShowPunchCardToday}
                                  headerRightButtonTitle={this.state.isMeHadPunchCardToday ? '今日已打卡' : '打卡'}
                                  headerRightButtonOnpress={this.state.isMeHadPunchCardToday ? () => {
                                  } : () => this._toPunchOrderCardToday(this.props.data)}
                                  showCenterAfterLeft={true}
                                  headerCenterTitle={'工作处理'}/>
                {this.props.data ?
                    <ScrollView style={PunchCardActivityStyles.function_list}
                                keyboardShouldPersistTaps={'always'}
                                contentContainerStyle={FindDetialActivityStyles.function_list_contentContainer}
                    >
                        <View style={{backgroundColor: '#FFFFFF',}}>
                            <View style={PunchCardActivityStyles.container}>
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
                                    <View style={{
                                        flex: 1,
                                        marginRight: 9.6,
                                        flexDirection: 'column',
                                    }}>
                                        <Text
                                            style={[PunchCardActivityStyles.normal_text, {
                                                flex: 1,
                                                fontSize: 14,
                                            }]}>{this.props.data && this.props.data.employer && this.props.data.employer.name ? this.props.data.employer.name : ''}</Text>

                                        <View style={{
                                            // flex: 1,
                                            marginTop: 4.8,
                                            flexDirection: 'row',
                                            justifyContent: 'flex-start',
                                            alignItems: 'flex-end',
                                        }}>
                                            <Text
                                                style={[PunchCardActivityStyles.normal_text, {
                                                    color: '#707070',
                                                    fontSize: 12,
                                                }]}>{this.props.data && this.props.data.order && this.props.data.order.orderWokerTypeName ? this.props.data.order.orderWokerTypeName + ' ' : ''}</Text>
                                            <Text
                                                style={[PunchCardActivityStyles.normal_text, {
                                                    color: '#707070',
                                                    fontSize: 12,
                                                }]}>评分：4.7</Text>
                                        </View>
                                    </View>
                                    <View style={{
                                        flexDirection: 'row',
                                        justifyContent: 'flex-end',
                                        alignItems: 'flex-start',
                                    }}>
                                        <View style={[{
                                            backgroundColor: '#0088F3',
                                            borderColor: '#0088F3',
                                            borderTopLeftRadius: 9.6,
                                            borderBottomLeftRadius: 9.6,
                                            borderTopRightRadius: 9.6,
                                            borderBottomRightRadius: 9.6,
                                            paddingLeft: 4.8,
                                            paddingRight: 4.8,
                                            paddingTop: 2.4,
                                            paddingBottom: 2.4,
                                        }]}>
                                            <Text
                                                style={[PunchCardActivityStyles.normal_text, {
                                                    color: '#FFFFFF',
                                                    fontSize: 12,
                                                }]}>上工中</Text>
                                        </View>
                                    </View>
                                </View>
                            </View>

                            <View style={[PunchCardActivityStyles.container_view, {}]}>

                                <View style={[PunchCardActivityStyles.container_view, {
                                    flex: 1,
                                    flexDirection: 'column',
                                    justifyContent: 'flex-start',
                                    alignItems: 'flex-start',
                                    margin: 0,
                                }]}>
                                    <Text
                                        style={[PunchCardActivityStyles.normal_text, {
                                            color: '#707070',
                                            fontSize: 12,
                                        }]}>时间:</Text>
                                    <Text
                                        style={[PunchCardActivityStyles.normal_text, {
                                            marginTop: 9.6 / 2,
                                            fontSize: 12,
                                        }]}>
                                        {this.props.data && this.props.data.order && this.props.data.order.workStartTime ? this.props.data.order.workStartTime + ' ' : ''}
                                        /
                                        {this.props.data && this.props.data.order && this.props.data.order.workStopTime ? ' ' + this.props.data.order.workStopTime : ''}
                                    </Text>
                                </View>
                                <View style={[PunchCardActivityStyles.container_view, {
                                    flex: 1,
                                    flexDirection: 'column',
                                    justifyContent: 'flex-start',
                                    alignItems: 'flex-start',
                                    margin: 0,
                                }]}>
                                    <Text
                                        style={[FindDetialActivityStyles.normal_text, {
                                            color: '#707070',
                                            fontSize: 12,
                                        }]}>待遇:</Text>
                                    <Text
                                        style={[FindDetialActivityStyles.normal_text, {
                                            color: '#707070',
                                            marginTop: 9.6 / 2,
                                            fontSize: 12,
                                        }]}>
                                        {this.props.data && this.props.data.rewards && this.props.data.rewards.rewardMoney >= 0 ? '￥' + this.props.data.rewards.rewardMoney : ''}
                                        {this.props.data && this.props.data.rewards && this.props.data.rewards.rewardType >= 0 ? this.props.data.rewards.rewardType === 0 ? ' / 每天' : ' / 总价' : ''}
                                        {this.props.data && this.props.data.rewards && this.props.data.rewards.provideBoard >= 0 ? this.props.data.rewards.provideBoard === 0 ? '' : ' / 包吃' : ''}
                                        {this.props.data && this.props.data.rewards && this.props.data.rewards.provideRoom >= 0 ? this.props.data.rewards.provideRoom === 0 ? '' : ' / 包住' : ''}
                                    </Text>
                                </View>
                            </View>
                            <View style={[PunchCardActivityStyles.container_view, {
                                flexDirection: 'column',
                                justifyContent: 'flex-start',
                                alignItems: 'flex-start',
                                margin: 9.6,
                            }]}>
                                <Text
                                    style={[PunchCardActivityStyles.normal_text, {
                                        color: '#707070',
                                        fontSize: 12,
                                    }]}>工作地点:</Text>
                                <Text
                                    style={[PunchCardActivityStyles.normal_text, {
                                        color: '#707070',
                                        marginTop: 9.6 / 2,
                                        fontSize: 12,
                                    }]}>
                                    {this.props.data ? this.props.data.order ? this.props.data.order.workAddress + ' ' : '' : ''}
                                </Text>
                            </View>
                            <View style={{height: 10, backgroundColor: '#FBFBFB',}}/>
                            <View style={{flex: 1}}>
                                <DateChoiceScreen
                                    workStartTime={this.props.data && this.props.data.order ? this.props.data.order.workStartTime + ' ' : null}
                                    workStopTime={this.props.data && this.props.data.order ? this.props.data.order.workStopTime + ' ' : null}
                                    punchCards={this.props.data && this.props.data.punchCards && this.state.punchCards ? this.state.punchCards : null}
                                />
                            </View>
                        </View>
                    </ScrollView>
                    : <View/>
                }
                {this._gener_bottom_show()}
            </View>
        );
    };
}


PunchCardActivityStyles = StyleSheet.create({
    root: {
        flex: 1,
        flexDirection: 'column',
        // justifyContent: 'center',
        // alignItems: 'center',
        backgroundColor: '#FBFBFB',
    },
    container: {
        flexDirection: 'row',
        justifyContent: 'flex-start',
        alignItems: 'flex-start',
        margin: 9.6,
        backgroundColor: '#FFFFFF',
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
    container_view: {
        flexDirection: 'row',
        justifyContent: 'flex-start',
        alignItems: 'flex-start',
        margin: 9.6,
    },
    btn_style_full: {
        flex: 1,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        height: 44,
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
        height: 44,
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
