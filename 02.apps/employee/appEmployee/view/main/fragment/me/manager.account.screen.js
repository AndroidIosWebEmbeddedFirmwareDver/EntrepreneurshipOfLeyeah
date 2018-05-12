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
import NetworkCommonUtil from '../../../../utils/network.common.util'
import CommonListItemView from '../../../views/common/common.list.item.view'

import HeaderCommonView from '../../../views/header/header.common.view'

import UseManagerAccountActivity from './manager/use.manager.account.screen'
import AdvanceManagerAccountActivity from './manager/advance.manager.account.screen'
import AboutManagerAccountActivity from './manager/about.manager.account.screen'
import UpdateManagerAccountActivity from './manager/update.manager.account.screen'
import BaseActivity from "../../../views/base.activity";


export default class ManagerAccountActivity extends BaseActivity {

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
        ToastManager.alertDialog('提示', '是否确定退出?', '取消', () => {
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


    render() {
        return (
            <View style={ManagerAccountActivityStyles.container}>
                <HeaderCommonView navigator={this.props.navigator}
                                  bgColor={'#FFCC33'}
                                  headerLeftShow={true}
                                  headerCenterShow={true}
                                  headerRightShow={false}
                                  showCenterAfterLeft={true}
                                  headerCenterTitle={'账号设置'}/>
                <ScrollView style={ManagerAccountActivityStyles.function_list}>
                    <View style={ManagerAccountActivityStyles.function_list_container}>
                        <View style={{height: 10, backgroundColor: 'transparent',}}/>

                        {/*<CommonListItemView*/}
                        {/*itemOnpress={() => this._pushCompoent(UseManagerAccountActivity, {})}*/}
                        {/*leftTitle={'使用说明'}*/}
                        {/*rightType={'next'}*/}
                        {/*rightNextImage={require('../../../../stable/image/ic_app_more.png')}*/}
                        {/*bottomViewHeight={2}*/}
                        {/*/>*/}
                        <CommonListItemView
                            itemOnpress={() => this._pushCompoent(AdvanceManagerAccountActivity, {})}
                            leftTitle={'意见反馈'}
                            rightType={'next'}
                            rightNextImage={require('../../../../stable/image/ic_app_more.png')}
                            bottomViewHeight={9.6}
                        />
                        <CommonListItemView
                            itemOnpress={() => this._pushCompoent(AboutManagerAccountActivity, {})}
                            leftTitle={'关于我们'}
                            rightType={'next'}
                            rightNextImage={require('../../../../stable/image/ic_app_more.png')}
                            bottomViewHeight={2}
                        />
                        <CommonListItemView
                            itemOnpress={() => this._pushCompoent(UpdateManagerAccountActivity, {})}
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


ManagerAccountActivityStyles = StyleSheet.create({
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
    function_list_container: {
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FBFBFB',
    },
});