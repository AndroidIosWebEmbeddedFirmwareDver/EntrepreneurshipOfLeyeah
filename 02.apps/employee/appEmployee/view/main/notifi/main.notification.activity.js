import React, {PureComponent} from 'react';

import {
    StyleSheet,
    View,
    Text,
    Platform,
    PixelRatio,
    Dimensions,
    TouchableOpacity,
    Image,
    ScrollView,
    FlatList,
} from 'react-native';

const {
    width,
    height
} = Dimensions.get('window');

import BaseActivity from '../../../view/views/base.activity'
import ToastManager from '../../../utils/toast/Toast.util'
import NetworkCommonUtil from '../../../utils/network.common.util'
import DialogManagerUtil from '../../views/dialog/dialog.manager.util'
import UserRnaStatus from '../../../stable/json/user.rna.status'
import UserDataManager from '../../../utils/storage/user.data.manager.common.util'
import MobileOrderEmoloyUtils from '../../../stable/json/mobile.order.emoloy'

import CommonListItemView from '../../views/common/common.list.item.view'
import HeaderCommonView from '../../views/header/header.common.view'


import NotifiationOrderItemView from './notifiation.order.item.view'
import FindDetialActivity from '../fragment/find/find.detial.activity'
import RefreshCommonActivity from "../../views/common/refresh.common.activity";

export default class MainNotificationActivity extends RefreshCommonActivity {
    //1.
    constructor(props) {
        super(props);
        this.state = {
            mFlatListRefreshing: true,//当前的刷新状态
            mobileUserData: null,
            responValue: null,
            backViewShow: '努力加载中...'
        };
    }

    //2.
    componentWillMount() {
        super.componentWillMount();
        this._refreshUserData().then((ret) => {
            this._mFlatListOnRefresh();
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

    _initQueryNotifications = () => {

        if (!this.state.mobileUserData) {
            return;
        }
        let paramsObject = {
            workEmployeeId: this.state.mobileUserData.data.id,//排序方式
            employerWorkConfirm: 1,
            employeeWorkStart: 0,
            employeeWorkEnd: 0,
            employerPaidedWork: 0,
            employeeWorkPaided: 0,
        };
        NetworkCommonUtil.httpPostRequest(JSON.stringify(paramsObject), NetworkCommonUtil.SERVERURL_POST_ORDER_EM_NOTOFICATION).then((val: any) => {
            // alert(JSON.stringify(val));
            this._mFlatListStopRefresh();
            if (val && val.code === NetworkCommonUtil.SERVER_HTTP_TASK_STATUS_SUCCESS) {
                if (val.data && val.data.length > 0) {
                    this.setState({
                        responValue: val,
                    });
                } else {
                    this.setState({
                        responValue: null,
                        backViewShow: '当前还没有收到任何新通知',
                    });
                }
            } else if (val) {
                ToastManager.show(JSON.stringify(val) + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            } else {
                ToastManager.show('请求网络出错' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            }
        });
    };

    _changeIsEmployeeWorkStart = (employs, mEmployeeWorkStart) => {

        if (!this.state.mobileUserData) {
            return;
        }
        let paramsObject = {
            employeeWorkStart: mEmployeeWorkStart,
            id: employs.id,
            orderId: employs.orderId,
            workEmployerId: employs.workEmployerId,
            workEmployeeId: this.state.mobileUserData.data.id,//排序方式
            employerWorkConfirm: 1,
            employeeWorkEnd: 0,
            employerPaidedWork: 0,
            employeeWorkPaided: 0,
        };
        DialogManagerUtil.showNormalLoadingDialog();
        NetworkCommonUtil.httpPostRequest(JSON.stringify(paramsObject), NetworkCommonUtil.SERVERURL_POST_ORDER_EM_NOTOFICATION_ACCEPT).then((val: any) => {
            // alert(JSON.stringify(val));
            DialogManagerUtil.hide();
            if (val && val.code === NetworkCommonUtil.SERVER_HTTP_TASK_STATUS_SUCCESS) {
                //刷新
                this._initQueryNotifications();
                ToastManager.show(val.msg + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            } else if (val) {
                ToastManager.show(val.msg + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
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

    _onFlatListItemPress = (index, mEmployeeWorkStart) => {
        // alert(index+'selected');
        ToastManager.alertDialog(null, '确定要' + mEmployeeWorkStart === -1 ? '拒绝' : '接受' + '工作么？', '再想想', () => {
        }, mEmployeeWorkStart === -1 ? '确认拒绝' : '确认接受', () => {
            this._changeIsEmployeeWorkStart(this.state.responValue.data[index].employs, mEmployeeWorkStart);
        });
    };

    _renderFlatListItem = (item, index) => {
        return (
            <NotifiationOrderItemView
                id={item.id}
                data={this.state.responValue.data[index]}
                showClock={false}
                itemBtn1Title={'拒绝邀请'}
                itemBtn2Title={'接受邀请'}
                onItemBtn1Click={() => this._onFlatListItemPress(index, -1)}
                onItemBtn2Click={() => this._onFlatListItemPress(index, 1)}
            />
        );
    };


    //-------order list
    _homeFlatListHeader() {
    }

    _mFlatListFooter(): * {
    }

    _mFlatListOnRefresh(): void {
        this._initQueryNotifications();
    }

    _mFlatListOnEndReached() {
    }

    render() {
        return (
            <View style={MainNotificationActivityStyles.container}>
                <HeaderCommonView navigator={this.props.navigator}
                                  bgColor={'#FFCC33'}
                                  headerLeftShow={true}
                                  headerCenterShow={true}
                                  headerRightShow={false}
                                  showCenterAfterLeft={true}
                                  headerCenterTitle={'我的通知'}/>

                <View style={MainNotificationActivityStyles.function_list}>
                    {this.state.responValue ?
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
                            contentContainerStyle={MainNotificationActivityStyles.function_list_contentContainer}
                        />
                        :
                        <View style={[MainNotificationActivityStyles.function_list, {
                            alignItems: 'center',
                            justifyContent: 'center',
                        }]}>
                            <Text
                                style={MainNotificationActivityStyles.normal_text}>{this.state.backViewShow}</Text>
                        </View>
                    }
                </View>
            </View>
        );
    };
}

//#FBFBFB
MainNotificationActivityStyles = StyleSheet.create({
    //基于flex-box布局
    container: {
        width: width,
        flex: 1,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FBFBFB',
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
        backgroundColor: '#FFFFFF',
    },
    normal_text: {
        fontSize: 16,
    }
});