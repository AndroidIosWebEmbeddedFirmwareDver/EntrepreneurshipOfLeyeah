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


import ToastManager from '../../../../utils/toast/Toast.util'
import NetworkCommonUtil from '../../../../utils/network.common.util'

import UserDataManager from '../../../../utils/storage/user.data.manager.common.util'
import UserRnaStatus from '../../../../stable/json/user.rna.status'

import CommonListItemView from '../../../views/common/common.list.item.view'
import HeaderCommonView from '../../../views/header/header.common.view'

import FragmentHeaderToobarView from '../header.toobar.view'
import FragmentOrderItemView from '../fragment.order.item.view'
import FindDetialActivity from '../find/find.detial.activity'
import BaseActivity from "../../../views/base.activity";


export default class MeLoveActivity extends BaseActivity {
    //1.
    constructor(props) {
        super(props);
        this.state = {
            mobileUserData: null,
            meLoveOrdersResponValue: null,
            backViewShow: '努力加载中...',
        };
    }

    //2.
    componentWillMount() {
        super.componentWillMount();
        this._refreshUserData().then((ret) => {
            this._initQueryALLMeLoveOrders();
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

    _initQueryALLMeLoveOrders = () => {
        if (!this.state.mobileUserData) {
            return;
        }
        let paramsObject = {
            'workEmployeeId': this.state.mobileUserData.data.id,//排序方式
        };
        NetworkCommonUtil.httpPostRequest(JSON.stringify(paramsObject), NetworkCommonUtil.SERVERURL_POST_ORDER_LOVE_QUERY_ALLMELOVEORDERS).then((val: any) => {
            // alert(JSON.stringify(val));
            if (val && val.code === NetworkCommonUtil.SERVER_HTTP_TASK_STATUS_SUCCESS) {
                if (val.data && val.data.length > 0) {
                    this.setState({
                        meLoveOrdersResponValue: val,
                        backViewShow: '',
                    });
                } else {
                    this.setState({
                        meLoveOrdersResponValue: null,
                        backViewShow: '当前收藏夹一条记录都没有，去工作页找个工作吧',

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
    _onFlatListItemPress = (index) => {
        // alert(index+'selected');
        this._pushCompoent(FindDetialActivity, {data: this.state.meLoveOrdersResponValue.data[index]});
    };

    _renderFlatListItem = (item, index) => {
        return (
            <FragmentOrderItemView
                id={item.id}
                data={this.state.meLoveOrdersResponValue.data[index]}
                showClock={false}
                itemBtnTitle={'查看详情'}
                onItemBtnClick={() => this._onFlatListItemPress(index)}
            />
        );
    };

    //-------order list
    //定义空布局
    emptyComponent = () => {
        return <View style={{
            height: '100%',
            alignItems: 'center',
            justifyContent: 'center',
        }}>
            <Text style={{
                fontSize: 16
            }}>暂无数据下拉刷新</Text>
        </View>
    };

    render() {
        return (
            <View style={MeLoveActivityStyles.container}>
                <HeaderCommonView navigator={this.props.navigator}
                                  bgColor={'#FFCC33'}
                                  headerLeftShow={true}
                                  headerCenterShow={true}
                                  headerRightShow={false}
                                  showCenterAfterLeft={true}
                                  headerCenterTitle={'我的收藏'}/>

                <View style={MeLoveActivityStyles.function_list}>
                    {this.state.meLoveOrdersResponValue ?
                        <FlatList
                            ref={(flatList) => this._flatList = flatList}
                            data={this.state.meLoveOrdersResponValue.data}
                            extraData={this.state}
                            keyExtractor={this._keyExtractor}
                            renderItem={({item, index}) => this._renderFlatListItem(item, index)}
                            contentContainerStyle={MeLoveActivityStyles.function_list_contentContainer}
                        />
                        :
                        <View style={[MeLoveActivityStyles.function_list, {
                            alignItems: 'center',
                            justifyContent: 'center',
                        }]}>
                            <Text
                                style={MeLoveActivityStyles.normal_text}>{this.state.backViewShow}</Text>
                        </View>
                    }

                </View>
            </View>
        );
    };
}

MeLoveActivityStyles = StyleSheet.create({
    //基于flex-box布局
    container: {
        width: width,
        height: height,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FBFBFB',
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
    list_view: {
        flex: 1,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
    },
    function_list_container: {
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FBFBFB',
    },
    normal_text: {
        fontSize: 16,
    }
});