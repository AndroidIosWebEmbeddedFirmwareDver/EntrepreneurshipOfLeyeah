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
    Dimensions,
    ActivityIndicator,
    TouchableOpacity,
    StyleSheet,
    FlatList,
} from 'react-native';

const {
    width,
    height
} = Dimensions.get('window');


import NetworkCommonUtil from '../../../../utils/network.common.util'
import UserDataManager from '../../../../utils/storage/user.data.manager.common.util'
import ToastManager from '../../../../utils/toast/Toast.util'
import DialogManagerUtil from '../../../views/dialog/dialog.manager.util'
import NumberCommonUtil from '../../../../utils/number.common.util'


import FindMainTags from './find.main.tags'

import HeaderCommonView from '../../../views/header/header.common.view'
import CommonChoiceListItemView from '../../../views/common/common.choice.list.item.view'
import ChoiceWokersListItem from './views/choice.wokers.list.item'
import CommonListItemView from '../../../views/common/common.list.item.view'

import CreateWorkForFindMainScreen from './find.mian.screen.create.work'
import FindMianScreenChoiceWork from './find.mian.screen.choice.work'
import HireMainScreen from '../hire/hire.mian.screen'
import PushNromalHireScreen from "../hire/hire.mian.screen";
import BaseActivity from "../../../views/base.activity";


export default class ChoiceWorkerForFindMainScreen extends BaseActivity {

    //1.
    constructor(props) {
        super(props);
        this.state = {
            mobileUserData: null,
            queryDataPage: {
                size: 12,//分页大小
                page: 0,//当前页数
                sort: 0,//排序方式
                sortType: 'id',//排序字段
            },
            responValue: null,
            backViewShow: '努力加载中...'
        };
    }

    //2.
    componentWillMount() {
        super.componentWillMount();
    }

    //3.
    componentDidMount() {
        super.componentDidMount();
        this._refreshUserData().then(data => {
            this._initQueryData();
        });
    }

    //4.
    componentWillUnmount() {
        super.componentWillUnmount();
    }

    componentWillReceiveProps() {

    }

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


    //查询数据
    _initQueryData = (tag: any) => {
        if (tag) {
            if (tag === 0) {//refresh
                this.setState({
                    queryDataPage: {
                        page: 0,//当前页数
                    },
                });
            } else if (tag === 1) {//load_more
                this.setState({
                    queryDataPage: {
                        page: this.state.queryDataPage.page + 1,//当前页数
                    },
                });
            }
        }
        if (this.props.selectedWokerType) {
            let params = {
                size: this.state.queryDataPage.size,//分页大小
                page: this.state.queryDataPage.page,//当前页数
                sort: this.state.queryDataPage.sort,//排序方式
                sortType: this.state.queryDataPage.sortType,//排序字段
                sortData: {
                    wokerType: this.props.selectedWokerType,
                    expReqType: this.props.selectedWorkExp,
                },
            };

            NetworkCommonUtil.httpPostRequest(JSON.stringify(params), NetworkCommonUtil.SERVERURL_POST_ORDER_EMPLOY_EMPLOYER_FIND_EMPLOYEE).then((val: any) => {
                // alert(JSON.stringify(val));
                if (val && val.code === NetworkCommonUtil.SERVER_HTTP_TASK_STATUS_SUCCESS) {
                    // this.setState({responValue: this._generNetToLocalData(val)});
                    if (val.data && val.data.length > 0) {
                        this.setState({
                            responValue: val,
                        });
                    } else {
                        this.setState({
                            responValue: null,
                            backViewShow: this.props.selectedWokerType && this.props.selectedWorkExp ?
                                '暂无' + '\n'
                                + '工作类型为：' + this.props.selectedWokerType.name + '\n'
                                + '工作经验为：' + this.props.selectedWorkExp.description + '\n'
                                + '的工人，请返回选择其他条件再试。'
                                : '此工种下暂时没有匹配的工人',
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


    //keyExtractor tells the list to use the ids for the react keys instead of the default key property.
    _keyExtractor = (item, index) => index;

    _onFlatListItemPress = (index) => {
        this.state.responValue.data[index].selected = !this.state.responValue.data[index].selected;
        this.setState({
            responValue: this.state.responValue,
        });
    };

    _renderFlatListItem = (item, index) => {
        return (
            <ChoiceWokersListItem
                id={item.id}
                itemData={this.state.responValue.data[index]}
                rightShowSelected={this.state.responValue.data[index].selected}
                onSelectPress={() => this._onFlatListItemPress(index)}
            />
        );
    };

    //加入已创建工作
    _GotoChoiceWorkWithData = () => {
        if (this.state.responValue && this.state.responValue.data) {
            let selectedWokers = [];
            for (let a of this.state.responValue.data) {
                if (a.selected) {
                    selectedWokers.push(a);
                }
            }
            if (!selectedWokers || selectedWokers.length <= 0) {
                ToastManager.show('你还没有选择工人，请至少选择一名工人！', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
                return;
            }
            let params = {
                selectedWokerType: this.props.selectedWokerType,
                selectedWorkExp: this.props.selectedWorkExp,
                selectedWokers: selectedWokers,
            };
            // this._pushCompoent(FindMianScreenChoiceWork, params);
            if (this.props.onChangeRender) {
                this.props.onChangeRender(params, FindMainTags.screenTags.Work);
            }
        }
    };

    //加入已创建工作
    _GotoCreateWorkWithData = () => {
        if (this.state.responValue && this.state.responValue.data) {
            let selectedWokers = [];
            for (let a of this.state.responValue.data) {
                if (a.selected) {
                    selectedWokers.push(a);
                }
            }
            if (!selectedWokers || selectedWokers.length <= 0) {
                ToastManager.show('你还没有选择工人，请至少选择一名工人！', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
                return;
            }
            let params = {
                mobileUserData: this.state.mobileUserData,
                selectedWokerType: this.props.selectedWokerType,
                selectedWorkExp: this.props.selectedWorkExp,
                selectedWokers: selectedWokers,
                selectedShowTitle: '快速创建工作',
                selectedTag: 'fastCreate',
                headerBackShowTag: FindMainTags.screenTags.Worker,
            };
            // this._pushCompoent(PushNromalHireScreen, params);
            if (this.props.onChangeRender) {
                this.props.onChangeRender(params, FindMainTags.screenTags.Hire);
            }
        }
    };


    _onbackPress = () => {
        let params = {
            selectedWokerType: this.props.selectedWokerType,
            selectedWorkExp: this.props.selectedWorkExp,
        };
        if (this.props.headerJustCllBack && this.props.onChangeRender) {
            this.props.onChangeRender(params, FindMainTags.screenTags.WorkExp);
        }
    };


    render() {
        return (
            <View style={PhoneResetActivityStyles.container}>
                <HeaderCommonView navigator={this.props.navigator}
                                  bgColor={'#FFCC33'}
                                  justCllBack={this.props.headerJustCllBack}
                                  onbackPress={() => this._onbackPress()}
                                  headerLeftShow={true}
                                  headerCenterShow={true}
                                  headerRightShow={false}
                                  showCenterAfterLeft={true}
                                  headerCenterTitle={'选择工人'}/>
                <View style={{height: 10, backgroundColor: 'transparent',}}/>
                {this.state.responValue ?
                    <View style={ChoiceWorkerForFindMainScreenStyles.function_list}>
                        <FlatList
                            ref={(flatList) => this._flatList = flatList}
                            data={this.state.responValue.data}
                            extraData={this.state}//额外的能引更新的数据，如果不设置，可能导致不会刷新
                            keyExtractor={this._keyExtractor}
                            renderItem={({item, index}) => this._renderFlatListItem(item, index)}
                            contentContainerStyle={ChoiceWorkerForFindMainScreenStyles.function_list_contentContainer}
                        />
                        <View
                            style={ChoiceWorkerForFindMainScreenStyles.function_bottom_style_full}>
                            <TouchableOpacity
                                style={ChoiceWorkerForFindMainScreenStyles.function_bottom_style_button}
                                onPress={() => this._GotoCreateWorkWithData()}
                            >
                                <Text
                                    style={[ChoiceWorkerForFindMainScreenStyles.normal_text, {
                                        color: "#FFFFFF",
                                    }]}>快速创建工作</Text>
                            </TouchableOpacity>
                            <View
                                style={ChoiceWorkerForFindMainScreenStyles.function_bottom_style_cut_line}>
                                <View
                                    style={ChoiceWorkerForFindMainScreenStyles.function_bottom_style_cut_line_View}/>
                            </View>
                            <TouchableOpacity
                                style={ChoiceWorkerForFindMainScreenStyles.function_bottom_style_button}
                                onPress={() => this._GotoChoiceWorkWithData()}
                            >
                                <Text
                                    style={[ChoiceWorkerForFindMainScreenStyles.normal_text, {
                                        color: "#FFFFFF",
                                    }]}>加入已创建工作</Text>
                            </TouchableOpacity>
                        </View>
                    </View>
                    :
                    <View style={[ChoiceWorkerForFindMainScreenStyles.function_list, {
                        alignItems: 'center',
                        justifyContent: 'center',
                    }]}>
                        <Text
                            onPress={() => this._onbackPress()}
                            style={[ChoiceWorkerForFindMainScreenStyles.normal_text, {
                                color: "#FFFFFF",
                                backgroundColor: '#FFCC33',
                                padding: 9.6,
                            }]}>{this.state.backViewShow}</Text>
                    </View>
                }
            </View>
        );
    }
}

ChoiceWorkerForFindMainScreenStyles = StyleSheet.create({
    //基于flex-box布局
    container: {
        flex: 1,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FBFBFB',
    },
    function_list: {
        flex: 1,
        flexDirection: 'column',
        backgroundColor: '#FBFBFB',
    },
    function_list_contentContainer: {
        // paddingVertical: 16,
        //暂时解决安卓下布局显示不完整
        paddingBottom: 24,
    },
    function_bottom_style_full: {
        flexDirection: 'row',//row ,row-reverse ,column ('default') column-reverse
    },
    function_bottom_style_button: {
        flex: 1,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        height: 48,
        backgroundColor: '#FFCC33',
        justifyContent: 'center',
        alignItems: 'center',
    },
    function_bottom_style_cut_line: {
        width: 2,
        height: 48,
        backgroundColor: '#FFCC33',
        flexDirection: 'column',
        justifyContent: 'center',
        alignItems: 'center',
    },
    function_bottom_style_cut_line_View: {
        height: 32,
        width: 2,
        backgroundColor: '#FFFFFF',
    },
    normal_text: {
        fontSize: 16,
    }
});

