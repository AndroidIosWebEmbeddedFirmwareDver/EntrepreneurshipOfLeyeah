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

import ImagePicker from 'react-native-image-crop-picker'
import PermissionAndroidCommonUtil from '../../../../../utils/permission/android/permission.common'


const Permissions = require('react-native-permissions');


import HeaderCommonView from '../../../../views/header/header.common.view'
import CommonListItemView from '../../../../views/common/common.list.item.view'

import ToastManager from '../../../../../utils/toast/Toast.util'
import NetworkCommonUtil from '../../../../../utils/network.common.util'
import DialogManagerUtil from '../../../../views/dialog/dialog.manager.util'
import ImagePickerCommonUtil from '../../../../../utils/image.picker.common'

import UserDataManager from '../../../../../utils/storage/user.data.manager.common.util'
import BaseActivity from "../../../../views/base.activity";

/**
 * 使用说明
 */
export default class AvatorActivity extends BaseActivity {
    //1.
    constructor(props) {
        super(props);
        this.state = {
            imageCacheUrl: null,
        };
    }

    //2.
    componentWillMount() {
        super.componentWillMount();
    }

    //3.
    componentDidMount() {
        super.componentDidMount();
        if (Platform.OS === 'android') {
            if (PermissionAndroidCommonUtil._checkPermission(PermissionAndroidCommonUtil.androidPermissions.READ_EXTERNAL_STORAGE)) {
                PermissionAndroidCommonUtil._requestPermission(PermissionAndroidCommonUtil.androidPermissions.READ_EXTERNAL_STORAGE);
            }
            if (PermissionAndroidCommonUtil._checkPermission(PermissionAndroidCommonUtil.androidPermissions.WRITE_EXTERNAL_STORAGE)) {
                PermissionAndroidCommonUtil._requestPermission(PermissionAndroidCommonUtil.androidPermissions.WRITE_EXTERNAL_STORAGE);
            }
        }
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


    _onItemPhotoPressed = (item) => {
        if (!item) {
            ImagePickerCommonUtil.requestCamera(true, 200, 200, true).then(image => {
                this._uploadImage(image);
            });
        } else {
            ImagePickerCommonUtil.requestPhoto(true, 200, 200, true).then(image => {
                this._uploadImage(image);
            });
        }
    };

    _uploadImage = (image) => {
        DialogManagerUtil.showNormalLoadingDialog();
        let base64 = true;
        if (!base64) {
            NetworkCommonUtil.httpUpLoadSingleImage(image, NetworkCommonUtil.SERVERURL_POST_IMAGE_UPLOAD).then((val: any) => {
                if (val && val.data && val.data.code === NetworkCommonUtil.SERVER_HTTP_TASK_STATUS_SUCCESS) {
                    this._uploadAvater(val.data.msg);
                } else if (val) {
                    ToastManager.show(JSON.stringify(val) + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
                    DialogManagerUtil.hide();
                } else {
                    ToastManager.show('请求网络出错' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
                    DialogManagerUtil.hide();
                }
            });
        } else {
            NetworkCommonUtil.httpUpLoadSingleBase64Image(image, NetworkCommonUtil.SERVERURL_POST_IMAGE_UPLOAD_BASE64).then((val: any) => {
                if (val && val.data && val.data.code === NetworkCommonUtil.SERVER_HTTP_TASK_STATUS_SUCCESS) {
                    this._uploadAvater(val.data.msg);
                } else if (val) {
                    ToastManager.show(JSON.stringify(val) + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
                    DialogManagerUtil.hide();
                } else {
                    ToastManager.show('请求网络出错' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
                    DialogManagerUtil.hide();
                }
            });
        }
    };
    _uploadAvater = (imageNetUrl) => {
        let params = {
            id: this.props.mobileUserData.data.id,
            phone: this.props.mobileUserData.data.phone,
            typeId: this.props.mobileUserData.data.typeId,
            avatarUrl: imageNetUrl,
        };
        NetworkCommonUtil.httpPostRequest(JSON.stringify(params), NetworkCommonUtil.SERVERURL_SYS_USER_UPDATE_AVATER).then((val: any) => {

            if (val && val.code === NetworkCommonUtil.SERVER_HTTP_TASK_STATUS_SUCCESS) {
                // ToastManager.show(val.msg + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
                if (val.data) {
                    this.setState({
                        imageCacheUrl: val.data.avatarUrl ? val.data.avatarUrl : '',
                    });
                    this._onAvatorChangeSuccessCallback(val.data.avatarUrl ? val.data.avatarUrl : '');
                }
            } else if (val) {
                ToastManager.show(val.msg + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            } else {
                ToastManager.show('请求网络出错' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            }
            DialogManagerUtil.hide();
        });
    };

    _onAvatorChangeSuccessCallback = (avatarUrl) => {
        UserDataManager.getInstance().saveAvatarUrl(avatarUrl).then(saveToMap => {
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
            <View style={AvatorActivityStyles.container}>
                <HeaderCommonView navigator={this.props.navigator}
                                  bgColor={'#FFCC33'}
                                  headerLeftShow={true}
                                  headerCenterShow={true}
                                  headerRightShow={false}
                                  showCenterAfterLeft={true}
                                  headerCenterTitle={'我的头像'}/>
                <ScrollView style={AvatorActivityStyles.function_list}>
                    <View style={[AvatorActivityStyles.function_list_item, {}]}>
                        <View>
                            <View>
                                <Image
                                    source={
                                        this.state.imageCacheUrl ? {uri: this.state.imageCacheUrl}
                                            : this.props.mobileUserData && this.props.mobileUserData.data && this.props.mobileUserData.data.avatarUrl ? {uri: this.props.mobileUserData.data.avatarUrl}
                                            : require('../../../../../stable/image/app_a.png')
                                    }
                                    style={{
                                        width: width,
                                        height: 240,
                                        resizeMode: 'cover',
                                    }}
                                />
                            </View>

                            <View style={{
                                width: width,
                                height: 240,
                                backgroundColor: 'rgba(0, 0, 0, 0.56)',
                                alignItems: 'center',
                                justifyContent: 'center',
                                position: 'absolute',
                            }}>
                                <Image
                                    source={
                                        this.state.imageCacheUrl ? {uri: this.state.imageCacheUrl}
                                            : this.props.mobileUserData && this.props.mobileUserData.data && this.props.mobileUserData.data.avatarUrl ? {uri: this.props.mobileUserData.data.avatarUrl}
                                            : require('../../../../../stable/image/app_a.png')
                                    }
                                    style={{
                                        width: 128,
                                        height: 128,
                                        resizeMode: 'cover',
                                        borderRadius: 128 / 2,
                                        borderColor: '#FBFBFB',
                                        borderWidth: 2,

                                    }}
                                />
                            </View>

                            <View style={{height: 10, backgroundColor: 'transparent',}}/>
                            <CommonListItemView
                                itemOnpress={() => this._onItemPhotoPressed(false)}
                                leftTitle={'拍照上传'}
                                rightType={'next'}
                                rightNextImage={require('../../../../../stable/image/ic_app_more.png')}
                                bottomViewHeight={2}
                            />
                            <CommonListItemView
                                itemOnpress={() => this._onItemPhotoPressed(true)}
                                leftTitle={'相册选择'}
                                rightType={'next'}
                                rightNextImage={require('../../../../../stable/image/ic_app_more.png')}
                                bottomViewHeight={2}
                            />
                        </View>
                    </View>
                </ScrollView>
            </View>
        );
    }
    ;
}

AvatorActivityStyles = StyleSheet.create({
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
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FBFBFB',
        justifyContent: 'center',
        alignItems: 'center',
    },
});


/*
position:'relative'
相对布局。这个和html的position有很大的不同，他的相对布局不是相对于父容器，而是相对于兄弟节点。
position:'absolute'
绝对布局。这个是相对于父容器进行据对布局。绝对布局是脱离文档流的，不过奇怪的是依旧在文档层次结构里面，
这个和html的position也很大不一样。另外还有一个和html不一样的是，html中position:absolute要求父容
器的position必须是absolute或者relative，如果第一层父容器position不是absolute或者relative，
在html会依次向上递归查询直到找到为止，然后居于找到的父容器绝对定位。
* */