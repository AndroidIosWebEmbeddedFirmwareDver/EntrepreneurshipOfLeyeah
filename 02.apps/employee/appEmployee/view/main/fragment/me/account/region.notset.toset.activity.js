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

import InputScrollView from 'react-native-input-scroll-view'

import ToastManager from '../../../../../utils/toast/Toast.util'
import NetworkCommonUtil from '../../../../../utils/network.common.util'
import DialogManagerUtil from '../../../../views/dialog/dialog.manager.util'
import UserDataManager from '../../../../../utils/storage/user.data.manager.common.util'
import PhoneResetActivity from './phone.reset.activity'

import ResgionChoiceHireScreen from './region/region.choice.hire.screen'
import BaseActivity from "../../../../views/base.activity";

export default class RegionNotsetToSetActivity extends BaseActivity {
    //1.
    constructor(props) {
        super(props);
        this.state = {
            regionChanged: false,
            areaCountryPkId: 0,
            areaCountryName: '',
            areaProvincePkId: 0,
            areaProvinceName: '',
            areaCityPkId: 0,
            areaCityName: '',
            areaAreaAndCountyPkId: 0,
            areaAreaAndCountyName: '',
            addressChanged: false,
            areaAddress: '',
        };
    }


    //2.
    componentWillMount() {
        super.componentWillMount();
        this._init_data();
    }

    //3.
    componentDidMount() {
        super.componentDidMount();
    }

    //4.
    componentWillUnmount() {
        super.componentWillUnmount();
    }

    _init_data = () => {
        if (this.props.mobileUserData && this.props.mobileUserData.data) {
            if (this.props.mobileUserData.data.areaCountryPkId > 0
                || this.props.mobileUserData.data.areaProvincePkId > 0
                || this.props.mobileUserData.data.areaCityPkId > 0 ||
                this.props.mobileUserData.data.areaAreaAndCountyPkId > 0) {
                this.setState({
                    areaCountryPkId: this.props.mobileUserData.data.areaCountryPkId,
                    areaCountryName: this.props.mobileUserData.data.areaCountryName,
                    areaProvincePkId: this.props.mobileUserData.data.areaProvincePkId,
                    areaProvinceName: this.props.mobileUserData.data.areaProvinceName,
                    areaCityPkId: this.props.mobileUserData.data.areaCityPkId,
                    areaCityName: this.props.mobileUserData.data.areaCityName,
                    areaAreaAndCountyPkId: this.props.mobileUserData.data.areaAreaAndCountyPkId,
                    areaAreaAndCountyName: this.props.mobileUserData.data.areaAreaAndCountyName,
                    areaAddress: this.props.mobileUserData.data.areaAddress,
                });
            }
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

    _onJointoSetRegion = () => {

    };

    _onUserDataRefreshCallback = () => {
        if (this.props.onUserDataRefreshCallback) {
            this.props.onUserDataRefreshCallback();
        }
        if (this.props.navigator) {
            this.props.navigator.pop();
        }
    };

    _onInputParamsChange = (tag, text) => {
        if (tag === 'areaAddress') {
            this.setState({
                addressChanged: true,
                areaAddress: text,
            });
        }
    };


    _cllbackSetSelectedAddress = (selectedProvince, selectedCity, selectedAreaAndCounty) => {
        if (selectedProvince && selectedCity && selectedAreaAndCounty) {
            this.setState({
                regionChanged: true,
                areaCountryPkId: 1,//默认1表示CN
                areaCountryName: '中国',
                areaProvincePkId: selectedProvince.pkId,
                areaProvinceName: selectedProvince.regionName,
                areaCityPkId: selectedCity.pkId,
                areaCityName: selectedCity.regionName,
                areaAreaAndCountyPkId: selectedAreaAndCounty.pkId,
                areaAreaAndCountyName: selectedAreaAndCounty.regionName,
            });
        }
    };

    _uploadRegion = () => {

        if (this.state.areaCountryPkId <= 0 || this.state.areaProvincePkId <= 0 || this.state.areaCityPkId <= 0 || this.state.areaAreaAndCountyPkId <= 0) {
            ToastManager.show('请选择地理位置' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            return;
        }

        if (this.state.areaAddress.length <= 0) {
            ToastManager.show('请输入详细地址' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            return;
        }

        DialogManagerUtil.showNormalLoadingDialog();
        let params = {
            id: this.props.mobileUserData.data.id,
            typeId: this.props.mobileUserData.data.typeId,
            areaCountryPkId: this.state.areaCountryPkId,
            areaCountryName: this.state.areaCountryName,
            areaProvincePkId: this.state.areaProvincePkId,
            areaProvinceName: this.state.areaProvinceName,
            areaCityPkId: this.state.areaCityPkId,
            areaCityName: this.state.areaCityName,
            areaAreaAndCountyPkId: this.state.areaAreaAndCountyPkId,
            areaAreaAndCountyName: this.state.areaAreaAndCountyName,
            areaAddress: this.state.areaAddress,
            // this.state.regionChanged || this.state.addressChanged ? this.state.areaProvinceName + this.state.areaCityName + this.state.areaAreaAndCountyName + this.state.areaAddress :
        };
        NetworkCommonUtil.httpPostRequest(JSON.stringify(params), NetworkCommonUtil.SERVERURL_SYS_USER_UPDATE_REGION).then((val: any) => {
            DialogManagerUtil.hide();
            if (val && val.code === NetworkCommonUtil.SERVER_HTTP_TASK_STATUS_SUCCESS) {
                // ToastManager.show(val.msg + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
                this._onRegionChangeSuccessCallback(params);
            } else if (val) {
                ToastManager.show(val.msg + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            } else {
                ToastManager.show('请求网络出错' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            }
        });
    };

    _onRegionChangeSuccessCallback = (params) => {
        UserDataManager.getInstance().saveRegion(params).then(saveToMap => {
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
            <View style={RegionNotsetToSetActivityStyles.container}>
                <HeaderCommonView navigator={this.props.navigator}
                                  bgColor={'#FFCC33'}
                                  headerLeftShow={true}
                                  headerCenterShow={true}
                                  headerRightShow={true}
                                  headerRightButtonTitle={'完成'}
                                  headerRightButtonOnpress={() => this._uploadRegion()}
                                  showCenterAfterLeft={true}
                                  headerCenterTitle={'所在地址'}/>
                <ScrollView style={RegionNotsetToSetActivityStyles.function_list}
                            keyboardShouldPersistTaps={'always'}
                            contentContainerStyle={RegionNotsetToSetActivityStyles.function_list_contentContainer}
                >
                    <View style={{height: 10, backgroundColor: 'transparent',}}/>
                    <CommonListItemView
                        itemOnpress={() => this._pushCompoent(ResgionChoiceHireScreen, {cllbackSetSelectedAddress: this._cllbackSetSelectedAddress})}
                        rootNotTouchable={false}
                        leftTitle={'地理位置'}
                        rightType={'next'}
                        rightNextImage={require('../../../../../stable/image/ic_app_more.png')}
                        rightShowTitle={this.state.areaCountryName + this.state.areaProvinceName + this.state.areaAreaAndCountyName}
                        rightShowTitleShowAtRight={true}
                        showRightTextWithBgView={false}
                        bottomViewHeight={2}
                    />

                    <CommonListItemView
                        rootNotTouchable={true}
                        hiddeLeft={false}
                        leftTitle={'详细地址'}
                        rightType={'input'}
                        onInputParamsChange={(text) => this._onInputParamsChange('areaAddress', text)}
                        keyboardTypeIn={'default'}
                        rightInputPlaceholder={this.state.areaAddress ? this.state.areaAddress : '请输入详细地址'}
                        rightInputAutoFocus={false}
                        rightShowTitleShowAtRight={true}
                        showRightTextWithBgView={false}
                        bottomViewHeight={2}
                    />

                </ScrollView>
            </View>
        );
    }
}


RegionNotsetToSetActivityStyles = StyleSheet.create({
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
    function_list_contentContainer: {
        // paddingVertical: 16,
        //暂时解决安卓下布局显示不完整
        paddingBottom: 24,
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
    normal_Text: {
        fontSize: 16,
        color: '#000000',
    },

});