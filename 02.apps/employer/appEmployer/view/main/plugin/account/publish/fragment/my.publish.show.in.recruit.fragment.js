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


import ToastManager from '../../../../../../utils/toast/Toast.util'
import NetworkCommonUtil from '../../../../../../utils/network.common.util'
import MyPublishShowManageScreen from './show/my.publish.show.manage.screen'
import DialogManagerUtil from '../../../../../views/dialog/dialog.manager.util'
import CommonListItemView from '../../../../../views/common/common.list.item.view'
import MyPublishFragmentListItemView from './view/my.publish.fragment.list.item.view'
import UserDataManager from '../../../../../../utils/storage/user.data.manager.common.util'
import AdminFragmentShowDetial from '../../../admin/fragment/show/admin.fragment.show.detial'

export default class MyPublishShowInRecruitFragment extends PureComponent {
    //1.
    constructor(props) {
        super(props);
        this.state = {
            mobileUserData: null,
            responValue: '',
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

    _onManageCallback = () => {
        this.setState({
            responValue: null,
            backViewShow: '努力加载中...',
        });
        this._init_data();
    };

    _init_data = () => {
        if (this.props.mobileUserData && this.props.mobileUserData.data) {
            let params = {
                workEmployerId: this.props.mobileUserData.data.id,
                workOrderPushType: this.props.workOrderPushType,
                workRecruitStatus: 0,//招聘中
            };
            NetworkCommonUtil.httpPostRequest(JSON.stringify(params), NetworkCommonUtil.SERVERURL_POST_ORDER_EMPLOY_EMPLOYER_QUERY_ME_ORDERS_BY_RECRUIT_AND_PUBLISH_STATUS).then((val: any) => {
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


    //////--------------------
    _keyExtractor = (item, index) => index;

    _renderFlatListItem = (item, index) => {
        return (
            <MyPublishFragmentListItemView
                id={item.id}
                itemData={this.state.responValue.data[index]}
                onShowDetialPressed={() => this._onShowDetialPressed(index)}
                onShowManagePressed={() => this._onShowManagePressed(index)}
            />
        );
    };

    _onShowDetialPressed = (index) => {
        if (this.state.responValue === null || this.state.responValue.data === null || index < 0 || index > this.state.responValue.data.length) {
            return;
        }
        let params = {
            mobileUserData: this.props.mobileUserData,
            workOrderStatus: 0,
            order: this.state.responValue.data[index],
        };
        this._pushCompoent(AdminFragmentShowDetial, params);
    };


    _onShowManagePressed = (index) => {
        if (this.state.responValue === null || this.state.responValue.data === null || index < 0 || index > this.state.responValue.data.length) {
            return;
        }
        let params = {
            mobileUserData: this.props.mobileUserData,
            workOrderStatus: 0,
            order: this.state.responValue.data[index],
            onManageCallback: this._onManageCallback
        };
        this._pushCompoent(MyPublishShowManageScreen, params);
    };


    _onFlatListItemPress = (index) => {
        for (let i of this.state.responValue.data) {
            i.selected = false;
        }
        this.state.responValue.data[index].selected = true;
        this.state.selectedWorkExp = this.state.responValue.data[index];
        this.setState({
            responValue: this.state.responValue,
            selectedWorkExp: this.state.selectedWorkExp,
        });
    };


    render() {
        return (
            this.state.responValue ?
                <View style={MyPublishShowInRecruitFragmentStyles.function_list}>
                    <FlatList
                        ref={(flatList) => this._flatList = flatList}
                        data={this.state.responValue.data}
                        extraData={this.state}//额外的能引更新的数据，如果不设置，可能导致不会刷新
                        keyExtractor={this._keyExtractor}
                        renderItem={({item, index}) => this._renderFlatListItem(item, index)}
                        contentContainerStyle={MyPublishShowInRecruitFragmentStyles.function_list_contentContainer}
                    />
                </View>
                :
                <View style={[MyPublishShowInRecruitFragmentStyles.function_list, {
                    alignItems: 'center',
                    justifyContent: 'center',
                }]}>
                    <Text
                        style={MyPublishShowInRecruitFragmentStyles.normal_text}>{this.state.backViewShow}</Text>
                </View>
        );
    };
}


MyPublishShowInRecruitFragmentStyles = StyleSheet.create({
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