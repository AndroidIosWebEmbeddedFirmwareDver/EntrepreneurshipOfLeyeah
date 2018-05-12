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
    Dimensions,
    ActivityIndicator,
    TouchableOpacity,
    StyleSheet,
} from 'react-native';

import styles from '../../plugin.common.style'

import HeaderCommonView from '../../../../views/header/header.common.view'
import NetworkCommonUtil from '../../../../../utils/network.common.util'
import UserDataManager from '../../../../../utils/storage/user.data.manager.common.util'
import ToastManager from '../../../../../utils/toast/Toast.util'
import DialogManagerUtil from '../../../../views/dialog/dialog.manager.util'
import CommonListItemView from '../../../../views/common/common.list.item.view'


import CommonHireStyles from '../common/common.hire.style'
import BaseActivity from "../../../../views/base.activity";


export default class RewardEditHireScreen extends BaseActivity {
    constructor(props) {
        super(props);
        this.state = {
            responValue: '',
            rewardMoney: 0,
            paramsMeitinaSlected: true,
            paramsZongjiaSlected: false,
            rewardType: 0,//默认0，0-每天，1-总价
            provideBoard: 0,//包吃,默认0，0-false，1-true
            provideRoom: 0,//包住,默认0，0-false，1-true
            provideBoardShow: false,//包吃,
            provideRoomShow: false,//包住,
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

    //keyExtractor tells the list to use the ids for the react keys instead of the default key property.
    _keyExtractor = (item, index) => item.id;

    initQueryData = () => {
        NetworkCommonUtil.httpGetRequest(NetworkCommonUtil.SERVERURL_SYS_WORK_TYPE).then((val: any) => {
            // alert(JSON.stringify(val));
            this.setState({responValue: val});
        });
    };
    _onParamsRewardMoneyChange = (text) => {

        this.state.rewardMoney = text;
        this.setState({
            rewardMoney: this.state.rewardMoney,
        });
    };
    _onParamMetianItemPress = () => {

        this.state.paramsMeitinaSlected = !this.state.paramsMeitinaSlected;
        this.setState({
            paramsMeitinaSlected: this.state.paramsMeitinaSlected,
            paramsZongjiaSlected: !this.state.paramsMeitinaSlected,
            rewardType: 0,
        });
    };
    _onParamZongjiaItemPress = () => {

        this.state.paramsZongjiaSlected = !this.state.paramsZongjiaSlected;
        this.setState({
            paramsZongjiaSlected: this.state.paramsZongjiaSlected,
            paramsMeitinaSlected: !this.state.paramsZongjiaSlected,
            rewardType: 1,
        });
    };
    _onParamBaochiItemPress = () => {

        this.state.provideBoardShow = !this.state.provideBoardShow;
        if (this.state.provideBoardShow) {
            this.state.provideBoard = 1;
        } else {

            this.state.provideBoard = 0;
        }
        this.setState({
            provideBoardShow: this.state.provideBoardShow,
            provideBoard: this.state.provideBoard,
        });
    };
    _onParamBaozhuItemPress = () => {

        this.state.provideRoomShow = !this.state.provideRoomShow;
        if (this.state.provideRoomShow) {
            this.state.provideRoom = 1;
        } else {

            this.state.provideRoom = 0;
        }
        this.setState({
            provideRoomShow: this.state.provideRoomShow,
            provideRoom: this.state.provideRoom,
        });
    };

    _renderCompontDownPress() {

        if (this.state.rewardMoney === 0) {
            ToastManager.show('你还没有输入待遇金额！', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
        } else {
            // alert(JSON.stringify(this.state.responValue));
            if (this.props.cllbackSetRewardResponse) {
                this.props.cllbackSetRewardResponse(
                    {
                        reward: {
                            rewardMoney: this.state.rewardMoney,
                            rewardType: this.state.rewardType,
                            paramsMeitinaSlected: this.state.paramsMeitinaSlected,
                            paramsZongjiaSlected: this.state.paramsZongjiaSlected,
                            provideBoard: this.state.provideBoard,
                            provideRoom: this.state.provideRoom,
                        }
                    });
            }
            this.props.navigator.pop();

        }
    }

    render() {
        const {navigator} = this.props.navigator;
        return (
            <View style={styles.container}>
                <HeaderCommonView navigator={this.props.navigator}
                                  headerLeftShow={true}
                                  headerCenterShow={true}
                                  headerRightShow={true}
                                  headerRightButtonTitle={'完成'}
                                  headerRightButtonOnpress={() => this._renderCompontDownPress()}
                                  headerCenterTitle={'编辑待遇'}/>
                <View style={RewardEditHireScreenStyles.itemContainer}>
                    <TextInput
                        style={[{height: 36, flex: 1, fontSize: 16}, {
                            padding: 0,
                        }]}
                        underlineColorAndroid="transparent"
                        placeholder={'请在此输入金额'}
                        onChangeText={(text) => this._onParamsRewardMoneyChange(text)}
                        clearButtonMode={'while-editing'}
                        keyboardType={'numeric'}
                        autoFocus={true}
                    />
                    <TouchableOpacity
                        style={{
                            flexDirection: 'row',
                            justifyContent: 'flex-start',
                            alignItems: 'center',
                            marginLeft: 9.6,
                        }}
                        onPress={() => this._onParamMetianItemPress()}
                    >
                        {this.state.paramsMeitinaSlected ?
                            <Image
                                source={require('../../../../../stable/image/ic_circle_selected.png')}
                                style={[CommonHireStyles.itemHeadContainerRight,
                                    {
                                        width: 18,
                                        height: 18,
                                    }
                                ]}
                            />
                            :
                            <Image
                                source={require('../../../../../stable/image/ic_circle_normal.png')}
                                style={[CommonHireStyles.itemHeadContainerRight,
                                    {
                                        width: 18,
                                        height: 18,
                                    }
                                ]}
                            />
                        }

                        <Text style={RewardEditHireScreenStyles.commonText}>每天</Text>
                    </TouchableOpacity>
                    <TouchableOpacity
                        style={{
                            flexDirection: 'row',
                            justifyContent: 'flex-start',
                            alignItems: 'center',
                            marginLeft: 9.6,
                        }}
                        onPress={() => this._onParamZongjiaItemPress()}
                    >
                        {this.state.paramsZongjiaSlected ?
                            <Image
                                source={require('../../../../../stable/image/ic_circle_selected.png')}
                                style={[CommonHireStyles.itemHeadContainerRight,
                                    {
                                        width: 18,
                                        height: 18,
                                    }
                                ]}
                            />
                            :
                            <Image
                                source={require('../../../../../stable/image/ic_circle_normal.png')}
                                style={[CommonHireStyles.itemHeadContainerRight,
                                    {
                                        width: 18,
                                        height: 18,
                                    }
                                ]}
                            />
                        }
                        <Text style={RewardEditHireScreenStyles.commonText}>总价</Text>
                    </TouchableOpacity>

                </View>

                <View style={RewardEditHireScreenStyles.itemContainer}>
                    <View style={{
                        height: 36,
                        flex: 1,
                        flexDirection: 'row',
                        justifyContent: 'flex-start',
                        alignItems: 'center',
                    }}>
                        <Text style={RewardEditHireScreenStyles.commonText}>福利</Text>
                    </View>
                    <TouchableOpacity
                        style={{
                            flexDirection: 'row',
                            justifyContent: 'flex-start',
                            alignItems: 'center',
                            marginLeft: 9.6,
                        }}
                        onPress={() => this._onParamBaochiItemPress()}
                    >
                        {this.state.provideBoardShow ?
                            <Image
                                source={require('../../../../../stable/image/ic_circle_selected.png')}
                                style={[CommonHireStyles.itemHeadContainerRight,
                                    {
                                        width: 18,
                                        height: 18,
                                    }
                                ]}
                            />
                            :
                            <Image
                                source={require('../../../../../stable/image/ic_circle_normal.png')}
                                style={[CommonHireStyles.itemHeadContainerRight,
                                    {
                                        width: 18,
                                        height: 18,
                                    }
                                ]}
                            />
                        }
                        <Text style={RewardEditHireScreenStyles.commonText}>包吃</Text>
                    </TouchableOpacity>
                    <TouchableOpacity
                        style={{
                            flexDirection: 'row',
                            justifyContent: 'flex-start',
                            alignItems: 'center',
                            marginLeft: 9.6,
                        }}
                        onPress={() => this._onParamBaozhuItemPress()}
                    >
                        {this.state.provideRoomShow ?
                            <Image
                                source={require('../../../../../stable/image/ic_circle_selected.png')}
                                style={[CommonHireStyles.itemHeadContainerRight,
                                    {
                                        width: 18,
                                        height: 18,
                                    }
                                ]}
                            />
                            :
                            <Image
                                source={require('../../../../../stable/image/ic_circle_normal.png')}
                                style={[CommonHireStyles.itemHeadContainerRight,
                                    {
                                        width: 18,
                                        height: 18,
                                    }
                                ]}
                            />
                        }
                        <Text style={RewardEditHireScreenStyles.commonText}>包住</Text>
                    </TouchableOpacity>
                </View>
                <Text style={{
                    marginTop: 9.6,
                    marginLeft: 9.6,
                    fontSize: 14,
                    color: '#9F9F9F'
                }}>注：可同时选择包吃、包住</Text>
            </View>
        );
    };
}

RewardEditHireScreenStyles = StyleSheet.create({
    itemContainer: {
        flexDirection: 'row',//row ,row-reverse ,column ('default') column-reverse
        width: window.width,
        backgroundColor: '#FFFFFF',
        alignItems: 'center',
        marginTop: 9.6,
        padding: 9.6,
    },
    itemHeadContainer: {
        flex: 1,
        flexDirection: 'row',//row ,row-reverse ,column ('default') column-reverse
        height: 56,
        backgroundColor: '#FFFFFF',
        alignItems: 'center',
    },
    commonText: {
        fontSize: 16,
    },
});