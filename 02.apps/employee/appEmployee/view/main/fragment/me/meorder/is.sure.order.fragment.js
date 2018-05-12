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
    FlatList,
} from 'react-native';

const {
    width,
    height
} = Dimensions.get('window');


import PunchCardActivity from "../../find/punch.card.activity";
import FindDetialActivity from '../../find/find.detial.activity'
import ToastManager from '../../../../../utils/toast/Toast.util'
import FragmentOrderItemView from '../../fragment.order.item.view'
import NetworkCommonUtil from '../../../../../utils/network.common.util'
import MobileOrderEmoloyUtils from '../../../../../stable/json/mobile.order.emoloy'
import UserDataManager from '../../../../../utils/storage/user.data.manager.common.util'


export default class IsSureOrderFragment extends PureComponent {
    //1.
    constructor(props) {
        super(props);
        this.state = {
            mobileUserData: null,
            responValue: null,
            backViewShow: '努力加载中...'
        };
    }

    //2.
    componentWillMount() {
        this._refreshUserData().then((ret) => {
            this._init_query_net_data();
        });
    }

    //3.
    componentDidMount() {

    }

    //4.
    componentWillUnMount() {

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

    _init_query_net_data = () => {

        if (!this.state.mobileUserData) {
            return;
        }
        let paramsObject = {
            workEmployeeId: this.state.mobileUserData.data.id,
            employerWorkConfirm: 1,//'雇主确定录用，1-已录用，0-未录用，-1-拒绝'
            employeeWorkStart: 1,//'雇员上工签到开始工作，1-已签到，0-未签到，-1-拒绝'
            employeeWorkEnd: 1,//'雇员下工签退工作结束，1-已结束，0-未结束'
            employerPaidedWork: 1,//雇主确定付款，1-已付款，0-未付款，-1-拒绝
            employeeWorkPaided: 1,//'雇员确定收款，1-已付款，0-未付款，-1-拒绝'
        };
        NetworkCommonUtil.httpPostRequest(JSON.stringify(paramsObject), NetworkCommonUtil.SERVERURL_POST_ORDER_FIND_WORK_FOR_EMPLOYEE_BY_PADIDSTATUS).then((val: any) => {
            // alert(JSON.stringify(val));
            if (val && val.code === NetworkCommonUtil.SERVER_HTTP_TASK_STATUS_SUCCESS) {
                if (val.data && val.data.length > 0) {
                    this.setState({
                        responValue: val,
                        backViewShow: null,
                    });
                } else {
                    this.setState({
                        responValue: null,
                        backViewShow: '暂无此类工作',
                    });
                }
            } else if (val) {
                ToastManager.show(JSON.stringify(val) + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            } else {
                ToastManager.show('请求网络出错' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            }
        });
    };


    //页面跳转
    _pushCompoent = (component: Component, params: any) => {
        if (!component) {
            return;
        }
        this.props.navigator.push({
            component: component,
            params: params,
        });
    };

    //-------order list
    //keyExtractor tells the list to use the ids for the react keys instead of the default key property.
    _keyExtractor = (item, index) => index;


    _renderFlatListItem = (item, index) => {
        return (
            <FragmentOrderItemView
                id={item.id}
                data={this.state.responValue.data[index]}
                showClock={false}
                itemBtnTitle={MobileOrderEmoloyUtils.adjustDoWhat(this.state.responValue.data[index]).show}
                onItemBtnClick={() => this._onFlatListItemPress(index)}
            />
        );
    };

    _onPunchCardSuccessCallback = () => {
        this._init_query_net_data();
    };

    _onFlatListItemPress = (index) => {
        // alert(index+'selected');
        let tag = MobileOrderEmoloyUtils.adjustDoWhat(this.state.responValue.data[index]).tag;
        if (tag > 0) {
            switch (tag) {
                case MobileOrderEmoloyUtils.next_funcs.gotonone://无
                    return;
                    break;
                case MobileOrderEmoloyUtils.next_funcs.gotoemployeeshowdetial://查看详情
                    this._pushCompoent(FindDetialActivity, {data: this.state.responValue.data[index]});
                    return;
                    break;
                case MobileOrderEmoloyUtils.next_funcs.gotoemployeeWorkStart://立即开工
                    MobileOrderEmoloyUtils.changeEmployeeWorkStartStatus(this.state.mobileUserData, this.state.responValue.data[index], () => {
                        ToastManager.alertWithSure('提示', '开工成功', () => {
                            this._init_query_net_data();
                        });
                    });
                    return;
                    break;
                case MobileOrderEmoloyUtils.next_funcs.gotoemployeeWorkPunchCard://立即打卡
                    this._pushCompoent(PunchCardActivity, {
                        data: this.state.responValue.data[index],
                        onPunchCardSuccessCallback: this._onPunchCardSuccessCallback,
                    });
                    return;
                    break;
                case MobileOrderEmoloyUtils.next_funcs.gotoemployeeWorkEnd://立即下工
                    MobileOrderEmoloyUtils.changeEmployeeWorkEndStatus(this.state.mobileUserData, this.state.responValue.data[index], () => {
                        ToastManager.alertWithSure('提示', '下工成功', () => {
                            this._init_query_net_data();
                        });
                    });
                    return;
                    break;
                case MobileOrderEmoloyUtils.next_funcs.gotoemployeeWorkPaided://立即确定收款
                    MobileOrderEmoloyUtils.changeemployeeWorkPaidedStatus(this.state.mobileUserData, this.state.responValue.data[index], () => {
                        ToastManager.alertWithSure('提示', '确定收款成功', () => {
                            this._init_query_net_data();
                        });
                    });
                    return;
                    break;
                default:
                    return;
                    break;
            }
        }
    };

    //---------------------

    render() {
        return (
            <View style={IsSureOrderFragmentStyles.container}>
                {this.state.responValue ?
                    <View style={IsSureOrderFragmentStyles.function_list}>
                        <FlatList
                            ref={(flatList) => this._flatList = flatList}
                            data={this.state.responValue.data}
                            keyExtractor={this._keyExtractor}
                            renderItem={({item, index}) => this._renderFlatListItem(item, index)}
                            contentContainerStyle={IsSureOrderFragmentStyles.function_list_contentContainer}
                        />
                    </View>
                    : <Text
                        style={IsSureOrderFragmentStyles.normal_text}>{this.state.backViewShow}</Text>
                }
            </View>
        );
    };
}

IsSureOrderFragmentStyles = StyleSheet.create({
    //基于flex-box布局
    container: {
        width: width,
        flex: 1,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FFFFFF',
        alignItems: 'center',
        justifyContent: 'center',
    },
    function_list: {
        width: width,
        flex: 1,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FFFFFF',
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
    normal_text: {
        fontSize: 16,
    }
});