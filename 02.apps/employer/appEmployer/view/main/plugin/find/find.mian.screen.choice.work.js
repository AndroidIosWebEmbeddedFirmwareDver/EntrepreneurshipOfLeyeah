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

import ChoiceWorkListItem from './views/choice.work.list.item'


import HireMainScreen from '../hire/hire.mian.screen'
import BaseActivity from "../../../views/base.activity";


export default class FindMianScreenChoiceWork extends BaseActivity {
    //1.
    constructor(props) {
        super(props);
        this.state = {
            mobileUserData: null,
            responValue: '',
            selectedWork: '',
            showBottom: false,
            backViewShow: '',
            showFastCreateOrder: false,
            showFastCreateWork: false,
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
        if (this.props.selectedWokerType && this.state.mobileUserData && this.state.mobileUserData.data) {
            let params = {
                employerId: this.state.mobileUserData.data.id,
                wokerType: this.props.selectedWokerType,
            };
            NetworkCommonUtil.httpPostRequest(JSON.stringify(params), NetworkCommonUtil.SERVERURL_POST_ORDER_EMPLOY_EMPLOYER_FIND_NOT_START_WORK_BY_WORK_TYPE).then((val: any) => {
                // alert(JSON.stringify(val));
                if (val && val.code === NetworkCommonUtil.SERVER_HTTP_TASK_STATUS_SUCCESS) {
                    // this.setState({responValue: this._generNetToLocalData(val)});
                    if (val.data && val.data.length > 0) {
                        this.setState({
                            responValue: val,
                            backViewShow: null,
                            showFastCreateWork: false,
                            showFastCreateOrder: true,
                        });
                    } else {
                        this.setState({
                            responValue: null,
                            backViewShow: '此工种下暂时没有匹配的已创建的还未开工的工作',
                            showFastCreateWork: true,
                            showFastCreateOrder: false,
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
            <ChoiceWorkListItem
                id={item.id}
                itemData={this.state.responValue.data[index]}
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
        this.state.selectedWork = this.state.responValue.data[index];
        this.setState({
            responValue: this.state.responValue,
            selectedWork: this.state.selectedWork,
        });
    };

    //////--------------------
    //新创建工作
    _GotoCreateWorkWithData = () => {
        if (this.props.selectedWokerType && this.props.selectedWokers) {
            let params = {
                mobileUserData: this.state.mobileUserData,
                selectedWokerType: this.props.selectedWokerType,
                selectedWorkExp: this.props.selectedWorkExp,
                selectedWokers: this.props.selectedWokers,
                selectedShowTitle: '快速创建工作',
                selectedTag: 'fastCreate',
                headerBackShowTag: FindMainTags.screenTags.Work,
            };
            // this._pushCompoent(PushNromalHireScreen, params);
            if (this.props.onChangeRender) {
                this.props.onChangeRender(params, FindMainTags.screenTags.Hire);
            }
        }
    };

    _renderNextStep() {
        if (!this.state.selectedWork) {
            ToastManager.show('你还没有选择工作！', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            return;
        }
        if (this.state.selectedWork !== null && this.state.selectedWork.order !== null) {
            DialogManagerUtil.showNormalLoadingDialog();
            this.state.selectedWork.order.workOrderPushType = 2;
            this.setState({
                selectedWork: this.state.selectedWork,
            });
            let params = {
                employerId: this.state.mobileUserData.data.id,
                wokerType: this.props.selectedWokerType,
                orderDown: this.state.selectedWork,
                workEx: this.props.selectedWorkExp,
                wokers: this.props.selectedWokers,
            };
            NetworkCommonUtil.httpPostRequest(JSON.stringify(params), NetworkCommonUtil.SERVERURL_POST_ORDER_EMPLOY_EMPLOYER_SEND_INVIT_TO_EMPLOYEES_FOR_ME_ORDER).then((val: any) => {
                // alert(JSON.stringify(val));
                DialogManagerUtil.hide();
                if (val && val.code === NetworkCommonUtil.SERVER_HTTP_TASK_STATUS_SUCCESS) {
                    // this.setState({responValue: this._generNetToLocalData(val)});
                    this._onEmployerSendInvitCallback();
                } else if (val) {
                    ToastManager.show(val.msg + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
                } else {
                    ToastManager.show('请求网络出错' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
                }
            });
        }
    }

    _onEmployerSendInvitCallback = () => {
        let params = {
            selectedPushHireType: this.state.selectedWork.order.workOrderPushType,
        };
        if (this.props.onChangeRender) {
            this.props.onChangeRender(params, FindMainTags.screenTags.HireSuccess);
        }
    };

    _onbackPress = () => {
        let params = {
            selectedWokerType: this.props.selectedWokerType,
            selectedWorkExp: this.props.selectedWorkExp,
        };
        if (this.props.headerJustCllBack && this.props.onChangeRender) {
            this.props.onChangeRender(params, FindMainTags.screenTags.Worker);
        }
    };

    render() {
        return (
            <View style={FindMianScreenChoiceWorkStyles.container}>
                <HeaderCommonView navigator={this.props.navigator}
                                  bgColor={'#FFCC33'}
                                  justCllBack={this.props.headerJustCllBack}
                                  onbackPress={() => this._onbackPress()}
                                  headerLeftShow={true}
                                  headerCenterShow={true}
                                  headerRightShow={this.state.showFastCreateOrder}
                                  headerRightButtonTitle={'下一步'}
                                  headerRightButtonOnpress={() => this._renderNextStep()}
                                  showCenterAfterLeft={true}
                                  headerCenterTitle={'选择工作'}/>

                <View style={{height: 10, backgroundColor: 'transparent',}}/>
                {this.state.responValue ?
                    <View style={FindMianScreenChoiceWorkStyles.function_list}>
                        <FlatList
                            ref={(flatList) => this._flatList = flatList}
                            data={this.state.responValue.data}
                            extraData={this.state}//额外的能引更新的数据，如果不设置，可能导致不会刷新
                            keyExtractor={this._keyExtractor}
                            renderItem={({item, index}) => this._renderFlatListItem(item, index)}
                            contentContainerStyle={FindMianScreenChoiceWorkStyles.function_list_contentContainer}
                        />
                    </View>
                    :
                    <View style={[FindMianScreenChoiceWorkStyles.function_list, {
                        alignItems: 'center',
                        justifyContent: 'center',
                    }]}>
                        <Text
                            style={FindMianScreenChoiceWorkStyles.normal_text}>{this.state.backViewShow}</Text>
                        {this.state.showFastCreateWork ?
                            < TouchableOpacity
                                style={FindMianScreenChoiceWorkStyles.function_bottom_style_button}
                                onPress={() => this._GotoCreateWorkWithData()}
                            >
                                <Text
                                    style={[FindMianScreenChoiceWorkStyles.normal_text, {
                                        color: "#FFFFFF",
                                    }]}>快速创建工作</Text>
                            </TouchableOpacity>
                            : <View/>
                        }

                    </View>
                }

            </View>
        );
    }
}

FindMianScreenChoiceWorkStyles = StyleSheet.create({
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

