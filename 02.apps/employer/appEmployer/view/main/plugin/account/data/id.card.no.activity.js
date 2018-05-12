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

import HeaderCommonView from '../../../../views/header/header.common.view'
import CommonListItemView from '../../../../views/common/common.list.item.view'

import ToastManager from '../../../../../utils/toast/Toast.util'
import NetworkCommonUtil from '../../../../../utils/network.common.util'
import DialogManagerUtil from '../../../../views/dialog/dialog.manager.util'
import UserDataManager from '../../../../../utils/storage/user.data.manager.common.util'
import BaseActivity from "../../../../views/base.activity";


export default class IdCardNoActivity extends BaseActivity {
    //1.
    constructor(props) {
        super(props);
        this.state = {
            nameText: null,
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


    _uploadName = () => {
        if (!this.state.nameText) {
            ToastManager.show('请输入', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            return;
        }
        if (this.state.nameText.length > 24) {
            ToastManager.show('不能超过24个字', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            return;
        }

        DialogManagerUtil.showNormalLoadingDialog();
        let params = {
            id: this.props.mobileUserData.data.id,
            typeId: this.props.mobileUserData.data.typeId,
            rnaOrder: {
                userId: this.props.mobileUserData.data.id,
                userIdCardNo: this.state.nameText,
            }
        };
        NetworkCommonUtil.httpPostRequest(JSON.stringify(params), NetworkCommonUtil.SERVERURL_SYS_USER_EMPLOYER_UPDATE_IDCARDNO).then((val: any) => {

            if (val && val.code === NetworkCommonUtil.SERVER_HTTP_TASK_STATUS_SUCCESS) {
                // ToastManager.show(val.msg + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
                if (val.data) {
                    this._onNameChangeSuccessCallback(params.rnaOrder.userIdCardNo);
                }
            } else if (val) {
                ToastManager.show(val.msg + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            } else {
                ToastManager.show('请求网络出错' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            }
            DialogManagerUtil.hide();
        });
    };

    _onInputParamsChange = (text) => {
        this.setState({
            nameText: text,
        });
    };

    _onNameChangeSuccessCallback = (userIdCardNo) => {
        UserDataManager.getInstance().saveRrnaOrderOfUserIdCardNo(userIdCardNo).then(saveToMap => {
            if (this.props.onUserDataRefreshCallback) {
                this.props.onUserDataRefreshCallback();
            }
            if (this.props.navigator) {
                this.props.navigator.pop();
            }
        });
    };

    render() {
        return (
            <View style={IdCardNoActivityStyles.container}>
                <HeaderCommonView navigator={this.props.navigator}
                                  bgColor={'#FFCC33'}
                                  headerLeftShow={true}
                                  headerCenterShow={true}
                                  headerRightShow={true}
                                  headerRightButtonTitle={'完成'}
                                  headerRightButtonOnpress={() => this._uploadName()}
                                  showCenterAfterLeft={true}
                                  headerCenterTitle={'统一代码'}/>
                <View style={IdCardNoActivityStyles.function_list}>
                    <View style={{height: 10, backgroundColor: 'transparent',}}/>
                    <View style={[IdCardNoActivityStyles.function_list_item, {}]}>
                        <TextInput style={[IdCardNoActivityStyles.function_list_item_view, {
                            margin: 9.6,
                            padding: 0,
                        }]}
                                   underlineColorAndroid="transparent"
                                   placeholder={this.props.mobileUserData && this.props.mobileUserData.data &&
                                   this.props.mobileUserData.data.rnaOrder && this.props.mobileUserData.data.rnaOrder.userIdCardNo ? this.props.mobileUserData.data.rnaOrder.userIdCardNo : ''
                                   }
                                   onChangeText={(text) => this._onInputParamsChange(text)}
                                   clearButtonMode={'while-editing'}
                                   keyboardType={'default'}
                                   autoFocus={true}
                        />
                    </View>
                </View>
            </View>
        );
    }
}

IdCardNoActivityStyles = StyleSheet.create({
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