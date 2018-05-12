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
import CommonListItemView from '../../../views/common/common.list.item.view'
import UserDataManager from '../../../../utils/storage/user.data.manager.common.util'
import BaseActivity from "../../../views/base.activity";


export default class PunchCardToPunchCardToPunchCardActivity extends BaseActivity {
    //1.
    constructor(props) {
        super(props);
        this.state = {
            mobileUserData: null,
            responValue: '',
        };
    }

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

    _toPunchOrderCardToday = (orderDownData) => {
        if (!this.props.params) {
            return;
        }
        DialogManagerUtil.showNormalLoadingDialog();
        NetworkCommonUtil.httpPostRequest(JSON.stringify(this.props.params), NetworkCommonUtil.SERVERURL_POST_ORDER_PUNCHCARD_CREATE).then((val: any) => {
            DialogManagerUtil.hide();
            // alert(JSON.stringify(val));
            if (val && val.code === NetworkCommonUtil.SERVER_HTTP_TASK_STATUS_SUCCESS) {

                if (this.props.onPunchCardCallback) {
                    this.props.onPunchCardCallback(true, val.data);
                }
            } else if (val) {
                if (this.props.onPunchCardCallback) {
                    this.props.onPunchCardCallback(false, null);
                }
            } else {
                if (this.props.onPunchCardCallback) {
                    this.props.onPunchCardCallback(false, null);
                }
            }
            if (this.props.navigator) {
                this.props.navigator.pop();
            }
        });
    };

    render() {
        const {navigator} = this.props.navigator;
        return (
            <View style={PunchCardToPunchCardActivityStyles.root}>
                <HeaderCommonView navigator={this.props.navigator}
                                  bgColor={'#FFCC33'}
                                  headerLeftShow={true}
                                  headerCenterShow={true}
                                  headerRightShow={false}
                                  showCenterAfterLeft={true}
                                  headerCenterTitle={'工作处理'}/>
                {this.props.data ?
                    <ScrollView style={PunchCardToPunchCardActivityStyles.function_list}
                                keyboardShouldPersistTaps={'always'}
                                contentContainerStyle={FindDetialActivityStyles.function_list_contentContainer}
                    >
                        <View style={{backgroundColor: '#FFFFFF',}}>
                            <View style={PunchCardToPunchCardActivityStyles.container}>
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
                                            style={[PunchCardToPunchCardActivityStyles.normal_text, {
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
                                                style={[PunchCardToPunchCardActivityStyles.normal_text, {
                                                    color: '#707070',
                                                    fontSize: 12,
                                                }]}>{this.props.data && this.props.data.order && this.props.data.order.orderWokerTypeName ? this.props.data.order.orderWokerTypeName + ' ' : ''}</Text>
                                            <Text
                                                style={[PunchCardToPunchCardActivityStyles.normal_text, {
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
                                                style={[PunchCardToPunchCardActivityStyles.normal_text, {
                                                    color: '#FFFFFF',
                                                    fontSize: 12,
                                                }]}>上工中</Text>
                                        </View>
                                    </View>
                                </View>
                            </View>

                            <View style={[PunchCardToPunchCardActivityStyles.container_view, {}]}>

                                <View style={[PunchCardToPunchCardActivityStyles.container_view, {
                                    flex: 1,
                                    flexDirection: 'column',
                                    justifyContent: 'flex-start',
                                    alignItems: 'flex-start',
                                    margin: 0,
                                }]}>
                                    <Text
                                        style={[PunchCardToPunchCardActivityStyles.normal_text, {
                                            color: '#707070',
                                            fontSize: 12,
                                        }]}>时间:</Text>
                                    <Text
                                        style={[PunchCardToPunchCardActivityStyles.normal_text, {
                                            marginTop: 9.6 / 2,
                                            fontSize: 12,
                                        }]}>
                                        {this.props.data && this.props.data.order && this.props.data.order.workStartTime ? this.props.data.order.workStartTime + ' ' : ''}
                                        /
                                        {this.props.data && this.props.data.order && this.props.data.order.workStopTime ? ' ' + this.props.data.order.workStopTime : ''}
                                    </Text>
                                </View>
                                <View style={[PunchCardToPunchCardActivityStyles.container_view, {
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
                            <View style={[PunchCardToPunchCardActivityStyles.container_view, {
                                flexDirection: 'column',
                                justifyContent: 'flex-start',
                                alignItems: 'flex-start',
                                margin: 9.6,
                            }]}>
                                <Text
                                    style={[PunchCardToPunchCardActivityStyles.normal_text, {
                                        color: '#707070',
                                        fontSize: 12,
                                    }]}>工作地点:</Text>
                                <Text
                                    style={[PunchCardToPunchCardActivityStyles.normal_text, {
                                        color: '#707070',
                                        marginTop: 9.6 / 2,
                                        fontSize: 12,
                                    }]}>
                                    {this.props.data && this.props.data.order && this.props.data.order.workAddress ? this.props.data.order.workAddress + ' ' : ''}
                                </Text>
                            </View>
                            <View style={{height: 10, backgroundColor: '#FBFBFB',}}/>
                            <View style={{flex: 1, backgroundColor: '#FBFBFB'}}>
                                <CommonListItemView
                                    itemOnpress={() => {
                                    }}
                                    rootNotTouchable={true}
                                    leftTitle={'打卡日期'}
                                    rightShowTitle={DateCommonUtil.getTodayStr()}
                                    bottomViewHeight={2}
                                />
                                <CommonListItemView
                                    itemOnpress={() => {
                                    }}
                                    rootNotTouchable={true}
                                    leftTitle={'打卡时间'}
                                    rightShowTitle={DateCommonUtil.getNowTimeStr()}
                                    bottomViewHeight={2}
                                />
                            </View>
                        </View>
                    </ScrollView>
                    : <View/>
                }
                <TouchableOpacity
                    onPress={() => this._toPunchOrderCardToday()}
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
                            PunchCardToPunchCardActivityStyles.normal_text, {
                                color: '#FFFFFF',
                                fontSize: 14,
                            }]}>立即打卡</Text>
                </TouchableOpacity>
            </View>
        );
    };
}


PunchCardToPunchCardActivityStyles = StyleSheet.create({
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