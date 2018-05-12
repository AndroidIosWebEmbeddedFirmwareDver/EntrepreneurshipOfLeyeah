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

import InputScrollView from 'react-native-input-scroll-view';

import ToastManager from '../../../../../utils/toast/Toast.util'
import NetworkCommonUtil from '../../../../../utils/network.common.util'
import AsyncstorageKeyCommonUtil from '../../../../../utils/storage/asyncstorage.key.common.util'
import AsyncstorageStorageCommonUtil from '../../../../../utils/storage/asyncstorage.storage.common.util'
import CommonListItemView from '../../../../views/common/common.list.item.view'
import DialogManagerUtil from '../../../../views/dialog/dialog.manager.util'
import ImagePickerCommonUtil from '../../../../../utils/image.picker.common'

import HeaderCommonView from '../../../../views/header/header.common.view'
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
                        <View style={RnaEditActivityStyles.function_list_item_container}>
                            <Text style={[RnaEditActivityStyles.normal_text, {color: '#666666'}]}>
                                {this.props.showTag}
                            </Text>
                            <Text
                                style={[RnaEditActivityStyles.normal_text, this.props.righShowClolr ? {color: this.props.righShowClolr} : {}]}>
                                {this.props.showRightTag}
                            </Text>
                        </View>
                        :
                        <View style={RnaEditActivityStyles.function_list_item_container}>
                            <Text style={[RnaEditActivityStyles.normal_text, {flex: 1,}]}>
                                {this.props.showTag}
                            </Text>
                            <TextInput style={[RnaEditActivityStyles.normal_text, {
                                flex: 3,
                            }]}
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
                style={[RnaEditActivityStyles.function_list_item_container, {
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
                        style={[RnaEditActivityStyles.normal_text, {marginTop: 9.6}]}>{this.props.leftItemShow}</Text>
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
                                style={[RnaEditActivityStyles.normal_text, {marginTop: 9.6}, this.props.rightShowColor ? {color: this.props.rightShowColor} : {}]}>{this.props.rightItemShow}</Text>
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


export default class RnaEditActivity extends PureComponent {
    //1.
    constructor(props) {
        super(props);
        this.state = {
            idCardFontImage: null,
            idCardBackImage: null,
            skillFontImage: null,
        };
    }

    //2.
    componentWillMount() {

    }

    //3.
    componentDidMount() {
    }

    _onInputParamsChange = (text, flag) => {

    };


    uploadImage = (image) => {
        DialogManagerUtil.showNormalLoadingDialog();
        NetworkCommonUtil.httpUpLoadSingleImage(image.filename, 'file:///' + image.path, NetworkCommonUtil.SERVERURL_POST_IMAGE_UPLOAD).then((val: any) => {
            if (val && val.data && val.data.code === NetworkCommonUtil.SERVER_HTTP_TASK_STATUS_SUCCESS) {
                this.setState({responValue: val});
            } else if (val) {
                ToastManager.show(JSON.stringify(val) + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            } else {
                ToastManager.show('请求网络出错' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            }
            DialogManagerUtil.hide();
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
            ImagePickerCommonUtil.requestCamera(false, 200, 200).then(image => {
                this.uploadImage(image);
                switch (key) {
                    case 0:
                        this.setState({
                            idCardFontImage: image,
                        });
                        break;
                    case 1:
                        this.setState({
                            idCardBackImage: image,
                        });
                        break;

                    case 2:
                        this.setState({
                            skillFontImage: image,
                        });
                        break;
                }
            });
        } else {
            ImagePickerCommonUtil.requestPhoto(false, 200, 200).then(image => {

                this.uploadImage(image);
                switch (key) {
                    case 0:
                        this.setState({
                            idCardFontImage: image,
                        });
                        break;
                    case 1:
                        this.setState({
                            idCardBackImage: image,
                        });
                        break;

                    case 2:
                        this.setState({
                            skillFontImage: image,
                        });
                        break;
                }
            });
        }
    };

    render() {
        return (
            <View style={RnaEditActivityStyles.container}>
                <HeaderCommonView navigator={this.props.navigator}
                                  bgColor={'#FFCC33'}
                                  headerLeftShow={true}
                                  headerCenterShow={true}
                                  headerRightShow={false}
                                  showCenterAfterLeft={true}
                                  headerCenterTitle={'实名认证'}/>
                <InputScrollView
                    scrollEnabled={true}
                    showsVerticalScrollIndicator={true}
                    keyboardShouldPersistTaps={'always'}
                >

                    {/*<View style={RnaEditActivityStyles.function_list_container}>*/}

                    <View style={{height: 10, backgroundColor: 'transparent',}}/>

                    <RnaEditActivityInputItem showTag={'基本资料'}
                                              showRight={true}
                                              rightType={'text'}
                                              righShowClolr={'#FC333D'}
                                              showRightTag={'(必填)'}
                                              bgColors={'transparent'}
                    />

                    <RnaEditActivityInputItem showTag={'姓名'}
                                              showRight={true}
                                              placeholderShow={'请输入您的真实姓名'}
                                              flag={'name'}
                                              keyboardTypeIn={'default'}
                                              bgColors={'#FFFFFF'}
                                              showCutLine={true}
                    />
                    <RnaEditActivityInputItem showTag={'身份证号'}
                                              showRight={true}
                                              placeholderShow={'请输入您的身份证号码'}
                                              flag={'name'}
                                              keyboardTypeIn={'numeric'}
                                              bgColors={'#FFFFFF'}
                                              showCutLine={true}
                    />
                    <RnaEditActivityInputItem showTag={'手机号码'}
                                              showRight={true}
                                              placeholderShow={'请输入您的手机号码'}
                                              flag={'name'}
                                              keyboardTypeIn={'phone-pad'}
                                              bgColors={'#FFFFFF'}
                                              showCutLine={true}

                    />
                    <RnaEditActivityInputItem showTag={'验证码'}
                                              showRight={true}
                                              placeholderShow={'请输入您获取的验证码'}
                                              flag={'name'}
                                              keyboardTypeIn={'phone-pad'}
                                              bgColors={'#FFFFFF'}
                                              showCutLine={true}
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
                                                  this.state.idCardFontImage ? {uri: 'file:///' + this.state.idCardFontImage.path} :
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
                                                  this.state.idCardBackImage ? {uri: 'file:///' + this.state.idCardBackImage.path} :
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
                                              righShowClolr={'#666666'}
                                              showRightTag={'(选填)'}
                                              bgColors={'transparent'}
                    />

                    <RnaEditActivityImageItem leftItemShow={'请拍摄技术证书正面'}
                                              leftImage={
                                                  this.state.skillFontImage ? {uri: 'file:///' + this.state.skillFontImage.path} :
                                                      require('../../../../../stable/image/main/rna/ic_rna_e.png')}
                                              onLeftPress={() => this._onLeftPress('上传技术证书正', 2)}
                                              showRight={false}
                                              bgColors={'#FFFFFF'}
                    />

                    <TouchableOpacity
                        style={[RnaEditActivityStyles.btn_style_full, {marginTop: 19.2}]}
                        onPress={() => {
                        }}
                    >
                        <Text
                            style={[RnaEditActivityStyles.normal_text, {
                                color: '#FFFFFF',
                            }]}>提交实名认证</Text>
                    </TouchableOpacity>
                    <View style={{height: 120}}/>
                </InputScrollView>
            </View>
        );
    };
}

RnaEditActivityStyles = StyleSheet.create({
    //基于flex-box布局
    container: {
        width: width,
        height: height,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FBFBFB',
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