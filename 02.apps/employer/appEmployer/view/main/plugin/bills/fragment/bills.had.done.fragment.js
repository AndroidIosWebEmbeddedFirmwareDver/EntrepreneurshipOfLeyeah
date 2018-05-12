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


import BillsListItemView from './view/bills.list.item.view'
import ToastManager from '../../../../../utils/toast/Toast.util'
import NetworkCommonUtil from '../../../../../utils/network.common.util'
import DialogManagerUtil from '../../../../views/dialog/dialog.manager.util'
import UserDataManager from '../../../../../utils/storage/user.data.manager.common.util'


export default class BillsHadDoneFragment extends PureComponent {
    //1.
    constructor(props) {
        super(props);
        this.state = {
            mobileUserData: null,
            responValue: null,
            backViewShow: '努力加载中...',
        };
    }


    //2.
    componentWillMount() {
        if (this.props.mobileUserData) {
            this.setState({
                mobileUserData: this.props.mobileUserData,
            });
        }
    }

    //3.
    componentDidMount() {
        this._init_data();
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

    _init_data = () => {
        if (this.props.mobileUserData && this.props.mobileUserData.data) {
            let params = {
                employerId: this.props.mobileUserData.data.id,
                workOrderStatus: 1,//开工中
                employerWorkConfirm: 1,//已录用
                employeeWorkStart: 1,//已签到
                employeeWorkEnd: 1,//已签退
                employerPaidedWork: 1,//雇主已经付钱
                employeeWorkPaided: 0,//
            };
            NetworkCommonUtil.httpPostRequest(JSON.stringify(params), NetworkCommonUtil.SERVERURL_POST_ORDER_EMPLOY_EMPLPYER_BILLS_FIND_BILLS).then((val: any) => {
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
                            backViewShow: '暂无已支付订单',
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


    //--------------------
    _keyExtractor = (item, index) => index;

    _renderFlatListItem = (item, index) => {
        return (
            <BillsListItemView
                id={item.id}
                itemData={this.state.responValue.data[index].employee}
                employ={this.state.responValue.data[index].employ}
                order={this.state.responValue.data[index].order}
                rewards={this.state.responValue.data[index].rewards}
                onShowDetialPressed={() => {
                }}
                onShowPayPressed={() => this._onShowPayPressed(index)}
            />

        );
    };

    render() {
        return (
            this.state.responValue ?
                <View style={BillsHadDoneFragmentStyles.function_list}>
                    <FlatList
                        ref={(flatList) => this._flatList = flatList}
                        data={this.state.responValue.data}
                        extraData={this.state}//额外的能引更新的数据，如果不设置，可能导致不会刷新
                        keyExtractor={this._keyExtractor}
                        renderItem={({item, index}) => this._renderFlatListItem(item, index)}
                        contentContainerStyle={BillsHadDoneFragmentStyles.function_list_contentContainer}
                    />
                </View>
                :
                <View style={[BillsHadDoneFragmentStyles.function_list, {
                    alignItems: 'center',
                    justifyContent: 'center',
                }]}>
                    <Text
                        style={BillsHadDoneFragmentStyles.normal_text}>{this.state.backViewShow}</Text>
                </View>
        );
    };
}


BillsHadDoneFragmentStyles = StyleSheet.create({
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
    normal_text: {
        fontSize: 16,
        color: '#000000',
    }
});