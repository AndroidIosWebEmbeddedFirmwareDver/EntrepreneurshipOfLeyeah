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


import WorkStatusView from "./work.status.view";
import PunchCardActivity from "../../find/punch.card.activity";
import FindDetialActivity from '../../find/find.detial.activity'
import ToastManager from '../../../../../utils/toast/Toast.util'
import FragmentOrderItemView from '../../fragment.order.item.view'
import NetworkCommonUtil from '../../../../../utils/network.common.util'
import MobileOrderEmoloyUtils from '../../../../../stable/json/mobile.order.emoloy'
import FefreshCommonFragment from "../../../../views/common/refresh.common.fragment";
import UserDataManager from '../../../../../utils/storage/user.data.manager.common.util'


export default class GrabWorkFragment extends FefreshCommonFragment {
    //1.
    constructor(props) {
        super(props);
        this.state = {
            mFlatListRefreshing: true,//当前的刷新状态
            loadDataTag: false,
            mobileUserData: null,
            responValue: null,
            backViewShow: '努力加载中...',
            slectStatusParams: true,
            queryParams: {
                page: 0,
                size: 10,
                typeQuery: false,
                employerWorkConfirm: 0,//'雇主确定录用，1-已录用，0-未录用，-1-拒绝'
                employeeWorkStart: 0,//'雇员上工签到开始工作，1-已签到，0-未签到，-1-拒绝'
                employeeWorkEnd: 0,//'雇员下工签退工作结束，1-已结束，0-未结束'
                employerPaidedWork: 0,//'雇主确定付款，1-已付款，0-未付款，-1-拒绝'
                employeeWorkPaided: 0,//'雇员确定收款，1-已付款，0-未付款，-1-拒绝'
            },
        };
    }

    //2.
    componentWillMount() {
        this._refreshUserData().then((ret) => {
            this._mFlatListOnRefresh();
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
            workEmployeeId: this.state.mobileUserData.data.id,//排序方式
            workOrderPushType: 1,//订单发布类型，默认0， 0-自投 1-紧急 2-被聘
            page: this.state.queryParams.page,
            size: this.state.queryParams.size,
            typeQuery: this.state.queryParams.typeQuery,
            employerWorkConfirm: this.state.queryParams.employerWorkConfirm,
            employeeWorkStart: this.state.queryParams.employeeWorkStart,
            employeeWorkEnd: this.state.queryParams.employeeWorkEnd,
            employerPaidedWork: this.state.queryParams.employerPaidedWork,
            employeeWorkPaided: this.state.queryParams.employeeWorkPaided,
        };
        // alert(JSON.stringify(paramsObject));
        NetworkCommonUtil.httpPostRequest(JSON.stringify(paramsObject), NetworkCommonUtil.SERVERURL_POST_ORDER_FIND_WORK_FOR_EMPLOYEE_BY_PUSHTYPE_WITH_PARAMS_FOR_PAGE).then((val: any) => {
            // alert(JSON.stringify(val));
            if (val && val.code === NetworkCommonUtil.SERVER_HTTP_TASK_STATUS_SUCCESS) {
                if (val.data && val.data.length > 0) {
                    //刷新
                    if (!this.state.loadDataTag) {
                        this.setState({
                            responValue: val,
                            backViewShow: null,
                        });
                    }
                    //加载
                    else {
                        if (this.state.responValue && this.state.responValue.data && val.data && val.data.length > 0) {
                            this.state.responValue.data = this.state.responValue.data.concat(val.data);
                            this.setState({
                                responValue: this.state.responValue,
                                backViewShow: null,
                            });
                        }
                    }
                } else {
                    //刷新
                    if (!this.state.loadDataTag) {
                        this.setState({
                            responValue: null,
                            backViewShow: '暂无此类工作',
                        });
                    }
                }
            } else if (val) {
            } else {
                ToastManager.show('请求网络出错' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            }
            this._mFlatListStopRefresh();
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
                itemFunctionData={MobileOrderEmoloyUtils.adjustDoWhat(this.state.responValue.data[index])}
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
                case MobileOrderEmoloyUtils.next_funcs.gotoemployeeshowdetial://查看详情
                    this._pushCompoent(FindDetialActivity, {data: this.state.responValue.data[index]});
                    return;
                case MobileOrderEmoloyUtils.next_funcs.gotoemployeeWorkStart://立即上工
                    ToastManager.alertDialog('提示', '是否立即上工？', '取消', () => {
                    }, '确定', () => {
                        MobileOrderEmoloyUtils.changeEmployeeWorkStartStatus(this.state.mobileUserData, this.state.responValue.data[index], () => {
                            ToastManager.alertWithSure('提示', '上工成功', () => {
                                this._init_query_net_data();
                            });
                        });
                    });

                    return;
                case MobileOrderEmoloyUtils.next_funcs.gotoemployeeWorkPunchCard://立即打卡
                    this._pushCompoent(PunchCardActivity, {
                        data: this.state.responValue.data[index],
                        onPunchCardSuccessCallback: this._onPunchCardSuccessCallback,
                    });
                    return;
                case MobileOrderEmoloyUtils.next_funcs.gotoemployeeWorkEnd://立即下工
                    ToastManager.alertDialog('提示', '是否立即下工？', '取消', () => {
                    }, '确定', () => {
                        MobileOrderEmoloyUtils.changeEmployeeWorkEndStatus(this.state.mobileUserData, this.state.responValue.data[index], () => {
                            ToastManager.alertWithSure('提示', '下工成功', () => {
                                this._init_query_net_data();
                            });
                        });
                    });

                    return;
                case MobileOrderEmoloyUtils.next_funcs.gotoemployeeWorkPaided://立即确定收款
                    ToastManager.alertDialog('提示', '是否立即确定收款？', '取消', () => {
                    }, '确定', () => {
                        MobileOrderEmoloyUtils.changeemployeeWorkPaidedStatus(this.state.mobileUserData, this.state.responValue.data[index], () => {
                            ToastManager.alertWithSure('提示', '确定收款成功', () => {
                                this._init_query_net_data();
                            });
                        });
                    });

                    return;
                default:
                    return;
            }
        }
    };


    //---------------------
    _onWorkStatusSelectedChangeed = (statusParams) => {
        if (statusParams) {
            this.state.queryParams.page = 0;
            this.state.queryParams.size = 10;
            this.state.queryParams.typeQuery = statusParams.typeQuery;
            this.state.queryParams.employerWorkConfirm = statusParams.employerWorkConfirm;
            this.state.queryParams.employeeWorkStart = statusParams.employeeWorkStart;
            this.state.queryParams.employeeWorkEnd = statusParams.employeeWorkEnd;
            this.state.queryParams.employerPaidedWork = statusParams.employerPaidedWork;
            this.state.queryParams.employeeWorkPaided = statusParams.employeeWorkPaided;

            this.setState({
                responValue: null,
                backViewShow: '努力加载中...',
                loadDataTag: false,
                queryParams: this.state.queryParams,
            });
            this._mFlatListOnRefresh();
        }
    };

    //------------
    _mFlatListFooter(): * {
    }

    _mFlatListOnRefresh(): void {
        super._mFlatListOnRefresh();
        this.state.queryParams.page = 0;
        this.state.queryParams.size = 10;
        this.setState({
            responValue: '',
            loadDataTag: false,
            queryParams: this.state.queryParams,
        });
        this._init_query_net_data();
    }

    _mFlatListOnEndReached() {
        //判断是否可能还有更多数据
        if (this.state.responValue && this.state.responValue.data && this.state.responValue.data.length >= (this.state.queryParams.size * (this.state.queryParams.page + 1))) {
            this.state.queryParams.page = this.state.queryParams.page + 1;
            this.state.queryParams.size = 10;
            this.setState({
                loadDataTag: true,
                queryParams: this.state.queryParams,
            });
            this._init_query_net_data();
        }
    }

    render() {
        return (
            <View style={GrabWorkFragmentStyles.container}>
                {this.state.slectStatusParams ?
                    <View style={{marginTop: 9.6,}}>
                        <WorkStatusView onWorkStatusChangeed={this._onWorkStatusSelectedChangeed}/>
                    </View>
                    : <View/>
                }
                {this.state.responValue ?
                    <View style={GrabWorkFragmentStyles.function_list}>
                        <FlatList
                            ref={(flatList) => this._flatList = flatList}

                            //添加头尾布局
                            // ListHeaderComponent={() => this._homeFlatListHeader()}
                            // ListFooterComponent={this._mFlatListFooter}

                            //下拉刷新，必须设置refreshing状态
                            onRefresh={() => this._mFlatListOnRefresh()}
                            refreshing={this._mFlatListRefreshing()}
                            //加载
                            onEndReachedThreshold={0.1}
                            onEndReached={() => this._mFlatListOnEndReached()}

                            data={this.state.responValue.data}
                            keyExtractor={this._keyExtractor}
                            renderItem={({item, index}) => this._renderFlatListItem(item, index)}
                            contentContainerStyle={GrabWorkFragmentStyles.function_list_contentContainer}
                        />
                    </View>
                    : <View style={[GrabWorkFragmentStyles.function_list, {
                        alignItems: 'center',
                        justifyContent: 'center',
                    }]}>
                        <Text
                            style={GrabWorkFragmentStyles.normal_text}>{this.state.backViewShow}</Text>
                    </View>
                }
            </View>
        );
    };
}

GrabWorkFragmentStyles = StyleSheet.create({
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