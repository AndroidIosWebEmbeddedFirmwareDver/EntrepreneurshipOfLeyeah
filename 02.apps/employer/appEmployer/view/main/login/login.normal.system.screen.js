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
    TextInput,
    FlatList,
    StyleSheet,
    Dimensions,
    ActivityIndicator,
    TouchableOpacity,
} from 'react-native';


import HeaderCommonView from '../../views/header/header.common.view'
import NetworkCommonUtil from '../../../utils/network.common.util'
import UserDataManager from '../../../utils/storage/user.data.manager.common.util'
import AsyncstorageKeyCommonUtil from '../../../utils/storage/asyncstorage.key.common.util'
import ToastManager from '../../../utils/toast/Toast.util'
import DialogManagerUtil from '../../views/dialog/dialog.manager.util'
import LoginUserProtocolSystemScreen from './login.user.protocol.system.screen'
import BaseActivity from "../../views/base.activity";


const codeTime = 60;

export default class LoginNormalSystemScreen extends BaseActivity {
    constructor(props) {
        super(props);
        this.state = {
            phone: '',
            verfiCode: '',
            smsTag: null,
            timerCount: codeTime,
            rightInputActionShow: null,
            rightInputActionTitle: '获取验证码',
        };
    }

    //2.
    componentWillMount() {
        super.componentWillMount();
    }

    //3.
    componentDidMount() {
        super.componentDidMount();
        // InteractionManager.runAfterInteractions(() => {
        //     //处理消耗时间和性能的任务，把主线程让出来加载UI
        //     this.initQueryProvinceData();
        // });
    }

    //4.
    componentWillUnmount() {
        super.componentWillUnmount();
        //当组件要被从界面上移除的时候，就会调用componentWillUnmount(),在这个函数中，可以做一些组件相关的清理工作，例如取消计时器、网络请求等
        this._stopInterval();
    }


    _startInterval = () => {
        this.interval = setInterval(() => {
            const timer = this.state.timerCount - 1;
            if (timer === 0) {
                this.interval && clearInterval(this.interval);
                this.setState({
                    timerCount: codeTime,
                    rightInputActionShow: null,
                    rightInputActionTitle: '重新获取',
                })
            } else {
                this.setState({
                    timerCount: timer,
                    rightInputActionShow: timer + 's',
                })
            }

        }, 1000);

    };

    _stopInterval = () => {
        if (this.interval) {
            clearInterval(this.interval);
        }
    };
    //、、、、、、、、、


    //获取验证码
    _GetNetVerCode = () => {
        if (!this.state.phone) {
            ToastManager.show('请输入手机号', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            return;
        }
        if (this.state.phone.length !== 11) {
            ToastManager.show('手机号应该是11位数字', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            return;
        }
        this._startInterval();
        let params = {
            phone: this.state.phone,
        };
        NetworkCommonUtil.httpPostRequest(JSON.stringify(params), NetworkCommonUtil.SERVERURL_POST_SMS_SEND_VERFI_CODE).then((val: any) => {
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
    _jumpNextStep = () => {
        if (!this.state.phone) {
            ToastManager.show('请输入手机号', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            return;
        }
        if (this.state.phone.length !== 11) {
            ToastManager.show('手机号应该是11位数字', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            return;
        }
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
                this._netWorkLogin();
            } else if (val) {
                ToastManager.show(val.msg + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            } else {
                ToastManager.show('请求网络出错' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            }
        });
    };

    //登录
    _netWorkLogin = () => {
        if (!this.state.phone) {
            ToastManager.show('请输入手机号', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            return;
        }
        if (this.state.phone.length !== 11) {
            ToastManager.show('手机号应该是11位数字', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            return;
        }
        DialogManagerUtil.showNormalLoadingDialog();
        let params = {
            phone: this.state.phone,
            typeId: AsyncstorageKeyCommonUtil.LOGINKEYID.appType,
            typeName: AsyncstorageKeyCommonUtil.LOGINKEYID.appTypeName,
        };
        NetworkCommonUtil.httpPostRequest(JSON.stringify(params), NetworkCommonUtil.SERVERURL_SYS_USER_LOGIN).then((val: any) => {
            DialogManagerUtil.hide();
            if (val && val.code === NetworkCommonUtil.SERVER_HTTP_TASK_STATUS_SUCCESS) {
                this._backToSuccess(val)
            } else if (val) {
                // alert(JSON.stringify(val));
                ToastManager.alertWithSure('提示', val.msg, () => {
                });
            } else {
                ToastManager.show('请求网络出错' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            }
        });
    };

    _backToSuccess = (val) => {
        UserDataManager.getInstance().saveAll(val).then(saveToMap => {
            // this.props.navigator.pop();
            if (this.props.onSuccess) {
                this.props.onSuccess();
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

    render() {
        const {navigator} = this.props.navigator;

        return (
            <View style={LoginNormalSystemScreenStyles.root}>
                <HeaderCommonView navigator={this.props.navigator}
                                  headerLeftShow={true}
                                  headerCenterShow={false}
                                  headerRightShow={false}/>
                {/*<ScrollView>*/}
                <View style={LoginNormalSystemScreenStyles.container}>
                    <View style={LoginNormalSystemScreenStyles.itemHeadContainer_style_normal}>
                        <View
                            style={LoginNormalSystemScreenStyles.itemHeadContainer_style_head_view}>
                            <Text
                                style={LoginNormalSystemScreenStyles.commonText_big}>进入乐业雇主端</Text>
                            <Image
                                source={require('../../../stable/image/app_a.png')}
                                style={{
                                    width: 48,
                                    height: 48,
                                    borderRadius: 48 / 2,
                                    borderColor: '#F0F0F0',
                                    borderWidth: (Platform.OS === 'ios' ? 3.0 : 3.5) / PixelRatio.get(),
                                }}
                            />
                        </View>

                    </View>


                    <View style={LoginNormalSystemScreenStyles.itemHeadContainer_style_normal}>
                        <TextInput
                            style={[LoginNormalSystemScreenStyles.itemHeadContainer_style_view, {
                                padding: 0,
                            }]}
                            underlineColorAndroid="transparent"
                            placeholder={'请在此输入手机号'}
                            onChangeText={(text) => this._onInputParamsChange('phone', text)}
                            clearButtonMode={'while-editing'}
                            keyboardType={'numeric'}
                            autoFocus={false}
                        />
                    </View>
                    <View style={LoginNormalSystemScreenStyles.itemHeadContainer_style_view_line}/>

                    <View style={LoginNormalSystemScreenStyles.itemHeadContainer_style_normal}>
                        <TextInput
                            style={[LoginNormalSystemScreenStyles.itemHeadContainer_style_view, {
                                padding: 0,
                            }]}
                            underlineColorAndroid="transparent"
                            placeholder={'请在此输入验证码'}
                            onChangeText={(text) => this._onInputParamsChange('verfiCode', text)}
                            clearButtonMode={'while-editing'}
                            keyboardType={'numeric'}
                            autoFocus={false}
                        />
                        {
                            this.state.rightInputActionShow ?
                                <View
                                    style={[LoginNormalSystemScreenStyles.style_border, {backgroundColor: '#FEFEFE'}]}
                                >
                                    <Text>{this.state.rightInputActionShow}</Text>
                                </View>
                                : <TouchableOpacity
                                    style={[LoginNormalSystemScreenStyles.style_border, {}]}
                                    onPress={() => this._GetNetVerCode()}
                                >
                                    <Text>{this.state.rightInputActionTitle}</Text>
                                </TouchableOpacity>
                        }

                        {/*<TouchableOpacity>*/}
                        {/*<Text*/}
                        {/*style={LoginNormalSystemScreenStyles.commonText_normal}>获取验证码</Text>*/}
                        {/*</TouchableOpacity>*/}
                    </View>
                    <View style={LoginNormalSystemScreenStyles.itemHeadContainer_style_view_line}/>

                    <TouchableOpacity
                        style={LoginNormalSystemScreenStyles.itemHeadContainer_style_full}
                        onPress={() => this._jumpNextStep()}
                    >
                        <Text style={LoginNormalSystemScreenStyles.commonText_normal}>登录</Text>
                    </TouchableOpacity>


                    <View style={LoginNormalSystemScreenStyles.itemHeadContainer_style_white}/>
                    <TouchableOpacity
                        style={LoginNormalSystemScreenStyles.itemHeadContainer_style_view_commonText}
                        onPress={() => this._pushCompoent(LoginUserProtocolSystemScreen, {})}
                    >

                        <Text
                            style={LoginNormalSystemScreenStyles.commonText_normal}>登录代表您已阅读并同意《乐业用户协议》</Text>
                    </TouchableOpacity>

                </View>

                {/*</ScrollView>*/}

            </View>
        );
    };
}


LoginNormalSystemScreenStyles = StyleSheet.create({
    //基于flex-box布局
    root: {
        flex: 1,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FBFBFB',
    },
    container: {
        flex: 1,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        width: window.width,
        backgroundColor: '#FFFFFF',
        padding: 9.6,
    },
    itemHeadContainer_style_normal: {
        width: window.width,
        flexDirection: 'row',//row ,row-reverse ,column ('default') column-reverse
        justifyContent: 'center',
        alignItems: 'center',
        marginTop: 19.4,
    },
    itemHeadContainer_style_full: {
        width: window.width,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        height: 44,
        backgroundColor: '#FFCC33',
        justifyContent: 'center',
        alignItems: 'center',
        borderRadius: 4.8,
        borderColor: '#FFCC33',
        borderWidth: 2,
        marginTop: 9.6 * 3,
        padding: 4.8,
    },

    itemHeadContainer_style_white: {
        flex: 1,
        width: window.width,
        flexDirection: 'row',//row ,row-reverse ,column ('default') column-reverse
        justifyContent: 'center',
        alignItems: 'center',
    },

    itemHeadContainer_style_view: {
        flex: 1,
        width: window.width,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        height: 56,

    },
    itemHeadContainer_style_head_view: {
        flex: 1,
        width: window.width,
        justifyContent: 'center',
        alignItems: 'center',
        flexDirection: 'row',//row ,row-reverse ,column ('default') column-reverse
        height: 56,

    },

    itemHeadContainer_style_view_line: {
        height: 1,
        backgroundColor: '#FBFBFB',
        width: window.width,
    },

    itemHeadContainer_style_view_commonText: {
        width: window.width,
        justifyContent: 'center',
        alignItems: 'center',
        marginBottom: 36,
    },
    commonText_big: {
        flex: 1,
        fontSize: 22,
        fontWeight: 'bold',
        // textShadowColor:'#C0C0C0',
        // textShadowRadius:2,
        // textShadowOffset:{width:2,height:2},
    },
    commonText_border: {
        color: '#FFCC33',
        fontSize: 16,
    },
    commonText_normal: {
        fontSize: 16,
    },
    style_border: {
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: 'transparent',
        justifyContent: 'center',
        alignItems: 'center',
        borderRadius: 4.8,
        borderColor: '#FFCC33',
        borderWidth: 2,
        padding: 4.8,
    },

});