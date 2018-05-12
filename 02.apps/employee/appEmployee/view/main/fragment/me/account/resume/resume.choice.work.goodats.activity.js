import React, {PureComponent, Component} from 'react';
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
    Dimensions,
    ActivityIndicator,
    StyleSheet,
    TouchableOpacity,
    FlatList,
} from 'react-native';

const {
    width,
    height
} = Dimensions.get('window');

import ToastManager from '../../../../../../utils/toast/Toast.util'
import NetworkCommonUtil from '../../../../../../utils/network.common.util'
import HeaderCommonView from '../../../../../views/header/header.common.view'
import DialogManagerUtil from '../../../../../views/dialog/dialog.manager.util'
import RefreshCommonActivity from "../../../../../views/common/refresh.common.activity"
import UserDataManager from '../../../../../../utils/storage/user.data.manager.common.util'
import CommonChoiceListItemView from '../../../../../views/common/common.choice.list.item.view'


export default class ResumeChoiceWorkGoodatsActivity extends RefreshCommonActivity {

    //1.
    constructor(props) {
        super(props);
        this.state = {
            mFlatListRefreshing: true,//当前的刷新状态
            responValue: '',
        };
    }

    //2.
    componentWillMount() {
        super.componentWillMount();
        this._mFlatListOnRefresh();
    }

    //3.
    componentDidMount() {
        super.componentDidMount();
    }

    //4.
    componentWillUnmount() {
        super.componentWillUnmount();
    }

    componentWillReceiveProps() {

    }

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
    _initQueryData = () => {
        NetworkCommonUtil.httpGetRequest(NetworkCommonUtil.SERVERURL_API_MOBILE_USER_RESUME_GOODATS_QUERYALL).then((val: any) => {
            // alert(JSON.stringify(val));
            this._mFlatListStopRefresh();
            if (val && val.code === NetworkCommonUtil.SERVER_HTTP_TASK_STATUS_SUCCESS) {
                this.setState({responValue: this._generNetToLocalData(val)});
            } else if (val) {
                ToastManager.show(val.msg + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            } else {
                ToastManager.show('请求网络出错' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            }
        });
    };

    //已经设置过的匹配
    _generNetToLocalData = (val) => {
        if (val && val.data && this.props.mobileUserData && this.props.mobileUserData.data && this.props.mobileUserData.data.resume && this.props.mobileUserData.data.resume.workGoodAts) {
            for (let i of val.data) {
                for (let work of JSON.parse(this.props.mobileUserData.data.resume.workGoodAts)) {
                    if (i.id === work.id) {
                        i.selected = true;
                    }
                }
            }
        }
        return val;
    };

    //keyExtractor tells the list to use the ids for the react keys instead of the default key property.
    _keyExtractor = (item, index) => index;

    _onFlatListItemPress = (index) => {
        this.state.responValue.data[index].selected = !this.state.responValue.data[index].selected;
        this.setState({
            responValue: this.state.responValue,
        });
        // // //强制刷新Render
        this.forceUpdate();
    };

    _renderFlatListItem = (item, index) => {
        return (
            <CommonChoiceListItemView
                id={item.id}
                leftShowTitle={this.state.responValue.data[index].name}
                rightShowSelected={this.state.responValue.data[index].selected}
                onSelectPress={() => this._onFlatListItemPress(index)}
            />
        );
    };

    //提交数据
    _commitData = () => {
        let workGoodAts = [];
        for (let i of this.state.responValue.data) {
            if (i.selected) {
                workGoodAts.push(i);
            }
        }
        if (workGoodAts.length <= 0) {
            ToastManager.show('请至少选择一项' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            return;
        }

        if (workGoodAts.length > 3) {
            ToastManager.show('选择不能超过三项' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            return;
        }
        DialogManagerUtil.showNormalLoadingDialog();

        let params = {
            resume: {
                userId: this.props.mobileUserData.data.id,
                phone: this.props.mobileUserData.data.phone,
                typeName: this.props.mobileUserData.data.typeName,
                typeId: this.props.mobileUserData.data.typeId,
                workGoodAts: JSON.stringify(workGoodAts),
            },
            workGoodAts: workGoodAts,
        };
        NetworkCommonUtil.httpPostRequest(JSON.stringify(params), NetworkCommonUtil.SERVERURL_SYS_POST_USER_RESUME_UPDATE_WORKGOODATS).then((val: any) => {
            DialogManagerUtil.hide();
            if (val && val.code === NetworkCommonUtil.SERVER_HTTP_TASK_STATUS_SUCCESS) {
                // ToastManager.show(val.msg + '', ToastManager.DURATION.LONG, ToastManager.POSITION.BOTTOM);
                this._onSuccessCallback(params.resume.workGoodAts);
            } else if (val) {
                ToastManager.show(val.msg + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            } else {
                ToastManager.show('请求网络出错' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            }
        });
    };

    //提交成功
    _onSuccessCallback = (workGoodAts) => {
        UserDataManager.getInstance().saveResumeOfWorkGoodAts(workGoodAts).then().then(saveToMap => {
            if (this.props.onUserDataRefreshCallback) {
                this.props.onUserDataRefreshCallback();
            }
            if (this.props.navigator) {
                this.props.navigator.pop();
            }
        });
    };

    //-------order list
    _homeFlatListHeader() {
    }

    _mFlatListFooter(): * {
    }

    _mFlatListOnRefresh(): void {
        this.setState({
            responValue: '',
        });
        this._initQueryData();
    }

    _mFlatListOnEndReached() {
    }


    render() {
        return (
            <View style={PhoneResetActivityStyles.container}>
                <HeaderCommonView navigator={this.props.navigator}
                                  bgColor={'#FFCC33'}
                                  headerLeftShow={true}
                                  headerCenterShow={true}
                                  headerRightShow={true}
                                  headerRightButtonTitle={'完成'}
                                  headerRightButtonOnpress={() => this._commitData()}
                                  showCenterAfterLeft={true}
                                  headerCenterTitle={'我的擅长'}/>
                <View style={ResumeChoiceWorkGoodatsActivityStyles.function_list}>
                    <View style={{height: 10, backgroundColor: 'transparent',}}/>

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
                        extraData={this.state}//额外的能引更新的数据，如果不设置，可能导致不会刷新
                        keyExtractor={this._keyExtractor}
                        renderItem={({item, index}) => this._renderFlatListItem(item, index)}
                    />
                </View>
            </View>
        );
    }
}


ResumeChoiceWorkGoodatsActivityStyles = StyleSheet.create({
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
    function_list_item: {
        flex: 1,
        flexDirection: 'row',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FBFBFB',
        justifyContent: 'center',
        alignItems: 'flex-start',
    },
    function_list_item_view: {
        flex: 1,
        height: 56,
        flexDirection: 'row',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FFFFFF',
        justifyContent: 'center',
        alignItems: 'center',
    },
});

