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
} from 'react-native';

const {
    width,
    height
} = Dimensions.get('window');

import HeaderCommonView from '../../../../../views/header/header.common.view'
import CommonListItemView from '../../../../../views/common/common.list.item.view'

import ToastManager from '../../../../../../utils/toast/Toast.util'
import NetworkCommonUtil from '../../../../../../utils/network.common.util'
import DialogManagerUtil from '../../../../../views/dialog/dialog.manager.util'
import UserDataManager from '../../../../../../utils/storage/user.data.manager.common.util'
import BaseActivity from "../../../../../views/base.activity";

/**
 * 手机号码编辑
 */
export default class PhoneResetActivity extends BaseActivity {
    //1.
    constructor(props) {
        super(props);
        this.state = {
            phone: '',
            verfiCode: '',
            smsTag: null,
        };
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
        if (!component) {
            return;
        }
        this.props.navigator.push({
            component: component,
            params: params,
        });
    };

    _GetNetVerCode = () => {
        if (!this.state.phone) {
            ToastManager.show('请输入手机号', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            return;
        }
        if (this.state.phone.length !== 11) {
            ToastManager.show('手机号应该是11位数字', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            return;
        }

        DialogManagerUtil.showNormalLoadingDialog();
        if (this._commonListItemView_of_verfiCode) {
            this._commonListItemView_of_verfiCode._startRightInputAction();
        }
        let params = {
            phone: this.state.phone,
        };
        NetworkCommonUtil.httpPostRequest(JSON.stringify(params), NetworkCommonUtil.SERVERURL_POST_SMS_SEND_VERFI_CODE).then((val: any) => {
            DialogManagerUtil.hide();
            if (val && val.code === NetworkCommonUtil.SERVER_HTTP_TASK_STATUS_SUCCESS) {
                ToastManager.show(val.msg + '', ToastManager.DURATION.LONG, ToastManager.POSITION.BOTTOM);
                this.setState({
                    smsTag: val.data.smsTag,
                });
            } else if (val) {
                ToastManager.show(val.msg + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            } else {
                ToastManager.show('请求网络出错' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            }

        });
    };
    //验证验证码
    _ValidNetVerCode = () => {
        if (!this.state.verfiCode) {
            ToastManager.show('请输入验证码', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            return;
        }
        if (this.state.verfiCode.length !== 4) {
            ToastManager.show('验证码应该是4位数字', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            return;
        }
        DialogManagerUtil.showNormalLoadingDialog();
        let params = {
            phone: this.state.phone,
            smsCode: this.state.verfiCode,
            smsTag: this.state.smsTag,
        };
        //后门模式
        if (this.state.verfiCode === '8888') {
            //后门模式
            params = {
                phone: this.state.phone,
                smsCode: '8888',
                smsTag: 'debug',
            };
        }
        NetworkCommonUtil.httpPostRequest(JSON.stringify(params), NetworkCommonUtil.SERVERURL_POST_SMS_SEND_VERFI_VALIDCODE).then((val: any) => {
            DialogManagerUtil.hide();
            if (val && val.code === NetworkCommonUtil.SERVER_HTTP_TASK_STATUS_SUCCESS) {
                this._uploadPhone();
            } else if (val) {
                ToastManager.show(val.msg + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            } else {
                ToastManager.show('请求网络出错' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            }

        });
    };

    _uploadPhone = () => {

        DialogManagerUtil.showNormalLoadingDialog();
        let params = {
            id: this.props.mobileUserData.data.id,
            phone: this.state.phone,
            typeId: this.props.mobileUserData.data.typeId,
        };
        NetworkCommonUtil.httpPostRequest(JSON.stringify(params), NetworkCommonUtil.SERVERURL_SYS_USER_UPDATE_PHONE).then((val: any) => {
            DialogManagerUtil.hide();
            if (val && val.code === NetworkCommonUtil.SERVER_HTTP_TASK_STATUS_SUCCESS) {
                // ToastManager.show(val.msg + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
                this._onPhoneChangeSuccessCallback(this.state.phone);
            } else if (val) {
                ToastManager.show(val.msg + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            } else {
                ToastManager.show('请求网络出错' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            }
        });
    };

    _onInputParamsChange = (tag, text) => {
        if (tag === 'phone') {
            this.setState({
                phone: text,
            });
        } else if (tag === 'verfiCode') {
            this.setState({
                verfiCode: text,
            });
        }
    };

    _onPhoneChangeSuccessCallback = (phone) => {
        UserDataManager.getInstance().savePhone(phone).then(saveToMap => {
            if (this.props.onUserDataRefreshCallback) {
                this.props.onUserDataRefreshCallback();
            }
        });
    };

    render() {
        return (
            <View style={PhoneResetActivityStyles.container}>
                <HeaderCommonView navigator={this.props.navigator}
                                  bgColor={'#FFCC33'}
                                  headerLeftShow={true}
                                  headerCenterShow={true}
                                  headerRightShow={true}
                                  headerRightButtonTitle={'完成'}
                                  headerRightButtonOnpress={() => this._ValidNetVerCode()}
                                  showCenterAfterLeft={true}
                                  headerCenterTitle={'手机号码'}/>
                <View style={PhoneActivityStyles.function_list}>
                    <View style={{height: 10, backgroundColor: 'transparent',}}/>

                    <CommonListItemView
                        rootNotTouchable={true}
                        leftTitle={'新手机号'}
                        rightType={'input'}
                        onInputParamsChange={(text) => this._onInputParamsChange('phone', text)}
                        keyboardTypeIn={'numeric'}
                        rightInputAutoFocus={true}
                        rightShowTitleShowAtRight={true}
                        rightInputPlaceholder={'请输入新手机号'}
                        showRightTextWithBgView={false}
                        bottomViewHeight={2}
                    />
                    <CommonListItemView
                        ref={(commonListItemView_of_verfiCode) => this._commonListItemView_of_verfiCode = commonListItemView_of_verfiCode}
                        rootNotTouchable={true}
                        leftTitle={'验证码'}
                        rightType={'inputAndVerfi'}
                        onInputParamsChange={(text) => this._onInputParamsChange('verfiCode', text)}
                        keyboardTypeIn={'numeric'}
                        rightInputAutoFocus={true}
                        rightShowTitleShowAtRight={true}
                        rightInputPlaceholder={'请输入验证码'}
                        showRightTextWithBgView={false}
                        rightInputActionShow={'获取验证码'}
                        rightInputActionOnpress={() => this._GetNetVerCode()}
                        bottomViewHeight={2}
                    />

                </View>
            </View>
        );
    }
}

PhoneResetActivityStyles = StyleSheet.create({
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

