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
} from 'react-native';

const {
    width,
    height
} = Dimensions.get('window');

import ToastManager from '../../../../utils/toast/Toast.util'
import HeaderCommonView from '../../../views/header/header.common.view'
import Communications from '../../../../utils/call.email.text.common.util'
import CommonListItemView from '../../../views/common/common.list.item.view'
import AboutManagerAccountScreen from './manager/about.manager.account.screen'
import UpdateManagerAccountScreen from './manager/update.manager.account.screen'
import AdvanceManagerAccountScreen from './manager/advance.manager.account.screen'
import BaseActivity from "../../../views/base.activity";


export default class MyManagerAccountScreen extends BaseActivity {

    constructor(props) {
        super(props);
        this.state = {};
    }


    //2.
    componentWillMount() {
        super.componentWillMount();
    }

    //3.
    componentDidMount() {
        super.componentDidMount();
    }

    //4.
    componentWillUnmount() {
        super.componentWillUnmount();
    }

    //页面跳转
    _pushCompoent = (component: Component, params: any) => {
        if (component) {
            this.props.navigator.push({
                component: component,
                params: params,
            });
        }
    };

    _inquiryIsSureNeedExit = () => {
        ToastManager.alertDialog('提示', '是否确定退出？', '取消', () => {
        }, '确定', () => {
            this._goToExit();
        });
    };
    _goToExit = () => {
        if (this.props.onLogoutSuccessCallback) {
            this.props.onLogoutSuccessCallback();
            // this.props.navigator.pop();
        }
        this.props.navigator.pop();
    };

    _jumpToCallUs = (phone) => {
        if (!phone || phone.isEmpty) {
            return;
        }
        ToastManager.alertDialog('提示', '是否立即拨打' + phone, '取消', () => {
        }, '确定', () => {
            Communications.phonecall(phone, false);
        });
    };


    render() {
        return (
            <View style={MyManagerAccountScreenStyles.container}>
                <HeaderCommonView navigator={this.props.navigator}
                                  bgColor={'#FFCC33'}
                                  headerLeftShow={true}
                                  headerCenterShow={true}
                                  headerRightShow={false}
                                  showCenterAfterLeft={true}
                                  headerCenterTitle={'账号设置'}/>

                <ScrollView style={MyManagerAccountScreenStyles.function_list}
                            contentContainerStyle={MyManagerAccountScreenStyles.function_list_contentContainer}
                >
                    <View style={MyManagerAccountScreenStyles.function_list_container}>
                        <View style={{height: 10, backgroundColor: 'transparent',}}/>

                        {/*<CommonListItemView*/}
                        {/*itemOnpress={() => this._pushCompoent(UseManagerAccountScreen, {})}*/}
                        {/*leftTitle={'使用说明'}*/}
                        {/*rightType={'next'}*/}
                        {/*rightNextImage={require('../../../../stable/image/ic_app_more.png')}*/}
                        {/*bottomViewHeight={2}*/}
                        {/*/>*/}
                        <CommonListItemView
                            itemOnpress={() => this._pushCompoent(AdvanceManagerAccountScreen, {})}
                            leftTitle={'意见反馈'}
                            rightType={'next'}
                            rightNextImage={require('../../../../stable/image/ic_app_more.png')}
                            bottomViewHeight={9.6}
                        />
                        <CommonListItemView
                            itemOnpress={() => this._pushCompoent(AboutManagerAccountScreen, {})}
                            leftTitle={'关于我们'}
                            rightType={'next'}
                            rightNextImage={require('../../../../stable/image/ic_app_more.png')}
                            bottomViewHeight={2}
                        />
                        <CommonListItemView
                            itemOnpress={() => this._jumpToCallUs('400-1000-2000')}
                            leftTitle={'服务热线'}
                            rightShowTitle={'400-1000-2000'}
                            rightType={'next'}
                            rootNotTouchable={false}
                            showRightAvator={false}
                            rightShowTitleShowAtRight={true}
                            showRightTextWithBgView={false}
                            bottomViewHeight={9.6}
                        />
                        <CommonListItemView
                            itemOnpress={() => this._pushCompoent(UpdateManagerAccountScreen, {})}
                            leftTitle={'版本更新'}
                            rightType={'next'}
                            rightNextImage={require('../../../../stable/image/ic_app_more.png')}
                            bottomViewHeight={9.6}
                        />
                        <CommonListItemView
                            itemOnpress={() => this._inquiryIsSureNeedExit()}
                            leftTitle={'退出登录'}
                            rightType={'next'}
                            rightNextImage={require('../../../../stable/image/ic_app_more.png')}
                            bottomViewHeight={2}
                        />
                    </View>
                </ScrollView>

            </View>
        );
    };
}


MyManagerAccountScreenStyles = StyleSheet.create({
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
    function_list_container: {
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FBFBFB',
    },
});