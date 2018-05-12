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

import UserDataManager from '../../../../../utils/storage/user.data.manager.common.util'
import ScreenAdaptCommonUtil from '../../../../../utils/screenAdapt/screen.adapt.common.util'
import NetworkCommonUtil from '../../../../../utils/network.common.util'
import DialogManagerUtil from '../../../../views/dialog/dialog.manager.util'
import ToastManager from '../../../../../utils/toast/Toast.util'
import ImagePickerCommonUtil from '../../../../../utils/image.picker.common'

import HeaderCommonView from '../../../../views/header/header.common.view'
import AutoExpandingTextInput from '../../../../views/input/auto.expand.text.input'
import BaseActivity from "../../../../views/base.activity";


export default class AdvanceManagerAccountActivity extends BaseActivity {
    //1.
    constructor(props) {
        super(props);
        this.state = {
            mobileUserData: null,
            adviseTitle: null,
            adviseDesc: null,
            adviseImage: null,
            adviseImageUrl: null,
        };
    }

    //2.
    componentWillMount() {
        super.componentWillMount();
        this._refreshUserData().then((ret) => {
            // this.setState({
            // });
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

    //1.查询本地缓存用户数据
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

    _onInputParamsChange = (text) => {
        this.setState({
            adviseDesc: text,
        });
    };

    //照片----------------------------------------------------------------------start--
    _onGetImagePress = (showTitle) => {

        DialogManagerUtil.showNormalChoiceDialog(showTitle, [
            {
                key: 0,
                itemShow: '拍照',
                itemOnpressCllback: () => this._onGetImageCallback(0)
            },
            {
                key: 1,
                itemShow: '从相册选择',
                itemOnpressCllback: () => this._onGetImageCallback(1)
            },
        ]);
        // DialogManagerUtil.showNormalLoadingDialog();
    };
    _onGetImageCallback = (item) => {
        if (item === 0) {
            ImagePickerCommonUtil.requestCamera(true, 200, 200, true).then(image => {
                this.uploadImage(image);
                this.setState({
                    adviseImage: image,
                });
            });
        } else {
            ImagePickerCommonUtil.requestPhoto(true, 200, 200, true).then(image => {
                this.uploadImage(image);
                this.setState({
                    adviseImage: image,
                });
            });
        }
    };

    //上传照片----------------------------------------------------------------------
    uploadImage = (image) => {
        DialogManagerUtil.showNormalLoadingDialog();
        NetworkCommonUtil.httpUpLoadSingleBase64Image(image, NetworkCommonUtil.SERVERURL_POST_IMAGE_UPLOAD_BASE64).then((val: any) => {
            DialogManagerUtil.hide();
            if (val && val.data && val.data.code === NetworkCommonUtil.SERVER_HTTP_TASK_STATUS_SUCCESS) {
                this.setState({
                    adviseImageUrl: val.data.msg,
                });
            } else if (val) {
                ToastManager.show(JSON.stringify(val) + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            } else {
                ToastManager.show('请求网络出错' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            }
        });
    };
    //照片----------------------------------------------------------------------end--

    _submitAdviseOrder = () => {
        if (!this.state.mobileUserData.data) {
            return;
        }
        if (!this.state.adviseDesc || this.state.adviseDesc.length <= 0) {
            ToastManager.alertWithSure('提示', '请填写您的建议！', () => {
            });
            return;
        }
        DialogManagerUtil.showNormalLoadingDialog();
        let paramsObject = {
            'userId': this.state.mobileUserData.data.id,
            'userPhone': this.state.mobileUserData.data.phone,
            'adviseTitle': this.state.adviseTitle ? this.state.adviseTitle : '未输入标题',
            'adviseDesc': this.state.adviseDesc,
            'adviseImageUrl': this.state.adviseImageUrl,
        };
        NetworkCommonUtil.httpPostRequest(JSON.stringify(paramsObject), NetworkCommonUtil.SERVERURL_POST_API_MOBILE_USER_ADVISE_CREATE).then((val: any) => {
            DialogManagerUtil.hide();
            // alert(JSON.stringify(val));
            if (val && val.code === NetworkCommonUtil.SERVER_HTTP_TASK_STATUS_SUCCESS) {
                ToastManager.alertWithSure('提示', '您的意见已经提交，我们将会在24小时内处理，谢谢！', () => {
                    if (this.props.navigator) {
                        this.props.navigator.pop();
                    }
                });
            } else if (val) {
                ToastManager.show(val.msg + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            } else {
                ToastManager.show('请求网络出错' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            }
        });
    };


    render() {
        return (
            <View style={AdvanceManagerAccountActivityStyles.container}>
                <HeaderCommonView navigator={this.props.navigator}
                                  bgColor={'#FFCC33'}
                                  headerLeftShow={true}
                                  headerCenterShow={true}
                                  headerRightShow={false}
                                  showCenterAfterLeft={true}
                                  headerCenterTitle={'意见反馈'}/>
                <View style={{height: 10, backgroundColor: 'transparent',}}/>
                <TextInput style={[AdvanceManagerAccountActivityStyles.input_view, {
                    textAlignVertical: 'top',
                    fontSize: 16,
                    padding: 0,
                }]}
                           underlineColorAndroid="transparent"
                           placeholder={'请输入您的意见或反馈'}
                           onChangeText={(text) => this._onInputParamsChange(text)}
                           clearButtonMode={'while-editing'}
                           keyboardType={'default'}
                           autoFocus={false}
                           multiline={true}
                           numberOfLines={6}
                />
                <Text
                    style={[AdvanceManagerAccountActivityStyles.normal_text, {
                        color: '#707070',
                        margin: 9.6,
                        fontSize: 14,
                    }]}>添加图片</Text>

                <View
                    style={AdvanceManagerAccountActivityStyles.uplodImage_view}
                >
                    <TouchableOpacity
                        style={AdvanceManagerAccountActivityStyles.uplodImage_view_item}
                        onPress={() => this._onGetImagePress('上传图片')}
                    >
                        <Image
                            source={this.state.adviseImageUrl ? {uri: this.state.adviseImageUrl} : require('../../../../../stable/image/main/ic_add_normal.png')}
                            style={[{
                                width: (width - 9.6 * 4) / 4,
                                height: 72,
                            }, this.state.adviseImageUrl ? {resizeMode: 'stretch',} : {resizeMode: 'center',}]}
                        />
                    </TouchableOpacity>
                    <View
                        style={[AdvanceManagerAccountActivityStyles.uplodImage_view_item, {backgroundColor: 'transparent'}]}/>
                    <View
                        style={[AdvanceManagerAccountActivityStyles.uplodImage_view_item, {backgroundColor: 'transparent'}]}/>
                    <View
                        style={[AdvanceManagerAccountActivityStyles.uplodImage_view_item, {backgroundColor: 'transparent'}]}/>
                </View>

                <TouchableOpacity
                    style={AdvanceManagerAccountActivityStyles.btn_style_full}
                    onPress={() => this._submitAdviseOrder()}
                >
                    <Text
                        style={[AdvanceManagerAccountActivityStyles.normal_text, {
                            color: '#FFFFFF',
                        }]}>提交反馈</Text>
                </TouchableOpacity>

            </View>
        );
    };
}

AdvanceManagerAccountActivityStyles = StyleSheet.create({
    //基于flex-box布局
    container: {
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FFFFFF',
    },

    input_view: {
        height: 120,
        alignItems: 'flex-start',
        justifyContent: 'flex-start',
        margin: 9.6,
        backgroundColor: '#FBFBFB',
    },
    uplodImage_view: {
        flexDirection: 'row',//row ,row-reverse ,column ('default') column-reverse
        height: 96,
        backgroundColor: '#FBFBFB',
    },
    uplodImage_view_item: {
        flex: 1,
        backgroundColor: '#FFFFFF',
        margin: 9.6,
        alignItems: 'center',
        justifyContent: 'center',
    },
    btn_style_full: {
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
    }
});