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

import ToastManager from '../../../../../../utils/toast/Toast.util'
import TableBar from '../../../../../views/tableBar/table.bar.common.view'
import NetworkCommonUtil from '../../../../../../utils/network.common.util'
import HeaderCommonView from '../../../../../views/header/header.common.view'
import DialogManagerUtil from '../../../../../views/dialog/dialog.manager.util'
import CommonListItemView from '../../../../../views/common/common.list.item.view'
import UserDataManager from '../../../../../../utils/storage/user.data.manager.common.util'
import BaseActivity from "../../../../../views/base.activity";


export default class AdminFragmentShowDetial extends BaseActivity {
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
        this._initQueryOrderDetial();
    }

    //4.
    componentWillUnmount() {
        super.componentWillUnmount();
    }

    _initQueryOrderDetial = () => {
        if (this.props.mobileUserData && this.props.mobileUserData.data && this.props.order) {
            let params = {
                id: this.props.order.id,
                workEmployerId: this.props.mobileUserData.data.id,
                workOrderStatus: this.props.order.workOrderStatus,
            };
            NetworkCommonUtil.httpPostRequest(JSON.stringify(params), NetworkCommonUtil.SERVERURL_POST_ORDER_EMPLOY_EMPLOYER_QUERY_ME_ORDER_DETIAL_BY_ORDER).then((val: any) => {
                // alert(JSON.stringify(val));
                if (val && val.code === NetworkCommonUtil.SERVER_HTTP_TASK_STATUS_SUCCESS) {
                    // this.setState({responValue: this._generNetToLocalData(val)});
                    if (val.data) {
                        this.setState({
                            responValue: val.data,
                            backViewShow: null,
                        });
                    } else {
                        this.setState({
                            responValue: null,
                            backViewShow: '暂无工作',
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


    _gener_detial_view = () => {
        return (
            <ScrollView
                style={AdminFragmentShowDetialStyles.function_list}
                contentContainerStyle={AdminFragmentShowDetialStyles.function_list_contentContainer}>

                <View style={{height: 10, backgroundColor: '#FBFBFB',}}/>

                <View style={AdminFragmentShowDetialStyles.container_view}>
                    <Image
                        source={this.state.responValue && this.state.responValue.employer ? {uri: this.state.responValue.employer.avatarUrl} : require('../../../../../../stable/image/app_a.png')}
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
                            style={[AdminFragmentShowDetialStyles.normal_text, {
                                flex: 1,
                                marginRight: 9.6,
                            }]}>{this.state.responValue ? this.state.responValue.employer ? this.state.responValue.employer.name : '' : ''}</Text>
                    </View>
                </View>

                <View style={{height: 10, backgroundColor: '#FBFBFB',}}/>

                <View
                    style={[AdminFragmentShowDetialStyles.container_view, {alignItems: 'center'}]}>
                    <View style={{backgroundColor: '#00CEF3'}}>
                        <Image
                            source={require('../../../../../../stable/image/ic_app_menu.png')}
                            style={{width: 12, height: 12, resizeMode: 'cover',}}
                        />
                    </View>
                    <Text
                        style={[AdminFragmentShowDetialStyles.normal_text, {
                            flex: 1,
                            marginLeft: 9.6,
                            fontSize: 14,
                        }]}>工作描述</Text>
                </View>

                <View
                    style={[AdminFragmentShowDetialStyles.container_view, {alignItems: 'center',}]}>
                    <Text
                        style={[AdminFragmentShowDetialStyles.normal_text, {
                            color: '#FF7514',
                            fontSize: 12,
                        }]}
                    >招聘岗位:</Text>
                    <Text
                        style={[AdminFragmentShowDetialStyles.normal_text, {
                            flex: 1,
                            marginLeft: 9.6,
                            color: '#FF7514',
                            fontSize: 12,
                        }]}>{this.state.responValue ? this.state.responValue.order ? this.state.responValue.order.orderWokerTypeName : '' : ''}</Text>
                </View>
                <View
                    style={[AdminFragmentShowDetialStyles.container_view, {alignItems: 'center'}]}>
                    <Text
                        style={[AdminFragmentShowDetialStyles.normal_text, {
                            color: '#707070',
                            fontSize: 12,
                        }]}>福利待遇:</Text>
                    <Text
                        style={[AdminFragmentShowDetialStyles.normal_text, {
                            flex: 1,
                            marginLeft: 9.6,
                            color: '#707070',
                            fontSize: 12,
                        }]}>
                        {this.state.responValue ? this.state.responValue.rewards ? '￥' + this.state.responValue.rewards.rewardMoney : '' : ''}
                        {this.state.responValue ? this.state.responValue.rewards ? this.state.responValue.rewards.rewardType === 0 ? ' / 每天' : ' / 总价' : '' : ''}
                        {this.state.responValue ? this.state.responValue.rewards ? this.state.responValue.rewards.provideBoard === 0 ? '' : ' / 包吃' : '' : ''}
                        {this.state.responValue ? this.state.responValue.rewards ? this.state.responValue.rewards.provideRoom === 0 ? '' : ' / 包住' : '' : ''}
                    </Text>
                </View>
                <View
                    style={[AdminFragmentShowDetialStyles.container_view, {alignItems: 'center'}]}>
                    <Text
                        style={[AdminFragmentShowDetialStyles.normal_text, {
                            color: '#707070',
                            fontSize: 12,
                        }]}>岗位要求:</Text>
                    <Text
                        style={[AdminFragmentShowDetialStyles.normal_text, {
                            flex: 1,
                            marginLeft: 9.6,
                            color: '#707070',
                            fontSize: 12,
                        }]}>{this.state.responValue ? this.state.responValue.order ? this.state.responValue.order.workDescription : '' : ''}</Text>
                </View>
                <View
                    style={[AdminFragmentShowDetialStyles.container_view, {alignItems: 'center'}]}>
                    <Text
                        style={[AdminFragmentShowDetialStyles.normal_text, {
                            color: '#707070',
                            fontSize: 12,
                        }]}>经验要求:</Text>
                    <Text
                        style={[AdminFragmentShowDetialStyles.normal_text, {
                            flex: 1,
                            marginLeft: 9.6,
                            color: '#707070',
                            fontSize: 12,
                        }]}>{this.state.responValue ? this.state.responValue.order ? this.state.responValue.order.workExperienceRequireTypeDesc : '' : ''}</Text>
                </View>
                <View
                    style={[AdminFragmentShowDetialStyles.container_view,
                        {
                            alignItems: 'center'
                        }
                    ]}>
                    <Text
                        style={[AdminFragmentShowDetialStyles.normal_text, {
                            color: '#707070',
                            fontSize: 12,
                        }]}>发布类型:</Text>
                    <Text
                        style={[AdminFragmentShowDetialStyles.normal_text, {
                            marginLeft: 9.6,
                            color: '#707070',
                            fontSize: 12,
                        }]}>{this.state.responValue && this.state.responValue.order && this.state.responValue.order.workOrderPushType === 0 ? '普通订单'
                        : this.state.responValue && this.state.responValue.order && this.state.responValue.order.workOrderPushType === 1 ? '紧急订单'
                            : this.state.responValue && this.state.responValue.order && this.state.responValue.order.workOrderPushType === 2 ? '招人订单'
                                : ''}</Text>
                </View>
                <View
                    style={[AdminFragmentShowDetialStyles.container_view, {alignItems: 'center'}]}>
                    <Text
                        style={[AdminFragmentShowDetialStyles.normal_text, {
                            color: '#707070',
                            fontSize: 12,
                        }]}>工作周期:</Text>
                    <Text
                        style={[AdminFragmentShowDetialStyles.normal_text, {
                            flex: 1,
                            marginLeft: 9.6,
                            color: '#707070',
                            fontSize: 12,
                        }]}>
                        {this.state.responValue ? this.state.responValue.order ? this.state.responValue.order.workStartTime + ' ' : '' : ''}
                        /
                        {this.state.responValue ? this.state.responValue.order ? ' ' + this.state.responValue.order.workStopTime : '' : ''}
                    </Text>
                </View>

                <View
                    style={[AdminFragmentShowDetialStyles.container_view, {alignItems: 'center',}]}>
                    <Text
                        style={[AdminFragmentShowDetialStyles.normal_text, {
                            color: '#707070',
                            fontSize: 12,
                        }]}>工作地点:</Text>
                    <Text
                        style={[AdminFragmentShowDetialStyles.normal_text, {
                            flex: 1,
                            marginLeft: 9.6,
                            color: '#707070',
                            fontSize: 12,
                        }]}>
                        {this.state.responValue ? this.state.responValue.order ? this.state.responValue.order.workAddress + ' ' : '' : ''}
                    </Text>
                </View>
                <View
                    style={[AdminFragmentShowDetialStyles.container_view, {
                        alignItems: 'center',
                    }]}>
                    <Text
                        style={[AdminFragmentShowDetialStyles.normal_text, {
                            color: '#707070',
                            fontSize: 12,
                        }]}>联系电话:</Text>
                    <Text
                        style={[AdminFragmentShowDetialStyles.normal_text, {
                            flex: 1,
                            marginLeft: 9.6,
                            color: '#707070',
                            fontSize: 12,
                        }]}>
                        {this.state.responValue ? this.state.responValue.employer ? this.state.responValue.employer.phone + ' ' : '' : ''}
                    </Text>
                </View>
            </ScrollView>);
    };

    _gener_status_view = () => {
        return (
            <View style={[AdminFragmentShowDetialStyles.function_list, {
                alignItems: 'center',
                justifyContent: 'center',
            }]}>
                <Text
                    style={AdminFragmentShowDetialStyles.normal_text}>{this.state.backViewShow}</Text>
            </View>
        );
    };

    render() {
        return (
            <View style={AdminFragmentShowDetialStyles.container}>
                <HeaderCommonView navigator={this.props.navigator}
                                  bgColor={'#FFCC33'}
                                  headerLeftShow={true}
                                  headerCenterShow={true}
                                  headerRightShow={false}
                                  showCenterAfterLeft={true}
                                  headerCenterTitle={'工作详情'}/>


                {this.state.responValue ?
                    this._gener_detial_view()
                    :
                    this._gener_status_view()
                }
            </View>
        );
    };
}


AdminFragmentShowDetialStyles = StyleSheet.create({
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
    container_view: {
        flexDirection: 'row',
        justifyContent: 'flex-start',
        alignItems: 'flex-start',
        marginLeft: 9.6,
        marginRight: 9.6,
        marginTop: 9.6,
        marginBottom: 9.6,
    },
    function_list_container: {
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FBFBFB',
    },
    normal_text: {
        fontSize: 16,
        color: '#000000',
    }
});
