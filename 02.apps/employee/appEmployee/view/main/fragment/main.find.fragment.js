import React, {PureComponent, Component} from 'react';

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


import MeRnaActivity from './me/rna/me.rna.activity'
import ToastManager from '../../../utils/toast/Toast.util'
import FragmentHeaderToobarView from './header.toobar.view'
import FindDetialActivity from './find/find.detial.activity'
import FragmentOrderItemView from './fragment.order.item.view'
import UserRnaStatus from '../../../stable/json/user.rna.status'
import NetworkCommonUtil from '../../../utils/network.common.util'
import FefreshCommonFragment from "../../views/common/refresh.common.fragment";
import UserDataManager from '../../../utils/storage/user.data.manager.common.util'

class MainFindFragment extends FefreshCommonFragment {


    //1.
    constructor(props) {
        super(props);
        this.state = {
            mFlatListRefreshing: true,//当前的刷新状态
            mobileUserData: null,
            responValue: '',
            mainThemeColor: null,
            loadDataTag: false,
            sortToFindWorkUp: {
                page: 0,
                size: 10,
                sortTypeName: null,//排序方式
                sortDirection: 0,//0 desc,1 asc
                workOrderPushType: 0,//订单类型，默认0， 1-紧急 0-普通
                workRecruitStatus: 0,//招聘状态，默认0， 0-招聘中 1-招聘完成
            },
        };
    }

    //2.
    componentWillMount() {
        this.state.mainThemeColor = '#FFFFFF';
        this.setState({
            mainThemeColor: this.state.mainThemeColor,
        });
        if (this.props.changeStatusColor) {
            this.props.changeStatusColor('#FFCC33');
        }
        if (this.props.changeHeadbar) {
            this.props.changeHeadbar('#FFCC33', '找工作');
        }
        this._refreshUserData().then((ret) => {
            this._init();
        });
    }

    //3.
    componentDidMount() {

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


    _init = () => {
        ////1.sort
        if (this._fragmentHeaderToobarView) {
            this._fragmentHeaderToobarView._querySortTypeData();
        }
        // //2.list
        // this._queryFindWorkData();
    };

    _queryFindWorkData = () => {

        let paramsObject = {
            'page': this.state.sortToFindWorkUp.page,
            'size': this.state.sortToFindWorkUp.size,
            'sortTypeName': this.state.sortToFindWorkUp.sortTypeName,//排序方式
            'sortDirection': this.state.sortToFindWorkUp.sortDirection,//0 desc,1 asc
            'workOrderPushType': this.state.sortToFindWorkUp.workOrderPushType,//0 订单类型，默认0， 1-紧急 0-普通
            'workRecruitStatus': this.state.sortToFindWorkUp.workRecruitStatus,//订单招聘状态，默认0， 0-招聘中 1-招聘完成
        };

        NetworkCommonUtil.httpPostRequest(JSON.stringify(paramsObject), NetworkCommonUtil.SERVERURL_POST_ORDER_FINDWORK_BY_SORTTYPE).then((val: any) => {
            // alert(JSON.stringify(val));
            if (val && val.code === NetworkCommonUtil.SERVER_HTTP_TASK_STATUS_SUCCESS) {
                //刷新
                if (!this.state.loadDataTag) {
                    this.setState({responValue: val});
                }
                //加载
                else {
                    if (this.state.responValue && this.state.responValue.data && val.data && val.data.length > 0) {
                        this.state.responValue.data = this.state.responValue.data.concat(val.data);
                        this.setState({responValue: this.state.responValue});
                    }
                }
            } else if (val) {
                ToastManager.show(JSON.stringify(val) + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            } else {
                ToastManager.show('请求网络出错' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            }
            this._mFlatListStopRefresh();
        });
    };

    _onSortTypeItemClickCallback = (sortTypeName, sortDirection) => {
        this.setState({
            sortToFindWorkUp: {
                sortTypeName: sortTypeName,
                sortDirection: sortDirection,
                workOrderPushType: 0,
            }
        });
        // console.warn('sortTypeName' + sortTypeName + '---' + 'sortDirection' + sortDirection);
        if (this.state.sortToFindWorkUp && this.state.sortToFindWorkUp.sortTypeName) {
            this._mFlatListOnRefresh();
            // this._queryFindWorkData();
        }
    };

    _checkRna = () => {
        if (!UserRnaStatus.checkRna(this.state.mobileUserData.data.beRna)) {
            ToastManager.alertWithSure('提示', '亲~系统检测到您还未实名认证，请先实名认证后再继续操作哦。', () => {
                this._pushCompoent(MeRnaActivity, {
                    mobileUserData: this.state.mobileUserData,
                    onUserDataRefreshCallback: this._onUserDataRefreshCallback
                }, false)
            });
            return false;
        } else {
            return true;
        }
    };

    //-------order list
    //keyExtractor tells the list to use the ids for the react keys instead of the default key property.
    _keyExtractor = (item, index) => index;
    _onFlatListItemPress = (index) => {
        // alert(index+'selected');
        if (this._checkRna()) {
            this._pushCompoent(FindDetialActivity, {data: this.state.responValue.data[index]});
        }

    };

    _renderFlatListItem = (item, index) => {
        return (
            <FragmentOrderItemView
                id={item.id}
                data={this.state.responValue.data[index]}
                showClock={false}
                itemBtnTitle={'查看详情'}
                onItemBtnClick={() => this._onFlatListItemPress(index)}
            />
        );
    };

    //-------order list

    _mFlatListOnRefresh(): void {
        super._mFlatListOnRefresh();
        this.state.sortToFindWorkUp.page = 0;
        this.state.sortToFindWorkUp.size = 10;
        this.setState({
            responValue: '',
            loadDataTag: false,
            sortToFindWorkUp: this.state.sortToFindWorkUp,
        });
        this._queryFindWorkData();
    }

    _mFlatListOnEndReached() {
        this.state.sortToFindWorkUp.page = this.state.sortToFindWorkUp.page + 1;
        this.state.sortToFindWorkUp.size = 10;
        this.setState({
            loadDataTag: true,
            sortToFindWorkUp: this.state.sortToFindWorkUp,
        });
        this._queryFindWorkData();
    }

    //4.
    render() {
        return (

            <View
                style={[MainFindFragmentStyles.root, this.state.mainThemeColor ? {backgroundColor: this.state.mainThemeColor} : {}]}>
                <FragmentHeaderToobarView
                    // rootBgColor={'#FF00FF'}
                    ref={(fragmentHeaderToobarView) => this._fragmentHeaderToobarView = fragmentHeaderToobarView}
                    onSortTypeItemClickCallback={(sortTypeName, sortDirection) => this._onSortTypeItemClickCallback(sortTypeName, sortDirection)}
                />
                <View style={MainFindFragmentStyles.cut_line}/>

                <View style={MainFindFragmentStyles.list_view}>
                    <FlatList
                        ref={(flatList) => this._flatList = flatList}

                        //添加头尾布局
                        // ListHeaderComponent={this._mFlatListHeader}
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
                        contentContainerStyle={MainFindFragmentStyles.function_list_contentContainer}
                    />
                </View>
            </View>
        );
    }
}

MainFindFragmentStyles = StyleSheet.create({
    root: {
        flex: 1,
        flexDirection: 'column',
        // justifyContent: 'center',
        // alignItems: 'center',
    },
    list_view: {
        flex: 1,
        flexDirection: 'column',
    },
    function_list_contentContainer: {
        // paddingVertical: 16,
        //暂时解决安卓下布局显示不完整
        paddingBottom: 24,
    },
    cut_line: {
        backgroundColor: '#FBFBFB',
        height: 1.2
    },
});

export default MainFindFragment;