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
    height,
    Platform,
} = Dimensions.get('window');


import ToastManager from '../../../../../utils/toast/Toast.util'
import NetworkCommonUtil from '../../../../../utils/network.common.util'
import HeaderCommonView from '../../../../views/header/header.common.view'
import DialogManagerUtil from '../../../../views/dialog/dialog.manager.util'
import ImagePickerCommonUtil from '../../../../../utils/image.picker.common'
import PatterCommonUtil from '../../../../../utils/patter/patter.common.util'
import CommonListItemView from '../../../../views/common/common.list.item.view'
import UserDataManager from '../../../../../utils/storage/user.data.manager.common.util'
import BaseActivity from "../../../../views/base.activity";


class RnaEditActivityInputItem extends BaseActivity {
    //1.
    constructor(props) {
        super(props);
        this.state = {
            flag: null,
        };
    }

    //2.
    componentWillMount() {
        super.componentWillMount();
        this.setState({
            flag: this.props.flag,
        });
    }

    //3.
    componentDidMount() {
        super.componentDidMount();
    }

    //4.
    componentWillUnmount() {
        super.componentWillUnmount();
    }

    _onInputParamsChange = (text, flag) => {

    };

    render() {
        return (
            <View style={[{
                flexDirection: 'column',
                flex: 1,
                height: 56,
            }, this.props.bgColors ? {backgroundColor: this.props.bgColors} : {}]}>
                {
                    this.props.showRight ? this.props.rightType === 'text' ?
                        <View style={RnaEditMsgActivityStyles.function_list_item_container}>
                            <Text
                                style={[RnaEditMsgActivityStyles.normal_text, {
                                    color: '#666666',
                                    fontSize: 14,
                                }]}>
                                {this.props.showTag}
                            </Text>
                            <Text
                                style={[RnaEditMsgActivityStyles.normal_text, this.props.righShowClolr ? {color: this.props.righShowClolr} : {}, {fontSize: 14,}]}>
                                {this.props.showRightTag}
                            </Text>
                        </View>
                        :
                        <View style={RnaEditMsgActivityStyles.function_list_item_container}>
                            <Text
                                style={[RnaEditMsgActivityStyles.normal_text, {flex: 1,}, {fontSize: 14,}]}>
                                {this.props.showTag}
                            </Text>
                            <TextInput style={[RnaEditMsgActivityStyles.normal_text, {
                                flex: 3,
                            }, {fontSize: 14,}]}
                                       placeholder={this.props.placeholderShow}
                                       onChangeText={(text) => this._onInputParamsChange(text, this.state.flag)}
                                       clearButtonMode={'while-editing'}
                                       keyboardType={this.props.keyboardTypeIn}
                            />
                        </View>
                        : <View/>
                }
                {
                    this.props.showCutLine ?
                        <View style={{height: 2, backgroundColor: '#FBFBFB'}}/> : <View/>
                }

            </View>
        );
    }

}

class RnaEditActivityImageItem extends PureComponent {
    //1.
    constructor(props) {
        super(props);
        this.state = {
            flag: null,
        };
    }

    //2.
    componentWillMount() {
        this.setState({
            flag: this.props.flag,
        });
    }

    //3.
    componentDidMount() {
    }

    _onInputParamsChange = (text, flag) => {

    };

    render() {
        return (
            <View
                style={[RnaEditMsgActivityStyles.function_list_item_container, {
                    flexDirection: 'row',
                    height: 120,
                    alignItems: 'center',
                }, this.props.bgColors ? {backgroundColor: this.props.bgColors} : {}]}>
                <TouchableOpacity
                    style={{
                        flex: 1,
                        alignItems: 'center',
                        justifyContent: 'center',
                        padding: 9.6,
                    }}
                    onPress={this.props.onLeftPress}
                >
                    <Image
                        source={this.props.leftImage ? this.props.leftImage : require('../../../../../stable/image/shareqrcode.png')}
                        style={{
                            width: (width - 9.6 * 6) / 2,
                            height: 72,
                            resizeMode: 'center',
                        }}
                    />
                    <Text
                        style={[RnaEditMsgActivityStyles.normal_text, {marginTop: 9.6}, {fontSize: 14,}]}>{this.props.leftItemShow}</Text>
                </TouchableOpacity>

                {
                    this.props.showRight ?
                        <View
                            style={{
                                flex: 1,
                                alignItems: 'center',
                                justifyContent: 'center',
                                padding: 9.6,
                            }}
                        >
                            <Image
                                source={this.props.rightImage ? this.props.rightImage : require('../../../../../stable/image/shareqrcode.png')}
                                style={{
                                    width: (width - 9.6 * 6) / 2,
                                    height: 72,
                                    resizeMode: 'center',
                                }}
                            />
                            <Text
                                style={[RnaEditMsgActivityStyles.normal_text, {marginTop: 9.6}, this.props.rightShowColor ? {color: this.props.rightShowColor} : {}, {fontSize: 14,}]}>{this.props.rightItemShow}</Text>
                        </View>
                        : <View style={{
                            flex: 1,
                            alignItems: 'center',
                            justifyContent: 'center',
                            padding: 9.6,
                        }}/>
                }

            </View>
        );
    }

}


export default class RnaEditMsgActivity extends PureComponent {
    //1.
    constructor(props) {
        super(props);
        this.state = {
            userIdCardFontImage: null,
            userIdCardBackImage: null,
            userSkillBookFontImage: null,
            userSkillBookBackImage: null,

            userName: '',
            userIdCardNo: '',
            userPhoneNo: '',
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
                switch (key) {
                    case 0:
                        this.setState({
                            userIdCardFontImage: image,
                        });
                        break;
                    case 1:
                        this.setState({
                            userIdCardBackImage: image,
                        });
                        break;

                    case 2:
                        this.setState({
                            userSkillBookFontImage: image,
                        });
                        break;
                }
            });
        } else {
            ImagePickerCommonUtil.requestPhoto(true, 200, 200, true).then(image => {

                this.uploadImage(key, image);
                switch (key) {
                    case 0:
                        this.setState({
                            userIdCardFontImage: image,
                        });
                        break;
                    case 1:
                        this.setState({
                            userIdCardBackImage: image,
                        });
                        break;

                    case 2:
                        this.setState({
                            userSkillBookFontImage: image,
                        });
                        break;
                }
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
        } else if (tag === 'userPhoneNo') {
            this.setState({
                userPhoneNo: text,
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
            phone: this.state.userPhoneNo,
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
        if (this.state.userName.length > 4) {
            ToastManager.show('姓名不能超过4个字', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            return;
        }
        if (!this.state.userIdCardNo || this.state.userIdCardNo.length <= 0) {
            ToastManager.show('请输入身份证号' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            return;
        } else if (!PatterCommonUtil.isIdCard(this.state.userIdCardNo)) {
            ToastManager.show('请输入正确的身份证号' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            return;
        }
        if (!this.state.userPhoneNo || this.state.userPhoneNo.length <= 0) {
            ToastManager.show('请输入手机号' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            return;
        } else if (!PatterCommonUtil.isPhone(this.state.userPhoneNo)) {
            ToastManager.show('请输入正确的手机号' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            return;
        }
        if (!this.state.userIdCardFontImageUrl || this.state.userIdCardFontImageUrl.length <= 0) {
            ToastManager.show('请上传身份证正面照' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            return;
        }
        if (!this.state.userIdCardBackImageUrl || this.state.userIdCardBackImageUrl.length <= 0) {
            ToastManager.show('请上传身份证背面照' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            return;
        }

        //2018年01月09日 新需求，技能证书为非必填内容
        // if (!this.state.userSkillBookFontImageUrl || this.state.userSkillBookFontImageUrl.length <= 0) {
        //     ToastManager.show('请上传技术证书正面照' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
        //     return;
        // }

        DialogManagerUtil.showNormalLoadingDialog();
        let params = {
            userId: this.props.mobileUserData.data.id,
            typeId: this.props.mobileUserData.data.typeId,
            typeName: this.props.mobileUserData.data.typeName,
            userName: this.state.userName,
            userIdCardNo: this.state.userIdCardNo,
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
        UserDataManager.getInstance().saveBeRna(status).then(saveToMap => {
            if (this.props.mobileUserData && this.props.mobileUserData.data) {
                if (params.userName !== this.props.mobileUserData.data.name) {
                    UserDataManager.getInstance().saveName(params.userName).then(saveToMap => {
                        if (params.userPhoneNo !== this.props.mobileUserData.data.phone) {
                            UserDataManager.getInstance().savePhone(params.userPhoneNo).then(saveToMap => {
                                if (this.props.onRnaChangeSuccessCallback) {
                                    this.props.onRnaChangeSuccessCallback(status);
                                }
                            });
                        } else {
                            if (this.props.onRnaChangeSuccessCallback) {
                                this.props.onRnaChangeSuccessCallback(status);
                            }
                        }
                    });
                } else {
                    if (this.props.onRnaChangeSuccessCallback) {
                        this.props.onRnaChangeSuccessCallback(status);
                    }
                }
            } else {
                if (this.props.onRnaChangeSuccessCallback) {
                    this.props.onRnaChangeSuccessCallback(status);
                }
            }
        });
    };

    render() {
        return (
            <View style={RnaEditMsgActivityStyles.container}>
                <HeaderCommonView navigator={this.props.navigator}
                                  bgColor={'#FFCC33'}
                                  headerLeftShow={true}
                                  headerCenterShow={true}
                                  headerRightShow={true}
                                  headerRightButtonTitle={'完成'}
                                  headerRightButtonOnpress={() => this._ValidNetVerCode()}
                                  showCenterAfterLeft={true}
                                  headerCenterTitle={'实名认证'}/>

                <ScrollView style={RnaEditMsgActivityStyles.function_list}
                            keyboardShouldPersistTaps={'always'}
                            contentContainerStyle={RnaEditMsgActivityStyles.function_list_contentContainer}
                >
                    <View style={RnaEditMsgActivityStyles.function_list_container}>
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
                            leftTitle={'姓名'}
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
                            leftTitle={'身份证号'}
                            rightType={'input'}
                            onInputParamsChange={(text) => this._onInputParamsChange('userIdCardNo', text)}
                            keyboardTypeIn={'numeric'}
                            rightInputAutoFocus={false}
                            rightShowTitleShowAtRight={true}
                            rightInputPlaceholder={'请输入身份证号码'}
                            showRightTextWithBgView={false}
                            bottomViewHeight={2}
                        />

                        <CommonListItemView
                            rootNotTouchable={true}
                            leftTitle={'手机号码'}
                            rightShowTitle={this.props.mobileUserData && this.props.mobileUserData.data && this.props.mobileUserData.data.phone ? this.props.mobileUserData.data.phone : ''}
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

                        <RnaEditActivityInputItem showTag={'上传身份证明'}
                                                  showRight={true}
                                                  rightType={'text'}
                                                  righShowClolr={'#FC333D'}
                                                  showRightTag={'(必填)'}
                                                  bgColors={'transparent'}
                        />
                        <RnaEditActivityImageItem leftItemShow={'请拍摄身份证正面'}
                                                  leftImage={
                                                      this.state.userIdCardFontImageUrl ? {uri: this.state.userIdCardFontImageUrl} :
                                                          require('../../../../../stable/image/main/rna/ic_rna_a.png')}
                                                  onLeftPress={() => this._onLeftPress('上传身份证正面', 0)}
                                                  showRight={true}
                                                  rightItemShow={'示例'}
                                                  rightShowColor={'#FC333D'}
                                                  rightImage={require('../../../../../stable/image/main/rna/ic_rna_b.png')}
                                                  bgColors={'#FFFFFF'}
                        />

                        <RnaEditActivityImageItem leftItemShow={'请拍摄身份证反面'}
                                                  leftImage={
                                                      this.state.userIdCardBackImageUrl ? {uri: this.state.userIdCardBackImageUrl} :
                                                          require('../../../../../stable/image/main/rna/ic_rna_c.png')}
                                                  onLeftPress={() => this._onLeftPress('上传身份证反面', 1)}
                                                  showRight={true}
                                                  rightItemShow={'示例'}
                                                  rightShowColor={'#FC333D'}
                                                  rightImage={require('../../../../../stable/image/main/rna/ic_rna_d.png')}
                                                  bgColors={'#FFFFFF'}
                        />

                        <RnaEditActivityInputItem showTag={'上传技能证明'}
                                                  showRight={true}
                                                  rightType={'text'}
                                                  righShowClolr={'#000000'}
                                                  showRightTag={'(非必填)'}
                                                  bgColors={'transparent'}
                        />

                        <RnaEditActivityImageItem leftItemShow={'请拍摄技术证书正面'}
                                                  leftImage={
                                                      this.state.userSkillBookFontImageUrl ? {uri: this.state.userSkillBookFontImageUrl} :
                                                          require('../../../../../stable/image/main/rna/ic_rna_e.png')}
                                                  onLeftPress={() => this._onLeftPress('上传技术证书正', 2)}
                                                  showRight={false}
                                                  bgColors={'#FFFFFF'}
                        />

                    </View>
                </ScrollView>

            </View>
        );
    };
}


RnaEditMsgActivityStyles = StyleSheet.create({
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