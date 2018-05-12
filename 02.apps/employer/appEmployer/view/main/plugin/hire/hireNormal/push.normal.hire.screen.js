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
    Dimensions,
    ActivityIndicator,
    TouchableOpacity,
    StyleSheet,
} from 'react-native';

import parse from 'date-fns/parse';
import format from 'date-fns/format'
import InputScrollView from 'react-native-input-scroll-view';


import styles from '../../plugin.common.style'
import hireStyles from '../hire.main.style'


import HeaderCommonView from '../../../../views/header/header.common.view'
import NetworkCommonUtil from '../../../../../utils/network.common.util'
import UserDataManager from '../../../../../utils/storage/user.data.manager.common.util'
import ToastManager from '../../../../../utils/toast/Toast.util'
import DialogManagerUtil from '../../../../views/dialog/dialog.manager.util'
import CommonListItemView from '../../../../views/common/common.list.item.view'


import WorkTypeHireScreen from '../workType/work.type.hire.screen'
import ExperienceRequireTypeHireScreen from '../experience/experience.type.hire.screen'
import ResgionChoiceHireScreen from '../region/region.choice.hire.screen'
import PushSuccessHireScreen from '../hireSuccess/push.success.hire.screen'
import DateChoiceCommonScreen from '../../common/date.choice.common.screen'
import RewardEditHireScreen from '../reward/reward.edit.hire.screen'
import BaseActivity from "../../../../views/base.activity";
import DateCommonUtil from "../../../../../utils/date.common.util";

class HireEmployeeItem extends Component {
    render() {
        return (
            <TouchableOpacity
                onPress={this.props.itemOnpress}
            >
                <View
                    style={[hireStyles.top, {height: this.props.itemHeight > 0 ? this.props.itemHeight : 56}]}>
                    <Text style={hireStyles.itemLeftText}>{this.props.leftTitle}</Text>
                    <View style={hireStyles.itemRightView}>
                        {this.props.rightType === 'next' ?
                            <View style={hireStyles.itemRightInView}>
                                <Text
                                    style={hireStyles.itemRightInViewText}>{this.props.rightShowTitle}</Text>
                                <Image
                                    source={this.props.rightNextImage}
                                    style={{
                                        width: 32,
                                        height: 32,
                                    }}
                                />
                            </View>
                            :
                            <TextInput
                                style={[{height: 48, flex: 1}, {
                                    padding: 0,
                                }]}
                                underlineColorAndroid="transparent"
                                placeholder={this.props.rightInputPlaceholder}
                                onChangeText={(text) => this.props.onInputParamsChange(text)}
                                clearButtonMode={'while-editing'}
                                keyboardType={this.props.keyboardTypeIn}
                            />
                        }
                    </View>
                </View>
                <View style={{
                    width: window.width,
                    height: this.props.bottomViewHeight,
                    backgroundColor: 'transparent'
                }}/>
            </TouchableOpacity>
        );
    }
}

class HireEmployeeBottom extends Component {
    render() {
        if (this.props.showForOneFunction) {
            return (
                <View style={hireStyles.bottomView}>
                    <TouchableOpacity
                        onPress={this.props.onLeftViewPress}
                        style={hireStyles.bottomItemView}>
                        <Text
                            style={hireStyles.bottomItemViewText}>{this.props.leftShowTitle}</Text>
                    </TouchableOpacity>
                </View>
            );
        } else {
            return (
                <View style={hireStyles.bottomView}>
                    <TouchableOpacity
                        onPress={this.props.onLeftViewPress}
                        style={hireStyles.bottomItemView}>
                        <Text
                            style={hireStyles.bottomItemViewText}>{this.props.leftShowTitle}</Text>
                    </TouchableOpacity>
                    <View style={{width: 1.20, height: 36, backgroundColor: '#FFFFFF'}}/>
                    <TouchableOpacity
                        onPress={this.props.onRightViewPress}
                        style={hireStyles.bottomItemView}>
                        <Text
                            style={hireStyles.bottomItemViewText}>{this.props.rightShowTitle}</Text>
                    </TouchableOpacity>
                </View>
            );
        }
    }
}


export default class PushNromalHireScreen extends BaseActivity {
    constructor(props) {
        super(props);
        this.state = {
            selectedWorkEmployerId: 0,
            selectedWokerType: '',
            selectedWokerTypeShow: '',
            selectedProvince: '',
            selectedCity: '',
            selectedAreaAndCounty: '',
            selectedAddressShow: '',
            selectedStartDate: '',
            selectedEndDate: '',
            selectedExperieceResponse: '',
            reward: {
                rewardMoney: 0,
                paramsMeitinaSlected: true,
                paramsZongjiaSlected: false,
                rewardType: 0,//默认0，0-每天，1-总价
                provideBoard: 0,//包吃,默认0，0-false，1-true
                provideRoom: 0,//包住,默认0，0-false，1-true
            },
            selectedRewardShow: '',
            selectedWorkDescription: '',
            selectedWorkAddress: '',
            selectedWorkEmployNums: '',//招聘人数
            selectedWorkEmployerPhone: '',//雇主联系电话
            selectedPushHireType: 0,//0-普通发布，1-紧急发布
            selectedPushHireState: false,//0-失败，1-成功
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
        if (this.props.selectedWokerType) {
            this.setState({
                selectedWokerType: this.props.selectedWokerType,
                selectedWokerTypeShow: this.props.selectedWokerType.name,
            });
        }
        if (this.props.selectedWokers) {
            this.setState({
                selectedWorkEmployNums: this.props.selectedWokers.length,
            });
        }
        if (this.props.selectedWorkExp) {
            this.setState({
                selectedExperieceResponse: this.props.selectedWorkExp,
            });
        }
        if (this.props.mobileUserData && this.props.mobileUserData.data) {
            this.setState({
                selectedWorkEmployerId: this.props.mobileUserData.data.id,
                selectedWorkEmployerPhone: this.props.mobileUserData.data.phone,
            });
        }
    };


    _cllbackSetSelectedWokerType = (selectedWokerType) => {
        if (selectedWokerType) {
            this.setState({
                selectedWokerType: selectedWokerType,
                selectedWokerTypeShow: selectedWokerType.name,
            });
        }
    };


    _cllbackSetSelectedAddress = (selectedProvince, selectedCity, selectedAreaAndCounty) => {
        if (selectedProvince && selectedCity && selectedAreaAndCounty) {
            this.setState({
                selectedProvince: selectedProvince,
                selectedCity: selectedCity,
                selectedAreaAndCounty: selectedAreaAndCounty,
                selectedAddressShow: selectedProvince.regionName.concat(selectedCity.regionName).concat(selectedAreaAndCounty.regionName),
            });
        }
    };

    _cllbackSetSelectedDate = (setDateFlag, selectedDate) => {
        if (selectedDate) {
            if (setDateFlag === 'start') {
                this.setState({
                    selectedStartDate: selectedDate,
                });
            } else if (setDateFlag === 'end') {
                this.setState({
                    selectedEndDate: selectedDate,
                });
            }
        }
    };

    _cllbackSetSelectedExperieceResponse = (selectedExperieceResponse) => {
        if (selectedExperieceResponse) {
            this.setState({
                selectedExperieceResponse: selectedExperieceResponse,
            });
        }
    };

    _cllbackSetRewardResponse = (reward) => {
        if (reward) {
            this.setState({
                reward: reward.reward,
                selectedRewardShow: this._getReward(reward.reward),
            });
        }
    };

    _getReward = (reward) => {
        if (reward && reward.rewardMoney > 0) {
            let resultStr = '￥';
            resultStr = resultStr.concat(reward.rewardMoney);
            if (reward.paramsMeitinaSlected) {
                resultStr = resultStr.concat('/每天');
            } else if (reward.paramsZongjiaSlected) {
                resultStr = resultStr.concat('/总价');
            }
            resultStr = resultStr.concat('  ');
            if (reward.provideBoard) {
                resultStr = resultStr.concat('/包吃');
            }
            if (reward.provideRoom) {
                resultStr = resultStr.concat('/包住');
            }
            return resultStr;
        }
        return '';
    };


    _onWorkDescriptionInputParamsChange = (text) => {
        this.setState({
            selectedWorkDescription: text,
        });
    };
    _onWorkAddressInputParamsChange = (text) => {
        this.setState({
            selectedWorkAddress: text,
        });
    };
    _onWorkEmployNumsInputParamsChange = (text) => {
        this.setState({
            selectedWorkEmployNums: text,
        });
    };
    _onWorkEmployerPhoneInputParamsChange = (text) => {
        this.setState({
            selectedWorkEmployerPhone: text,
        });
    };

    _createOrderInNetWork = (selectedPushHireType) => {
        if (!this.props.selectedTag && !this.state.selectedWokerType) {
            ToastManager.show('请选择工作种类！', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            return;
        }
        if (!this.state.selectedProvince || !this.state.selectedCity || !this.state.selectedAreaAndCounty) {
            ToastManager.show('请选择工作地点！', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            return;
        }
        if (!this.state.selectedWorkAddress) {
            ToastManager.show('请填写工作地址！', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            return;
        }
        if (!this.state.selectedStartDate) {
            ToastManager.show('请选择开始时间！', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            return;
        }
        if (!this.state.selectedEndDate) {
            ToastManager.show('请选择结束时间！', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            return;
        }
        if (!DateCommonUtil.isAAfterB(this.state.selectedEndDate, this.state.selectedStartDate)) {
            ToastManager.show('结束时间必须在开始时间之后，请重新选择！', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            return;
        }
        if (!this.props.selectedTag && !this.state.selectedExperieceResponse) {
            ToastManager.show('请选择经验要求！', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            return;
        }
        if (!this.props.selectedTag && !this.state.selectedWorkEmployNums) {
            ToastManager.show('请填写招聘人数！', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            return;
        }
        if (!this.state.reward || this.state.reward.rewardMoney <= 0) {
            ToastManager.show('请填写待遇福利！', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            return;
        }

        DialogManagerUtil.showNormalLoadingDialog();
        this.state.workOrderPushType = selectedPushHireType;
        this.setState({
            selectedPushHireType: selectedPushHireType,
        });
        //直接招聘指定工人
        if (this.props.selectedTag && this.props.selectedTag === 'fastCreate') {
            let params = {
                employerId: this.props.mobileUserData.data.id,
                workOrder: {
                    workEmployerId: this.props.mobileUserData.data.id,
                    workEmployerPhone: this.props.mobileUserData.data.phone,
                    orderWokerTypeId: this.state.selectedWokerType.id,
                    orderWokerTypeName: this.state.selectedWokerType.name,
                    workStartTime: this.state.selectedStartDate,
                    workStopTime: this.state.selectedEndDate,
                    workExperienceRequireType: this.state.selectedExperieceResponse.id,
                    workExperienceRequireTypeDesc: this.state.selectedExperieceResponse.description,
                    workNeedEmplpyeeNums: this.state.selectedWorkEmployNums,
                    workDescription: this.state.selectedWorkDescription,
                    areaCountryPkId: 1,//默认1表示CN
                    areaProvincePkId: this.state.selectedProvince.pkId,
                    areaCityPkId: this.state.selectedCity.pkId,
                    areaAreaAndCountyPkId: this.state.selectedAreaAndCounty.pkId,
                    workAddress: this.state.selectedProvince.regionName + this.state.selectedCity.regionName + this.state.selectedAreaAndCounty.regionName + this.state.selectedWorkAddress,
                    workOrderPushType: this.state.workOrderPushType,
                },
                reward: this.state.reward,
                wokerType: this.props.selectedWokerType,
                workEx: this.props.selectedWorkExp,
                wokers: this.props.selectedWokers,
            };
            NetworkCommonUtil.httpPostRequest(JSON.stringify(params), NetworkCommonUtil.SERVERURL_API_MOBILE_ORDER_EMPLOY_EMPLOYER_SEND_INVITS_BY_CREATE_NEW_ORDER).then((val: any) => {
                // alert(JSON.stringify(val));
                DialogManagerUtil.hide();
                if (val && val.code === NetworkCommonUtil.SERVER_HTTP_TASK_STATUS_SUCCESS) {
                    // this._pushCompoentToSuccess()
                    if (this.props.onSuccess) {
                        this.props.onSuccess(this.state.selectedPushHireType);
                    }
                } else if (val) {
                    ToastManager.alertWithSure('提示', val.msg, () => {
                    });
                    // alert(JSON.stringify(val));
                    // if (this.props.onError) {
                    //     this.props.onError(this.state.selectedPushHireType, val);
                    // }
                } else {
                    ToastManager.show('请求网络出错' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
                }
            });
        } else {
            let params = {
                workOrder: {
                    workEmployerId: this.props.mobileUserData.data.id,
                    workEmployerPhone: this.props.mobileUserData.data.phone,
                    orderWokerTypeId: this.state.selectedWokerType.id,
                    orderWokerTypeName: this.state.selectedWokerType.name,
                    workStartTime: this.state.selectedStartDate,
                    workStopTime: this.state.selectedEndDate,
                    workExperienceRequireType: this.state.selectedExperieceResponse.id,
                    workExperienceRequireTypeDesc: this.state.selectedExperieceResponse.description,
                    workNeedEmplpyeeNums: this.state.selectedWorkEmployNums,
                    workDescription: this.state.selectedWorkDescription,
                    areaCountryPkId: 1,//默认1表示CN
                    areaProvincePkId: this.state.selectedProvince.pkId,
                    areaCityPkId: this.state.selectedCity.pkId,
                    areaAreaAndCountyPkId: this.state.selectedAreaAndCounty.pkId,
                    workAddress: this.state.selectedProvince.regionName + this.state.selectedCity.regionName + this.state.selectedAreaAndCounty.regionName + this.state.selectedWorkAddress,
                    workOrderPushType: this.state.workOrderPushType,
                },
                workOrderReward: this.state.reward,
            };
            NetworkCommonUtil.httpPostRequest(JSON.stringify(params), NetworkCommonUtil.SERVERURL_SYS_ORDER_CREATE_POST).then((val: any) => {
                // alert(JSON.stringify(val));
                DialogManagerUtil.hide();
                if (val && val.code === NetworkCommonUtil.SERVER_HTTP_TASK_STATUS_SUCCESS) {
                    // this._pushCompoentToSuccess()
                    if (this.props.onSuccess) {
                        this.props.onSuccess(this.state.selectedPushHireType);
                    }
                } else if (val) {
                    ToastManager.alertWithSure('提示', val.msg, () => {
                    });
                    // alert(JSON.stringify(val));
                    // if (this.props.onError) {
                    //     this.props.onError(this.state.selectedPushHireType, val);
                    // }
                } else {
                    ToastManager.show('请求网络出错' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
                }
            });
        }
    };

    //页面跳转
    _pushCompoent = (component: Component, params: any) => {

        this.props.navigator.push({
            component: component,
            params: params,
        });
    };

    _onbackPress = () => {
        if (this.props.headerJustCllBack && this.props.headerOnbackPress) {
            this.props.headerOnbackPress();
        }
    };

    render() {
        const {navigator} = this.props.navigator;
        return (
            <View style={styles.container}>

                <HeaderCommonView navigator={this.props.navigator}
                                  bgColor={'#FFCC33'}
                                  justCllBack={this.props.headerJustCllBack}
                                  onbackPress={() => this._onbackPress()}
                                  headerLeftShow={true}
                                  headerCenterShow={true}
                                  headerRightShow={false}
                                  showCenterAfterLeft={true}
                                  headerCenterTitle={this.props.selectedShowTitle ? this.props.selectedShowTitle : '发布工作'}/>
                <ScrollView
                    style={PushNromalHireScreenStyles.function_list}
                    contentContainerStyle={PushNromalHireScreenStyles.function_list_contentContainer}>
                    <View style={{height: 10, backgroundColor: 'transparent',}}/>
                    {this.props.selectedWokerType ?
                        <HireEmployeeItem
                            itemOnpress={() => {
                            }}
                            leftTitle={'工作种类'}
                            rightType={'next'}
                            rightShowTitle={this.state.selectedWokerTypeShow}
                            bottomViewHeight={9.6}
                        />

                        :
                        <HireEmployeeItem
                            itemOnpress={() => this._pushCompoent(WorkTypeHireScreen, {cllbackSetSelectedWokerType: this._cllbackSetSelectedWokerType})}
                            leftTitle={'工作种类'}
                            rightType={'next'}
                            rightShowTitle={this.state.selectedWokerTypeShow}
                            rightNextImage={require('../../../../../stable/image/ic_app_more.png')}
                            bottomViewHeight={9.6}
                        />
                    }


                    <HireEmployeeItem
                        leftTitle={'工作描述'}
                        rightType={'input'}
                        onInputParamsChange={(text) => this._onWorkDescriptionInputParamsChange(text)}
                        rightShowTitle={this.state.selectedWorkDescription}
                        rightInputPlaceholder={'请输入您的工作描述'}
                        bottomViewHeight={2}
                    />

                    <HireEmployeeItem
                        itemOnpress={() => this._pushCompoent(ResgionChoiceHireScreen, {cllbackSetSelectedAddress: this._cllbackSetSelectedAddress})}
                        leftTitle={'工作地点'}
                        rightType={'next'}
                        rightShowTitle={this.state.selectedAddressShow}
                        rightNextImage={require('../../../../../stable/image/ic_app_more.png')}
                        bottomViewHeight={2}
                    />

                    <HireEmployeeItem
                        leftTitle={'工作地址'}
                        rightType={'input'}
                        onInputParamsChange={(text) => this._onWorkAddressInputParamsChange(text)}
                        rightShowTitle={this.state.selectedWorkAddress}
                        rightInputPlaceholder={'请输较详细的地址：如XXX路（街道）XXX号 XXX公司'}
                        bottomViewHeight={2}
                    />
                    <HireEmployeeItem
                        itemOnpress={() => this._pushCompoent(DateChoiceCommonScreen, {
                            setDataFlag: 'start',
                            cllbackSetSelectedDate: this._cllbackSetSelectedDate
                        })}
                        leftTitle={'开始时间'}
                        rightType={'next'}
                        rightShowTitle={this.state.selectedStartDate ? format(this.state.selectedStartDate, 'YYYY-MM-DD') : ''}
                        rightNextImage={require('../../../../../stable/image/ic_app_more.png')}
                        bottomViewHeight={2}
                    />
                    <HireEmployeeItem
                        itemOnpress={() => this._pushCompoent(DateChoiceCommonScreen, {
                            setDataFlag: 'end',
                            cllbackSetSelectedDate: this._cllbackSetSelectedDate
                        })}
                        leftTitle={'结束时间'}
                        rightType={'next'}
                        rightShowTitle={this.state.selectedEndDate ? format(this.state.selectedEndDate, 'YYYY-MM-DD') : ''}
                        rightNextImage={require('../../../../../stable/image/ic_app_more.png')}
                        bottomViewHeight={9.6}
                    />
                    {this.props.selectedWorkExp ?
                        <HireEmployeeItem
                            itemOnpress={() => {
                            }}
                            leftTitle={'经验要求'}
                            rightType={'next'}
                            rightShowTitle={this.props.selectedWorkExp ? this.props.selectedWorkExp.description : ''}
                            bottomViewHeight={2}
                        />
                        :
                        <HireEmployeeItem
                            itemOnpress={() => this._pushCompoent(ExperienceRequireTypeHireScreen, {cllbackSetSelectedExperienceType: this._cllbackSetSelectedExperieceResponse})}
                            leftTitle={'经验要求'}
                            rightType={'next'}
                            rightShowTitle={this.state.selectedExperieceResponse ? this.state.selectedExperieceResponse.description : ''}
                            rightNextImage={require('../../../../../stable/image/ic_app_more.png')}
                            bottomViewHeight={2}
                        />
                    }

                    {this.props.selectedWokers ?
                        <HireEmployeeItem
                            itemOnpress={() => {
                            }}
                            rightType={'next'}
                            leftTitle={'招聘人数'}
                            rightShowTitle={this.state.selectedWorkEmployNums}
                            bottomViewHeight={2}
                        />
                        :
                        <HireEmployeeItem
                            leftTitle={'招聘人数'}
                            rightType={'input'}
                            onInputParamsChange={(text) => this._onWorkEmployNumsInputParamsChange(text)}
                            keyboardTypeIn={'numeric'}
                            rightShowTitle={this.state.selectedWorkEmployNums}
                            rightInputPlaceholder={'请输入招聘人数'}
                            bottomViewHeight={2}
                        />
                    }
                    <HireEmployeeItem
                        itemOnpress={() => this._pushCompoent(RewardEditHireScreen, {cllbackSetRewardResponse: this._cllbackSetRewardResponse})}
                        leftTitle={'福利待遇'}
                        rightType={'next'}
                        rightShowTitle={this.state.selectedRewardShow}
                        rightNextImage={require('../../../../../stable/image/ic_app_more.png')}
                        bottomViewHeight={1}
                    />
                    <HireEmployeeItem
                        itemOnpress={() => {
                        }}
                        rightType={'next'}
                        leftTitle={'联系电话'}
                        rightShowTitle={this.state.selectedWorkEmployerPhone}
                        bottomViewHeight={56}
                    />
                </ScrollView>
                {this.props.selectedWokers ?
                    <HireEmployeeBottom
                        showForOneFunction={true}
                        leftShowTitle={'直接招聘'}
                        onLeftViewPress={() => this._createOrderInNetWork(2)}
                    />
                    :
                    <HireEmployeeBottom
                        leftShowTitle={'紧急发布'}
                        onLeftViewPress={() => this._createOrderInNetWork(1)}
                        rightShowTitle={'普通发布'}
                        onRightViewPress={() => this._createOrderInNetWork(0)}
                    />
                }
            </View>
        );

    }

}

PushNromalHireScreenStyles = StyleSheet.create({
    //基于flex-box布局
    container: {
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
    function_header_container: {
        flexDirection: 'row',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FFCC33',
        justifyContent: 'center',
        alignItems: 'center',
    },
    function_list_container: {
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FBFBFB',
    },

});