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
} from 'react-native';

const {
    width,
    height
} = Dimensions.get('window');

import HeaderCommonView from '../../../../views/header/header.common.view'
import NetworkCommonUtil from '../../../../../utils/network.common.util'
import UserDataManager from '../../../../../utils/storage/user.data.manager.common.util'
import ToastManager from '../../../../../utils/toast/Toast.util'
import DialogManagerUtil from '../../../../views/dialog/dialog.manager.util'
import CommonListItemView from '../../../../views/common/common.list.item.view'


import parse from 'date-fns/parse';
import format from 'date-fns/format'
import InputScrollView from 'react-native-input-scroll-view';
import styles from '../../plugin.common.style'
import hireStyles from '../../hire/hire.main.style'
import WorkTypeHireScreen from '../../hire/workType/work.type.hire.screen'
import ExperienceRequireTypeHireScreen from '../../hire/experience/experience.type.hire.screen'
import ResgionChoiceHireScreen from '../../hire/region/region.choice.hire.screen'
import PushSuccessHireScreen from '../../hire/hireSuccess/push.success.hire.screen'
import DateChoiceCommonScreen from '../../common/date.choice.common.screen'
import RewardEditHireScreen from '../../hire/reward/reward.edit.hire.screen'
import BaseActivity from "../../../../views/base.activity";


class FindEmployeeItem extends Component {
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
                                style={{height: 48, flex: 1}}
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

class FindEmployeeBottom extends Component {
    render() {
        return (
            <View style={hireStyles.bottomView}>
                <TouchableOpacity
                    onPress={this.props.onLeftViewPress}
                    style={hireStyles.bottomItemView}>
                    <Text style={hireStyles.bottomItemViewText}>{this.props.leftShowTitle}</Text>
                </TouchableOpacity>
                <View style={{width: 1.20, height: 36, backgroundColor: '#FFFFFF'}}/>
                <TouchableOpacity
                    onPress={this.props.onRightViewPress}
                    style={hireStyles.bottomItemView}>
                    <Text style={hireStyles.bottomItemViewText}>{this.props.rightShowTitle}</Text>
                </TouchableOpacity>
            </View>
        );
    }
}


export default class CreateWorkNromalForFindMainScreen extends BaseActivity {

    constructor(props) {
        super(props);
        this.state = {
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
                selectedWokerTypeShow: selectedWokerType.name,
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
        this.state.workOrderPushType = selectedPushHireType;
        this.setState({
            selectedPushHireType: selectedPushHireType,
        });
        let paramsObject = {
            "workOrder": {
                orderWokerTypeId: this.state.selectedWokerType.id,
                orderWokerTypeName: this.state.selectedWokerType.name,
                workStartTime: this.state.selectedStartDate,
                workStopTime: this.state.selectedEndDate,
                workExperienceRequireType: this.state.selectedExperieceResponse.id,
                workNeedEmplpyeeNums: this.state.selectedWorkEmployNums,
                workDescription: this.state.selectedWorkDescription,
                workEmployerId: this.props.mobileUserData.id,
                areaCountryPkId: 1,//默认1表示CN
                areaProvincePkId: this.state.selectedProvince.pkId,
                areaCityPkId: this.state.selectedCity.pkId,
                areaAreaAndCountyPkId: this.state.selectedAreaAndCounty.pkId,
                workAddress: this.state.selectedWorkAddress,
                workOrderPushType: this.state.workOrderPushType,
            },
            "workOrderReward": this.state.reward
        };
        NetworkCommonUtil.httpPostRequest(JSON.stringify(paramsObject), NetworkCommonUtil.SERVERURL_SYS_ORDER_CREATE_POST).then((val: any) => {
            // alert(JSON.stringify(val));
            if (val.code === 1001) {
                // this._pushCompoentToSuccess()
                if (this.props.onSuccess) {
                    this.props.onSuccess(this.state.selectedPushHireType);
                }
            } else {
                // alert(JSON.stringify(val));
                if (this.props.onError) {
                    this.props.onError(this.state.selectedPushHireType, val);
                }
            }
        });
    };

    //页面跳转
    _pushCompoent = (component: Component, params: any) => {

        this.props.navigator.push({
            component: component,
            params: params,
        });
    }

    render() {
        const {navigator} = this.props.navigator;
        return (
            <View style={styles.container}>
                <HeaderCommonView navigator={this.props.navigator}
                                  headerLeftShow={true}
                                  headerCenterShow={true}
                                  headerRightShow={false}
                                  headerCenterTitle={'创建工作'}/>
                <InputScrollView>
                    <View style={{height: 10, backgroundColor: 'transparent',}}/>
                    <FindEmployeeItem
                        itemOnpress={() => this._pushCompoent(WorkTypeHireScreen, {cllbackSetSelectedWokerType: this._cllbackSetSelectedWokerType})}
                        itemHeight={56}
                        leftTitle={'工种'}
                        rightType={'next'}
                        rightShowTitle={this.state.selectedWokerTypeShow}
                        rightNextImage={require('../../../../../stable/image/ic_app_more.png')}
                        bottomViewHeight={9.6}
                    />

                    <FindEmployeeItem
                        leftTitle={'工作描述'}
                        rightType={'input'}
                        onInputParamsChange={(text) => this._onWorkDescriptionInputParamsChange(text)}
                        rightShowTitle={this.state.selectedWorkDescription}
                        rightInputPlaceholder={'请输入您的工作描述'}
                        bottomViewHeight={2}
                    />

                    <FindEmployeeItem
                        itemOnpress={() => this._pushCompoent(ResgionChoiceHireScreen, {cllbackSetSelectedAddress: this._cllbackSetSelectedAddress})}
                        leftTitle={'工作地点'}
                        rightType={'next'}
                        rightShowTitle={this.state.selectedAddressShow}
                        rightNextImage={require('../../../../../stable/image/ic_app_more.png')}
                        bottomViewHeight={2}
                    />

                    <FindEmployeeItem
                        leftTitle={'工作地址'}
                        rightType={'input'}
                        onInputParamsChange={(text) => this._onWorkAddressInputParamsChange(text)}
                        rightShowTitle={this.state.selectedWorkAddress}
                        rightInputPlaceholder={'请输较详细的地址：如XXX路（街道）XXX号 XXX公司'}
                        bottomViewHeight={2}
                    />
                    <FindEmployeeItem
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
                    <FindEmployeeItem
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
                    <FindEmployeeItem
                        itemOnpress={() => this._pushCompoent(ExperienceRequireTypeHireScreen, {cllbackSetSelectedExperienceType: this._cllbackSetSelectedExperieceResponse})}
                        leftTitle={'经验要求'}
                        rightType={'next'}
                        rightShowTitle={this.state.selectedExperieceResponse ? this.state.selectedExperieceResponse.description : ''}
                        rightNextImage={require('../../../../../stable/image/ic_app_more.png')}
                        bottomViewHeight={2}
                    />
                    <FindEmployeeItem
                        leftTitle={'招聘人数'}
                        rightType={'input'}
                        onInputParamsChange={(text) => this._onWorkEmployNumsInputParamsChange(text)}
                        keyboardTypeIn={'numeric'}
                        rightShowTitle={this.state.selectedWorkEmployNums}
                        rightInputPlaceholder={'请输入招聘人数'}
                        bottomViewHeight={2}
                    />
                    <FindEmployeeItem
                        itemOnpress={() => this._pushCompoent(RewardEditHireScreen, {cllbackSetRewardResponse: this._cllbackSetRewardResponse})}
                        leftTitle={'待遇'}
                        rightType={'next'}
                        rightShowTitle={this.state.selectedRewardShow}
                        rightNextImage={require('../../../../../stable/image/ic_app_more.png')}
                        bottomViewHeight={1}
                    />
                    <FindEmployeeItem
                        leftTitle={'联系方式'}
                        rightType={'input'}
                        onInputParamsChange={(text) => this._onWorkEmployerPhoneInputParamsChange(text)}
                        keyboardTypeIn={'phone-pad'}
                        rightShowTitle={this.state.selectedWorkEmployerPhone}
                        rightInputPlaceholder={'请输入您的联系电话'}
                        bottomViewHeight={56}
                    />
                    <FindEmployeeBottom
                        leftShowTitle={'紧急发布'}
                        onLeftViewPress={() => this._createOrderInNetWork(1)}
                        rightShowTitle={'普通发布'}
                        onRightViewPress={() => this._createOrderInNetWork(0)}
                    />
                </InputScrollView>
            </View>
        );

    }

}


