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


import Swiper from 'react-native-swiper'
import MeWorkActivity from './me/me.work.activity'
import MeRnaActivity from './me/rna/me.rna.activity'
import ToastManager from '../../../utils/toast/Toast.util'
import FragmentHeaderToobarView from './header.toobar.view'
import FragmentOrderItemView from './fragment.order.item.view'
import UserRnaStatus from '../../../stable/json/user.rna.status'
import NetworkCommonUtil from '../../../utils/network.common.util'
import FefreshCommonFragment from "../../views/common/refresh.common.fragment";
import UserDataManager from '../../../utils/storage/user.data.manager.common.util'


class MainHomeFragment extends FefreshCommonFragment {
    //1.
    constructor(props) {
        super(props);
        this.state = {
            mFlatListRefreshing: true,//当前的刷新状态
            mobileUserData: null,
            responValue: '',
            responBanarValue: null,
            mainThemeColor: null,
            loadDataTag: false,
            floatMotxtShow: '管理工作',
            showFLoatGo: false,
            sortToFindWorkUp: {
                page: 0,
                size: 10,
                sortTypeName: null,//排序方式
                sortDirection: 0,//0 desc,1 asc
                workOrderPushType: 1,//订单类型，默认0， 1-紧急 0-普通
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
            this.props.changeStatusColor('#FFCC33');//d3d3d3
        }
        if (this.props.changeHeadbar) {
            this.props.changeHeadbar('#FFCC33', '抢工作');
        }
    }

    //3.
    componentDidMount() {
        this._refreshUserData().then((ret) => {
            this._init();
        });
    }

    _init = () => {
        //1.bannar
        this._initQueryBanarData();
        // //2.sort
        // if (this._fragmentHeaderToobarView) {
        //     this._fragmentHeaderToobarView._querySortTypeData();
        // }
        // //3.list
        // this._queryFindWorkData();
    };

    //1.查询本地缓存用户数据
    _refreshUserData = (tag) => {
        return UserDataManager.getInstance().load().then((ret) => {
            if (ret) {
                this.setState({
                    mobileUserData: ret,
                });
            }
            return ret;
        });
    };

    _initQueryBanarData = () => {
        let paramsObject = {
            appType: 0,
        };
        NetworkCommonUtil.httpPostRequest(JSON.stringify(paramsObject), NetworkCommonUtil.SERVERURL_POST_API_SYS_MOBILR_APP_BANAR_QUERY_ALL).then((val: any) => {
            // alert(JSON.stringify(val));
            if (val && val.code === NetworkCommonUtil.SERVER_HTTP_TASK_STATUS_SUCCESS) {
                this.setState({responBanarValue: val});
                if (this._mainhomeToobarView) {
                    this._mainhomeToobarView._querySortTypeData();
                }
            } else if (val) {
                ToastManager.show(JSON.stringify(val) + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            } else {
                ToastManager.show('请求网络出错' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            }
        });
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
                workOrderPushType: 1,
            }
        });
        // console.warn('sortTypeName' + sortTypeName + '---' + 'sortDirection' + sortDirection);
        if (this.state.sortToFindWorkUp && this.state.sortToFindWorkUp.sortTypeName) {
            this._mFlatListOnRefresh();
            // this._queryFindWorkData();
        }
    };
    //页面跳转
    _pushCompoent = (component: Component, params: any, checkRna: boolean) => {
        if (this._checkIsLogin()) {
            if (checkRna) {
                if (this._checkRna()) {
                    if (component !== null) {
                        this.props.navigator.push({
                            component: component,
                            params: params,
                        });
                    }
                }
            } else {
                if (component !== null) {
                    this.props.navigator.push({
                        component: component,
                        params: params,
                    });
                }
            }
        }

    };

    //-------order list
    //keyExtractor tells the list to use the ids for the react keys instead of the default key property.
    _keyExtractor = (item, index) => index;
    _onFlatListItemPress = (index) => {
        if (this._checkIsLogin() && this._checkRna()) {
            // alert(index + 'selected');
            this._orderResumeSendResume(this.state.responValue.data[index]);
        }
    };

    /**
     * 检查是否已经登录
     * @returns {boolean}
     * @private
     */
    _checkIsLogin = () => {
        if (typeof(this.state.mobileUserData) === "undefined" || this.state.mobileUserData === null) {
            if (this.props.goLogin) {
                this.props.goLogin();
            }
            return false;
        } else {
            return true;
        }

    };

    /**
     * 检查是否已经实名认证
     * @returns {boolean}
     * @private
     */
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

    //实名认证
    _onUserDataRefreshCallback = () => {
        this._refreshUserData().then((ret) => {
            if (this.props.onUserDataRefreshCallback) {
                this.props.onUserDataRefreshCallback();
            }
        });
    };


    _renderFlatListItem = (item, index) => {
        return (
            <FragmentOrderItemView
                id={item.id}
                data={this.state.responValue.data[index]}
                showClock={true}
                itemBtnTitle={'立即抢单'}
                onItemBtnClick={() => this._onFlatListItemPress(index)}
            />
        );
    };

    _orderResumeSendResume = (orderDownData) => {
        if (!orderDownData || !this.state.mobileUserData) {
            return;
        }
        let paramsObject = {
            'orderId': orderDownData.order.id,
            'workEmployerId': orderDownData.employer.id,
            'workEmployeeId': this.state.mobileUserData.data.id,//排序方式
        };
        NetworkCommonUtil.httpPostRequest(JSON.stringify(paramsObject), NetworkCommonUtil.SERVERURL_POST_ORDER_RESUME_SENDRESUME).then((val: any) => {
            // alert(JSON.stringify(val));
            // if (val && val.code === NetworkCommonUtil.SERVER_HTTP_TASK_STATUS_SUCCESS) {
            //     ToastManager.show(val.msg + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            // } else
            if (val) {
                // ToastManager.show(val.msg + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
                ToastManager.alertDialog('提示', '抢工作成功，是否立即' + this.state.floatMotxtShow + '？', '取消', () => {
                }, '确定', () => {
                    this._pushCompoent(MeWorkActivity, {}, true)
                });
            } else {
                ToastManager.show('请求网络出错' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            }
        });
    };


    _gener_banar_item_view() {
        let pages = [];
        if (this.state.responBanarValue && this.state.responBanarValue.data && this.state.responBanarValue.data.length > 0) {
            for (let i = 0; i < this.state.responBanarValue.data.length; i++) {
                pages.push(
                    <View
                        key={i}
                        style={MainHomeFragmentStyles.slide}>
                        <Image
                            source={this.state.responBanarValue.data[i] && this.state.responBanarValue.data[i].imageUrl ? {uri: this.state.responBanarValue.data[i].imageUrl} : {uri: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1512878542494&di=c1d54f0ec50f462a0dd4cb3e32cb4c64&imgtype=0&src=http%3A%2F%2Fimg1.3lian.com%2F2015%2Fa1%2F95%2Fd%2F105.jpg'}}
                            style={MainHomeFragmentStyles.slide_image}
                        />
                    </View>
                );
            }
        }
        return pages;
    }

    //-------order list
    _homeFlatListHeader() {
        return (
            <View style={{
                flexDirection: 'column',
            }}>
                <View style={MainHomeFragmentStyles.swiper_view}>
                    <Swiper style={MainHomeFragmentStyles.wrapper}
                            showsButtons={false}
                            autoplay={true}
                            dotColor={'#EEEEEE'}
                            activeDotColor={'#FFFFFF'}
                    >
                        {
                            this.state.responBanarValue ?
                                this._gener_banar_item_view().map((itemView, index) => {
                                    return itemView;
                                })
                                :
                                <View/>
                        }
                    </Swiper>
                </View>
                <FragmentHeaderToobarView
                    // rootBgColor={'#FF00FF'}
                    ref={(mainhomeToobarView) => this._mainhomeToobarView = mainhomeToobarView}
                    onSortTypeItemClickCallback={(sortTypeName, sortDirection) => this._onSortTypeItemClickCallback(sortTypeName, sortDirection)}
                />
                <View style={MainHomeFragmentStyles.cut_line}/>
            </View>
        );
    }

    _mFlatListFooter(): * {
    }

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
                style={[MainHomeFragmentStyles.root, this.state.mainThemeColor ? {backgroundColor: this.state.mainThemeColor} : {}]}>
                <View
                    style={[MainHomeFragmentStyles.root, this.state.mainThemeColor ? {backgroundColor: this.state.mainThemeColor} : {}]}>
                    {this._homeFlatListHeader()}
                    <View style={MainHomeFragmentStyles.list_view}>
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
                        />
                    </View>
                </View>

                {this.state.showFLoatGo ?
                    <View style={[MainHomeFragmentStyles.root, {
                        flex: 0,
                        alignItems: 'flex-end',
                        justifyContent: 'flex-end',
                    }]}>
                        <View style={{
                            width: 64 + 9.6 * 4,
                            height: 64 + 9.6 * 4,
                            position: 'absolute',
                            alignItems: 'center',
                            justifyContent: 'center',
                        }}>
                            <TouchableOpacity
                                style={{
                                    width: 64,
                                    height: 64,
                                    backgroundColor: 'rgba(0, 0, 0, 0.56)',
                                    alignItems: 'center',
                                    justifyContent: 'center',
                                    borderRadius: 64 / 2,
                                    borderColor: 'rgba(0, 0, 0, 0)',
                                    borderWidth: 1,
                                }}
                                onPress={() => {
                                    this._pushCompoent(MeWorkActivity, {}, true)
                                }}>
                                <Image
                                    source={require('../../../stable/image/main/ic_main_home_go_work.png')}
                                    style={{width: 22, height: 22, resizeMode: 'center',}}
                                />
                                <Text style={[MainHomeFragmentStyles.normal_text, {
                                    fontSize: 11,
                                    marginTop: 9.6 / 2,
                                    color: '#FFFFFF',
                                }]}>{this.state.floatMotxtShow}</Text>
                            </TouchableOpacity>
                        </View>
                    </View>
                    : <View/>
                }
            </View>
        );
    }
}


MainHomeFragmentStyles = StyleSheet.create({
    root: {
        flex: 1,
        flexDirection: 'column',
    },
    swiper_view: {
        width: width,
        height: 120,
        flexDirection: 'column',
    },
    wrapper: {
        justifyContent: 'center',
        alignItems: 'center',
    },
    slide: {
        flex: 1,
        flexDirection: 'column',
        justifyContent: 'center',
        alignItems: 'center',
    },
    slide_image: {
        flex: 1,
        width: width,
        resizeMode: 'stretch',//cover:等比拉伸 stretch:保持原有大小 contain:图片拉伸  充满空间
    },
    text: {
        color: '#fff',
        fontSize: 30,
        fontWeight: 'bold',
    },
    list_view: {
        flex: 1,
        flexDirection: 'row',
        // justifyContent: 'center',
        // alignItems: 'center',
    },
    cut_line: {
        backgroundColor: '#FBFBFB',
        height: 1.2
    },
    normal_text: {
        fontSize: 16,
    }
});
export default MainHomeFragment;


