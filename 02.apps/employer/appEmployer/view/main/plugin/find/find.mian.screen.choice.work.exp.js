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

import NumberCommonUtil from '../../../../utils/number.common.util'

import FindMainTags from './find.main.tags'

import HeaderCommonView from '../../../views/header/header.common.view'
import NetworkCommonUtil from '../../../../utils/network.common.util'
import UserDataManager from '../../../../utils/storage/user.data.manager.common.util'
import ToastManager from '../../../../utils/toast/Toast.util'
import DialogManagerUtil from '../../../views/dialog/dialog.manager.util'

import CommonChoiceListItemView from '../../../views/common/common.choice.list.item.view'

import ChoiceWorkerForFindMainScreen from './find.mian.screen.choice.worker'
import HireMainScreen from '../hire/hire.mian.screen'
import BaseActivity from "../../../views/base.activity";


export default class FindMianScreenChoiceWorkExp extends BaseActivity {
    constructor(props) {
        super(props);
        this.state = {
            mobileUserData: null,
            responValue: '',
            selectedWorkExp: null,
            backViewShow: '努力加载中...',
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
            this._initQueryData_NotStartWorkByWorkType();
        });
    }

    //4.
    componentWillUnmount() {
        super.componentWillUnmount();
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

    _initQueryData_NotStartWorkByWorkType = () => {
        NetworkCommonUtil.httpGetRequest(NetworkCommonUtil.SERVERURL_SYS_ORDER_EXPRERIENCEREQUIRETYPE_QUERYALL_GET).then((val: any) => {
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
                        backViewShow: '暂无工作种类',
                    });
                }
            } else if (val) {
                ToastManager.show(val.msg + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            } else {
                ToastManager.show('请求网络出错' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            }
        });
    };


    //页面跳转
    _pushCompoent = (component: Component, params: any) => {
        if (component) {
            this.props.navigator.push({
                component: component,
                params: params,
            });
        }
    };
    //////--------------------
    _keyExtractor = (item, index) => index;

    _renderFlatListItem = (item, index) => {
        return (
            <CommonChoiceListItemView
                id={item.id}
                leftShowTitle={this.state.responValue.data[index].description}
                rightShowSelected={this.state.responValue.data[index].selected}
                onSelectPress={() => this._onFlatListItemPress(index)}
            />
        );
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

    _renderNextStep() {
        if (!this.state.selectedWorkExp) {
            ToastManager.show('你还没有选择经验要求！', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
        } else {
            let params = {
                selectedWorkExp: this.state.selectedWorkExp,
                selectedWokerType: this.props.selectedWokerType,
            };
            // this._pushCompoent(ChoiceWorkerForFindMainScreen, params);
            if (this.props.onChangeRender) {
                this.props.onChangeRender(params, FindMainTags.screenTags.Worker);
            }
        }
    }

    _onbackPress = () => {
        let params = {
            selectedWokerType: this.props.selectedWokerType,
        };
        if (this.props.headerJustCllBack && this.props.onChangeRender) {
            this.props.onChangeRender(params, FindMainTags.screenTags.WorkType);
        }
    };

    render() {
        return (
            <View style={FindMianScreenChoiceWorkExpStyles.container}>
                <HeaderCommonView navigator={this.props.navigator}
                                  bgColor={'#FFCC33'}
                                  justCllBack={this.props.headerJustCllBack}
                                  onbackPress={() => this._onbackPress()}
                                  headerLeftShow={true}
                                  headerCenterShow={true}
                                  headerRightShow={true}
                                  headerRightButtonTitle={'下一步'}
                                  headerRightButtonOnpress={() => this._renderNextStep()}
                                  showCenterAfterLeft={true}
                                  headerCenterTitle={'选择经验要求'}/>

                <View style={{height: 10, backgroundColor: 'transparent',}}/>
                {this.state.responValue ?
                    <View style={FindMianScreenChoiceWorkExpStyles.function_list}>
                        <FlatList
                            ref={(flatList) => this._flatList = flatList}
                            data={this.state.responValue.data}
                            extraData={this.state}//额外的能引更新的数据，如果不设置，可能导致不会刷新
                            keyExtractor={this._keyExtractor}
                            renderItem={({item, index}) => this._renderFlatListItem(item, index)}
                            contentContainerStyle={FindMianScreenChoiceWorkExpStyles.function_list_contentContainer}
                        />
                    </View>
                    :
                    <View style={[FindMianScreenChoiceWorkExpStyles.function_list, {
                        alignItems: 'center',
                        justifyContent: 'center',
                    }]}>
                        <Text
                            style={FindMianScreenChoiceWorkExpStyles.normal_text}>{this.state.backViewShow}</Text>
                    </View>
                }

            </View>
        );
    }
}

FindMianScreenChoiceWorkExpStyles = StyleSheet.create({
    //基于flex-box布局
    container: {
        flex: 1,
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
    function_bottom_style_button: {
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        height: 48,
        backgroundColor: '#FFCC33',
        justifyContent: 'center',
        alignItems: 'center',
        borderRadius: 4.8,
        borderColor: '#FFCC33',
        borderWidth: 2,
        marginTop: 9.6,
        padding: 9.6,
    },
    normal_text: {
        fontSize: 16,
    }

});

