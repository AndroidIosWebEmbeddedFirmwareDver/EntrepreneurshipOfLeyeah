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
    FlatList,
} from 'react-native';

const {
    width,
    height
} = Dimensions.get('window');


import ToastManager from '../../../../../../../utils/toast/Toast.util'
import NetworkCommonUtil from '../../../../../../../utils/network.common.util'
import UserDataManager from '../../../../../../../utils/storage/user.data.manager.common.util'
import CommonListItemView from '../../../../../../views/common/common.list.item.view'
import DialogManagerUtil from '../../../../../../views/dialog/dialog.manager.util'
import ImagePickerCommonUtil from '../../../../../../../utils/image.picker.common'
import HeaderCommonView from '../../../../../../views/header/header.common.view'

import RnaEditActivityImageItem from './RnaEditActivityImageItem'
import RnaEditActivityInputItem from './RnaEditActivityInputItem'


export default class RnaCompanyFragment extends PureComponent {
    //1.
    constructor(props) {
        super(props);
        this.state = {
            userName: '',
            userIdCardNo: '',
            userPhoneNo: '',
            userCallPhoneNo: '',
            verfiCode: '',
            userIdCardFontImageUrl: null,
            userIdCardBackImageUrl: null,
            userSkillBookFontImageUrl: null,
            userSkillBookBackImageUrl: null,
        };
    }


    //2.
    componentWillMount() {
        if (this.props.mobileUserData && this.props.mobileUserData.data && this.props.mobileUserData.data.phone) {
            this.setState({
                userPhoneNo: this.props.mobileUserData.data.phone,
            });
        }
        if (this.props.mobileUserData && this.props.mobileUserData.data && this.props.mobileUserData.data.name) {
            this.setState({
                userName: this.props.mobileUserData.data.name,
            });
        }
    }

    //3.
    componentDidMount() {
    }

    //上传照片----------------------------------------------------------------------
    uploadImage = (key, image) => {
        DialogManagerUtil.showNormalLoadingDialog();
        NetworkCommonUtil.httpUpLoadSingleBase64Image(image, NetworkCommonUtil.SERVERURL_POST_IMAGE_UPLOAD_BASE64).then((val: any) => {
            DialogManagerUtil.hide();
            if (val && val.data && val.data.code === NetworkCommonUtil.SERVER_HTTP_TASK_STATUS_SUCCESS) {
                switch (key) {
                    case 0:
                        this.setState({
                            userIdCardFontImageUrl: val.data.msg,
                        });
                        break;
                    case 1:
                        this.setState({
                            userIdCardBackImageUrl: val.data.msg,
                        });
                        break;

                    case 2:
                        this.setState({
                            userSkillBookFontImageUrl: val.data.msg,
                        });
                        break;
                }
            } else if (val) {
                ToastManager.show(JSON.stringify(val) + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            } else {
                ToastManager.show('请求网络出错' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            }

        });
    };

    _onLeftPress = (showTitle, itemKey) => {

        DialogManagerUtil.showNormalChoiceDialog(showTitle, [
            {
                key: 0,
                itemShow: '拍照',
                itemOnpressCllback: () => this._onLeftPressChoiceCallback(0, itemKey)
            },
            {
                key: 1,
                itemShow: '从相册选择',
                itemOnpressCllback: () => this._onLeftPressChoiceCallback(1, itemKey)
            },
        ]);
        // DialogManagerUtil.showNormalLoadingDialog();
    };
    _onLeftPressChoiceCallback = (item, key) => {
        if (item === 0) {
            ImagePickerCommonUtil.requestCamera(true, 200, 200, true).then(image => {
                this.uploadImage(key, image);
            });
        } else {
            ImagePickerCommonUtil.requestPhoto(true, 200, 200, true).then(image => {
                this.uploadImage(key, image);
            });
        }
    };
    //输入----------------------------------------------------------------------

    _onInputParamsChange = (tag, text) => {
        if (tag === 'userName') {
            this.setState({
                userName: text,
            });
        } else if (tag === 'userIdCardNo') {
            this.setState({
                userIdCardNo: text,
            });
        } else if (tag === 'userCallPhoneNo') {
            this.setState({
                userCallPhoneNo: text,
            });
        } else if (tag === 'verfiCode') {
            this.setState({
                verfiCode: text,
            });
        }
    };

    //验证码----------------------------------------------------------------------
    _GetNetVerCode = () => {
        if (!this.state.userPhoneNo) {
            ToastManager.show('请输入手机号', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            return;
        }
        if (this.state.userPhoneNo.length !== 11) {
            ToastManager.show('手机号应该是11位数字', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            return;
        }

        DialogManagerUtil.showNormalLoadingDialog();
        if (this._commonListItemView_of_verfiCode) {
            this._commonListItemView_of_verfiCode._startRightInputAction();
        }
        let params = {
            userPhoneNo: this.state.userPhoneNo,
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
            DialogManagerUtil.hide();
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
            phone: this.state.userPhoneNo,
            smsCode: this.state.verfiCode,
            smsTag: this.state.smsTag,
        };
        if (this.state.verfiCode === '8888') {
            //后门模式
            params = {
                phone: this.state.userPhoneNo,
                smsCode: '8888',
                smsTag: 'debug',
            };
        }
        NetworkCommonUtil.httpPostRequest(JSON.stringify(params), NetworkCommonUtil.SERVERURL_POST_SMS_SEND_VERFI_VALIDCODE).then((val: any) => {
            DialogManagerUtil.hide();
            if (val && val.code === NetworkCommonUtil.SERVER_HTTP_TASK_STATUS_SUCCESS) {
                this._uploadRnaOrder();
            } else if (val) {
                ToastManager.show(val.msg + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            } else {
                ToastManager.show('请求网络出错' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            }
        });
    };

    //提交资料----------------------------------------------------------------------
    _uploadRnaOrder = () => {

        if (!this.state.userName || this.state.userName.length <= 0) {
            ToastManager.show('请输入姓名' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            return;
        }
        if (!this.state.userIdCardNo || this.state.userIdCardNo.length <= 0) {
            ToastManager.show('请输入统一代码' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            return;
        }
        if (!this.state.userCallPhoneNo || this.state.userCallPhoneNo.length <= 0) {
            ToastManager.show('请输入联系电话' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            return;
        }
        if (!this.state.userPhoneNo || this.state.userPhoneNo.length <= 0) {
            ToastManager.show('请输入手机号' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            return;
        }
        if (!this.state.userIdCardFontImageUrl || this.state.userIdCardFontImageUrl.length <= 0) {
            ToastManager.show('上传营业执照正面照' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            return;
        }

        DialogManagerUtil.showNormalLoadingDialog();
        let params = {
            userId: this.props.mobileUserData.data.id,
            typeId: this.props.mobileUserData.data.typeId,
            typeName: this.props.mobileUserData.data.typeName,
            userName: this.state.userName,
            userIdCardNo: this.state.userIdCardNo,
            userCallPhoneNo: this.state.userCallPhoneNo,
            userPhoneNo: this.state.userPhoneNo,
            userIdCardFontImageUrl: this.state.userIdCardFontImageUrl,
            userIdCardBackImageUrl: this.state.userIdCardBackImageUrl,
            userSkillBookFontImageUrl: this.state.userSkillBookFontImageUrl,
            userSkillBookBackImageUrl: this.state.userSkillBookBackImageUrl,
        };
        NetworkCommonUtil.httpPostRequest(JSON.stringify(params), NetworkCommonUtil.SERVERURL_API_MOBILE_USER_RNA_CREATE).then((val: any) => {
            DialogManagerUtil.hide();
            // alert(JSON.stringify(val));
            if (val && val.code === NetworkCommonUtil.SERVER_HTTP_TASK_STATUS_SUCCESS) {
                // ToastManager.show(val.msg + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
                this._onRnaChangeSuccessCallback(params, val.data.state);
            } else if (val) {
                ToastManager.show(val.msg + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            } else {
                ToastManager.show('请求网络出错' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            }
        });
    };


    _onRnaChangeSuccessCallback = (params, status) => {
        UserDataManager.getInstance().saveForRnaOrderParams(params, status).then(saveToMap => {
            if (this.props.onRnaChangeSuccessCallback) {
                this.props.onRnaChangeSuccessCallback(status);
            }
        });
    };

    render() {
        return (

            <ScrollView style={RnaCompanyFragmentStyles.function_list}
                        keyboardShouldPersistTaps={'always'}
                        contentContainerStyle={RnaCompanyFragmentStyles.function_list_contentContainer}
            >
                <View style={RnaCompanyFragmentStyles.function_list_container}>
                    <View style={{height: 10, backgroundColor: 'transparent',}}/>

                    <RnaEditActivityInputItem showTag={'基本资料'}
                                              showRight={true}
                                              rightType={'text'}
                                              righShowClolr={'#FC333D'}
                                              showRightTag={'(必填)'}
                                              bgColors={'transparent'}
                    />
                    <CommonListItemView
                        rootNotTouchable={true}
                        leftTitle={'公司名称'}
                        rightType={'input'}
                        onInputParamsChange={(text) => this._onInputParamsChange('userName', text)}
                        keyboardTypeIn={'default'}
                        rightInputAutoFocus={true}
                        rightShowTitleShowAtRight={true}
                        rightInputPlaceholder={this.props.mobileUserData && this.props.mobileUserData.data && this.props.mobileUserData.data.name ? this.props.mobileUserData.data.name : '请输入真实姓名'}
                        showRightTextWithBgView={false}
                        bottomViewHeight={2}
                    />


                    <CommonListItemView
                        rootNotTouchable={true}
                        leftTitle={'统一代码'}
                        rightType={'input'}
                        onInputParamsChange={(text) => this._onInputParamsChange('userIdCardNo', text)}
                        keyboardTypeIn={'numeric'}
                        rightInputAutoFocus={false}
                        rightShowTitleShowAtRight={true}
                        rightInputPlaceholder={'请输入公司统一代码'}
                        showRightTextWithBgView={false}
                        bottomViewHeight={2}
                    />

                    <CommonListItemView
                        rootNotTouchable={true}
                        leftTitle={'联系电话'}
                        rightType={'input'}
                        onInputParamsChange={(text) => this._onInputParamsChange('userCallPhoneNo', text)}
                        keyboardTypeIn={'numeric'}
                        rightInputAutoFocus={false}
                        rightShowTitleShowAtRight={true}
                        rightInputPlaceholder={this.props.mobileUserData && this.props.mobileUserData.data && this.props.mobileUserData.data.callPhone ? this.props.mobileUserData.data.callPhone : '请输入联系电话'}
                        showRightTextWithBgView={false}
                        bottomViewHeight={2}
                    />


                    <CommonListItemView
                        rootNotTouchable={true}
                        leftTitle={'手机号码'}
                        rightShowTitle={this.props.mobileUserData && this.props.mobileUserData.data && this.props.mobileUserData.data.phone ? this.props.mobileUserData.data.phone : '请输入手机号码'}
                        rightShowTitleShowAtRight={false}
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
                        rightInputAutoFocus={false}
                        rightShowTitleShowAtRight={true}
                        rightInputPlaceholder={'请输入验证码'}
                        showRightTextWithBgView={false}
                        rightInputActionShow={'获取验证码'}
                        rightInputActionOnpress={() => this._GetNetVerCode()}
                        bottomViewHeight={2}
                    />

                    <RnaEditActivityInputItem showTag={'上传营业执照'}
                                              showRight={true}
                                              rightType={'text'}
                                              righShowClolr={'#FC333D'}
                                              showRightTag={'(必填)'}
                                              bgColors={'transparent'}
                    />
                    <RnaEditActivityImageItem leftItemShow={'请拍摄营业执照正面'}
                                              leftImage={
                                                  this.state.userIdCardFontImageUrl ? {uri: this.state.userIdCardFontImageUrl} :
                                                      require('../../../../../../../stable/image/main/rna/ic_rna_a.png')}
                                              onLeftPress={() => this._onLeftPress('上传营业执照正面照', 0)}
                                              showRight={true}
                                              rightItemShow={'示例'}
                                              rightShowColor={'#FC333D'}
                                              rightImage={require('../../../../../../../stable/image/main/rna/ic_rna_b.png')}
                                              bgColors={'#FFFFFF'}
                    />

                </View>
            </ScrollView>
        );
    };
}


RnaCompanyFragmentStyles = StyleSheet.create({
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
    function_list_item_container: {
        flex: 1,
        height: 56,
        flexDirection: 'row',//row ,row-reverse ,column ('default') column-reverse
        justifyContent: 'flex-start',
        alignItems: 'center',
        paddingLeft: 9.6,
        paddingRight: 9.6,
    },
    btn_style_full: {
        flex: 1,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        height: 44,
        backgroundColor: '#FFCC33',
        justifyContent: 'center',
        alignItems: 'center',
        borderRadius: 4.8,
        borderColor: '#FFCC33',
        borderWidth: 2,
        margin: 9.6,
    },
    normal_text: {
        fontSize: 16,
        color: '#000000',
    }
});