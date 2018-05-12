import React, {Component, PureComponent} from 'react';
import {
    Text,
    ScrollView,
    Image,
    Button,
    View,
    Platform,
    PixelRatio,
    Alert,
    Dimensions,
    ActivityIndicator,
    TouchableOpacity,
    StyleSheet,
    FlatList,
} from 'react-native';

const {
    width,
    height
} = Dimensions.get('window');

import PatterCommonUtil from '../../../../../../utils/patter/patter.common.util'
import DateCommonUtil from '../../../../../../utils/date.common.util'


export default class BillsListItemView extends PureComponent {

    //1.
    constructor(props) {
        super(props);
    }

    //2.
    componentWillMount() {
    }

    //3.
    //...
    //check the status of a single permission
    componentDidMount() {

    }

    _gener_center_top_view = () => {
        return (<View style={[BillsListItemViewStyles.container_view, {
            flex: 1,
            flexDirection: 'row',
            alignItems: 'center',
        }]}>
            <Text style={[BillsListItemViewStyles.normal_text, {
                marginLeft: 4.8,
                padding: 4.8,
                // backgroundColor: '#AEC7F2'
            }]}
                  numberOfLines={1}
                  ellipsizeMode={'tail'}
            >{this.props.itemData && this.props.itemData.user ? this.props.itemData.user.name : '未知'}</Text>
            <Text style={[BillsListItemViewStyles.normal_text, {
                fontSize: 12,
                marginLeft: 4.8,
                padding: 4.8,
                backgroundColor: '#AEC7F2'
            }]}
                  numberOfLines={1}
                  ellipsizeMode={'tail'}
            >{this._gener_male_show(this.props.itemData && this.props.itemData.rnaOrder ? this.props.itemData.rnaOrder.userIdCardNo : null)}</Text>
            <Text style={[BillsListItemViewStyles.normal_text, {
                fontSize: 12,
                marginLeft: 4.8,
                padding: 4.8,
                backgroundColor: '#D7A78C'
            }]}
                  numberOfLines={1}
                  ellipsizeMode={'tail'}
            >{this._gener_exprience_show(this.props.itemData && this.props.itemData.resume ? this.props.itemData.resume.workExperienceTypeDesc : null)}</Text>
        </View>);
    };

    _gener_male_show = (idCard: string) => {
        if (!idCard || idCard.length <= 0 || !PatterCommonUtil.isIdCard(idCard)) {
            return '未知';
        }
        let male = '未知';
        let maleValue = PatterCommonUtil.getIdCardSex(idCard);
        if (maleValue === 1) {
            male = '♂';
        } else if (maleValue === 0) {
            male = '♀';
        } else {
            male = '';
        }
        let age = PatterCommonUtil.getIdCardAge(idCard);
        return male + age;
    };

    _gener_exprience_show = (exprienceStr: string) => {
        if (!exprienceStr || exprienceStr.length <= 0) {
            return '未知';
        }
        if (exprienceStr.indexOf('1-3年') >= 0) {
            return '1-3年经验';
        } else if (exprienceStr.indexOf('3-5年') >= 0) {
            return '3-5年经验';
        } else if (exprienceStr.indexOf('5-10年') >= 0) {
            return '5-10年经验';
        } else if (exprienceStr.indexOf('10年以上') >= 0) {
            return '10年多经验';
        } else {
            return '1年经验';
        }
    };

    _gener_center_center_view = () => {
        return (<View style={[BillsListItemViewStyles.container_view, {
            flex: 1,
            flexDirection: 'row',
            alignItems: 'center',
        }]}>
            <Text style={[BillsListItemViewStyles.normal_text, {
                fontSize: 12,
                marginLeft: 4.8,
                padding: 4.8,
            }]}
                  numberOfLines={1}
                  ellipsizeMode={'tail'}
            >评分：</Text>
            <Image
                source={this._gener_appraise_show(this.props.itemData && this.props.itemData.user ? this.props.itemData.user.score : 5.0, 1.0)}
                style={[BillsListItemViewStyles.container_view_img_pj, {}]}
            />
            <Image
                source={this._gener_appraise_show(this.props.itemData && this.props.itemData.user ? this.props.itemData.user.score : 5.0, 2.0)}
                style={[BillsListItemViewStyles.container_view_img_pj, {}]}
            />
            <Image
                source={this._gener_appraise_show(this.props.itemData && this.props.itemData.user ? this.props.itemData.user.score : 5.0, 3.0)}
                style={[BillsListItemViewStyles.container_view_img_pj, {}]}
            />
            <Image
                source={this._gener_appraise_show(this.props.itemData && this.props.itemData.user ? this.props.itemData.user.score : 5.0, 4.0)}
                style={[BillsListItemViewStyles.container_view_img_pj, {}]}
            />
            <Image
                source={this._gener_appraise_show(this.props.itemData && this.props.itemData.user ? this.props.itemData.user.score : 5.0, 5.0)}
                style={[BillsListItemViewStyles.container_view_img_pj, {}]}
            />
            <Text style={[BillsListItemViewStyles.normal_text, {
                fontSize: 12,
                marginLeft: 4.8,
                padding: 4.8,
            }]}
                  numberOfLines={1}
                  ellipsizeMode={'tail'}
            >{this.props.itemData && this.props.itemData.user ? this.props.itemData.user.score : 5.0}分</Text>
        </View>);
    };

    _gener_appraise_show = (appraise: number, adjustValue: number) => {
        if (appraise <= 0 || adjustValue <= 0) {
            return (require('../../../../../../stable/image/main/find/ic_heart_bad.png'));
        }
        else if (appraise >= adjustValue) {
            return (require('../../../../../../stable/image/main/find/ic_heart_good.png'));
        }
        else if (appraise >= (adjustValue - 0.5)) {
            return (require('../../../../../../stable/image/main/find/ic_heart_half.png'));
        }
        else if (appraise < (adjustValue - 0.5)) {
            return (require('../../../../../../stable/image/main/find/ic_heart_bad.png'));
        } else {
            return (require('../../../../../../stable/image/main/find/ic_heart_bad.png'));
        }
    };
    _gener_center_bottom_view = () => {
        return (<View style={[BillsListItemViewStyles.container_view, {
            flex: 1,
            flexDirection: 'row',
            alignItems: 'flex-end',
        }]}>
            <Text style={[BillsListItemViewStyles.normal_text, {
                fontSize: 12,
                marginLeft: 4.8 * 2,
                padding: 4.8,
                backgroundColor: '#77CEE5',
                alignItems: 'center',
                justifyContent: 'center'
            }]}
                  numberOfLines={1}
                  ellipsizeMode={'tail'}
            >{this._gener_work_type_show(this.props.itemData && this.props.itemData.workTypes ? this.props.itemData.workTypes : null, 0)}</Text>
            <Text style={[BillsListItemViewStyles.normal_text, {
                fontSize: 12,
                marginLeft: 4.8,
                padding: 4.8,
                backgroundColor: '#0088F3'
            }]}
                  numberOfLines={1}
                  ellipsizeMode={'tail'}
            >{this._gener_work_type_show(this.props.itemData && this.props.itemData.workTypes ? this.props.itemData.workTypes : null, 1)}</Text>
            <Text style={[BillsListItemViewStyles.normal_text, {
                fontSize: 12,
                marginLeft: 4.8,
                padding: 4.8,
                backgroundColor: '#A15D3B'
            }]}
                  numberOfLines={1}
                  ellipsizeMode={'tail'}
            >{this._gener_work_type_show(this.props.itemData && this.props.itemData.workTypes ? this.props.itemData.workTypes : null, 2)}</Text>
        </View>);
    };

    _gener_work_type_show = (workTypes: any, index: number) => {
        if (!workTypes || workTypes.length <= 0 || index < 0 || workTypes.length <= index) {
            return '';
        }
        return workTypes[index].workTypeName;
    };

    _gener_bottom_rewards_view = () => {
        if (this.props.employ && this.props.rewards && this.props.order) {
            return (<View style={[BillsListItemViewStyles.container_view, {
                flex: 1,
                flexDirection: 'column',
                padding: 9.6,
            }]}>
                <View style={[BillsListItemViewStyles.cut_line_view, {
                    paddingLeft: 9.6,
                    paddingRight: 9.6,
                }]}/>
                <View
                    style={[BillsListItemViewStyles.container_view, {
                        flexDirection: 'column',
                        paddingLeft: 9.6,
                        paddingRight: 9.6,
                        paddingTop: 4.8,
                        paddingBottom: 4.8,
                    }]}
                    onPress={this.props.onShowPayPressed}
                >
                    <Text style={[BillsListItemViewStyles.normal_text, {
                        marginLeft: 4.8,
                        fontSize: 14,
                    }]}
                          numberOfLines={1}
                          ellipsizeMode={'tail'}
                    >时间：{this.props.order && this.props.order.workStartTime && this.props.order.workStopTime ? this.props.order.workStartTime + ' / ' + this.props.order.workStopTime : ''}</Text>
                </View>
                <View
                    style={[BillsListItemViewStyles.container_view, {
                        flexDirection: 'column',
                        paddingLeft: 9.6,
                        paddingRight: 9.6,
                        paddingTop: 4.8,
                        paddingBottom: 4.8,
                    }]}
                    onPress={this.props.onShowPayPressed}
                >
                    <Text style={[BillsListItemViewStyles.normal_text, {
                        marginLeft: 4.8,
                        fontSize: 14,
                    }]}
                          numberOfLines={1}
                          ellipsizeMode={'tail'}
                    >待遇：
                        {this.props.rewards ? '￥' + this.props.rewards.rewardMoney : ''}
                        {this.props.rewards ? this.props.rewards.rewardType === 0 ? ' / 每天' : ' / 总价' : ''}
                        {this.props.rewards ? this.props.rewards.provideBoard === 0 ? '' : ' / 包吃' : ''}
                        {this.props.rewards ? this.props.rewards.provideRoom === 0 ? '' : ' / 包住' : ''}
                    </Text>
                </View>
                <View
                    style={[BillsListItemViewStyles.container_view, {
                        flexDirection: 'column',
                        paddingLeft: 9.6,
                        paddingRight: 9.6,
                        paddingTop: 4.8,
                        paddingBottom: 4.8,
                    }]}
                    onPress={this.props.onShowPayPressed}
                >
                    <Text style={[BillsListItemViewStyles.normal_text, {
                        marginLeft: 4.8,
                        fontSize: 14,
                    }]}
                          numberOfLines={1}
                          ellipsizeMode={'tail'}
                    >合计：{this._gener_rewards_show()}</Text>
                </View>
            </View>);
        }
    };
    _gener_bottom_function_view = () => {
        if (this.props.employ && this.props.rewards) {
            //待支付
            if (this.props.employ.employerWorkConfirm === 1
                && this.props.employ.employeeWorkStart === 1
                && this.props.employ.employeeWorkEnd === 1
                && this.props.employ.employerPaidedWork === 0
            ) {
                return (<View style={[BillsListItemViewStyles.container_view, {
                    flex: 1,
                    flexDirection: 'row',
                    padding: 9.6,
                }]}>


                    <TouchableOpacity
                        style={[BillsListItemViewStyles.container_view, {
                            flex: 1,
                            flexDirection: 'column',
                            alignItems: 'center',
                            justifyContent: 'center',
                            backgroundColor: '#FFCC33',
                            borderRadius: 4.8,
                            borderColor: '#FFCC33',
                            borderWidth: 1,
                            marginRight: 9.6 / 2,
                            marginLeft: 9.6 / 2,
                            padding: 9.6,
                        }]}
                        onPress={this.props.onShowPayPressed}
                    >
                        <Text style={[BillsListItemViewStyles.normal_text, {
                            marginLeft: 4.8,
                            color: '#FFFFFF',
                            fontSize: 14,
                        }]}
                              numberOfLines={1}
                              ellipsizeMode={'tail'}
                        >立即支付{this._gener_rewards_show()}</Text>
                    </TouchableOpacity>

                </View>);
            }
            //已支付
            else if (this.props.employ.employerWorkConfirm === 1
                && this.props.employ.employeeWorkStart === 1
                && this.props.employ.employeeWorkEnd === 1
                && this.props.employ.employerPaidedWork === 1
            ) {
                return (<View style={[BillsListItemViewStyles.container_view, {
                    flex: 1,
                    flexDirection: 'row',
                    padding: 9.6,
                }]}>

                    <View
                        style={[BillsListItemViewStyles.container_view, {
                            flex: 1,
                            flexDirection: 'column',
                            alignItems: 'center',
                            justifyContent: 'center',
                            backgroundColor: '#0088F3',
                            borderRadius: 4.8,
                            borderColor: '#0088F3',
                            borderWidth: 1,
                            marginRight: 9.6 / 2,
                            marginLeft: 9.6 / 2,
                            padding: 9.6,
                        }]}
                    >
                        <Text style={[BillsListItemViewStyles.normal_text, {
                            marginLeft: 4.8,
                            color: '#FFFFFF',
                            fontSize: 14,
                        }]}
                              numberOfLines={1}
                              ellipsizeMode={'tail'}
                        >雇主已经支付{this._gener_rewards_show()}</Text>
                    </View>
                    <View
                        style={[BillsListItemViewStyles.container_view, {
                            flex: 1,
                            flexDirection: 'column',
                            alignItems: 'center',
                            justifyContent: 'center',
                            backgroundColor: this._gener_paied_color().bg,
                            borderRadius: 4.8,
                            borderColor: this._gener_paied_color().borderColor,
                            borderWidth: 1,
                            marginRight: 9.6 / 2,
                            marginLeft: 9.6 / 2,
                            padding: 9.6,
                        }]}
                    >
                        <Text style={[BillsListItemViewStyles.normal_text, {
                            marginLeft: 4.8,
                            color: this._gener_paied_color().text,
                            fontSize: 14,
                        }]}
                              numberOfLines={1}
                              ellipsizeMode={'tail'}
                        >{this._gener_paied_show()}</Text>
                    </View>


                </View>);
            }
        }

    };

    _gener_rewards_show = () => {
        if (!this.props.rewards && !this.props.order) {
            return '';
        }
        if (this.props.rewards.rewardType === 0) {//每天
            return (DateCommonUtil.twODaysDifferenceValue(this.props.order.workStopTime, this.props.order.workStartTime) + 1) * this.props.rewards.rewardMoney + '元';
        } else if (this.props.rewards.rewardType === 1) {//总价
            return this.props.rewards.rewardMoney + '元';
        }
    };

    _gener_paied_color = () => {
        if (!this.props.employ) {
            return {bg: '#FFFFFF', borderColor: '#0088F3', text: '#000000'};
        }
        if (this.props.employ.employeeWorkPaided === 0) {
            return {bg: '#FFFFFF', borderColor: '#0088F3', text: '#000000'};
        } else if (this.props.employ.employeeWorkPaided === 1) {
            return {bg: '#0088F3', borderColor: '#0088F3', text: '#FFFFFF'};
        } else if (this.props.employ.employeeWorkPaided === -1) {
            return {bg: '#FF0000', borderColor: '#FF0000', text: '#FFFFFF'};
        }
    };
    _gener_paied_show = () => {
        if (!this.props.employ) {
            return '';
        }
        if (this.props.employ.employeeWorkPaided === 0) {
            return '待雇员确定收款中';
        } else if (this.props.employ.employeeWorkPaided === 1) {
            return '雇员已经确定收款';
        } else if (this.props.employ.employeeWorkPaided === -1) {
            return '雇员拒绝确定收款';
        }
    };

    render() {
        return (
            <View style={BillsListItemViewStyles.container}
            >
                <View style={BillsListItemViewStyles.container_in}>
                    <View style={[BillsListItemViewStyles.container_view, {
                        flex: 2,
                        alignItems: 'center',
                        justifyContent: 'center',
                        backgroundColor: '#FFFFFF',
                        marginLeft: 9.6 * 2,
                    }]}>
                        <Image
                            source={this.props.itemData && this.props.itemData.user && this.props.itemData.user.avatarUrl ?
                                {uri: this.props.itemData.user.avatarUrl}
                                : require('../../../../../../stable/image/shareqrcode.png')
                            }
                            style={[BillsListItemViewStyles.container_view_img, {
                                flex: 1,
                                resizeMode: 'stretch',
                                height: 96,
                            }]}
                        />
                    </View>
                    <View style={[BillsListItemViewStyles.container_view, {
                        flex: 6,
                        flexDirection: 'column',
                    }]}>
                        {this._gener_center_top_view()}
                        {this._gener_center_center_view()}
                        {this._gener_center_bottom_view()}
                    </View>
                    <View style={[BillsListItemViewStyles.container_view, {
                        flex: 1.25,
                        flexDirection: 'column',
                    }]}>
                        <View style={[BillsListItemViewStyles.container_view, {
                            flex: 1,
                            flexDirection: 'row',
                            alignItems: 'center',
                            justifyContent: 'flex-end',
                        }]}>
                            <View style={[{
                                backgroundColor: '#0088F3',
                                borderColor: '#0088F3',
                                borderTopLeftRadius: 9.6,
                                borderBottomLeftRadius: 9.6,
                                borderTopRightRadius: 0,
                                borderBottomRightRadius: 0,
                                paddingLeft: 4.8,
                                paddingRight: 0,
                                paddingTop: 2.4,
                                paddingBottom: 2.4,
                            }]}>
                                <Text style={[BillsListItemViewStyles.normal_text, {
                                    fontSize: 12,
                                    color: '#FFFFFF',
                                }]}>已完成</Text>
                            </View>
                        </View>
                        <View style={[BillsListItemViewStyles.container_view, {
                            flex: 1,
                            flexDirection: 'column',
                        }]}>
                        </View>
                        <View style={[BillsListItemViewStyles.container_view, {
                            flex: 1,
                            flexDirection: 'column',
                        }]}>
                        </View>
                    </View>
                </View>
                {this._gener_bottom_rewards_view()}
                {this._gener_bottom_function_view()}
                <View style={BillsListItemViewStyles.cut_line_view}/>
            </View>

        );
    }


}


BillsListItemViewStyles = StyleSheet.create({
    //基于flex-box布局
    container: {
        flex: 1,
        minHeight: 96 + 9.6 * 2,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FFFFFF',
    },
    container_in: {
        flex: 1,
        flexDirection: 'row',//row ,row-reverse ,column ('default') column-reverse,
        paddingTop: 9.6,
        paddingBottom: 9.6,
    },
    container_view: {
        flex: 1,
        flexDirection: 'row',
    },
    container_view_img: {
        width: 24,
        height: 24,
    },
    container_view_img_pj: {
        width: 12,
        height: 12,
        resizeMode: 'stretch',
    },
    cut_line_view: {
        height: 2.4,
        backgroundColor: '#FBFBFB',
    },
    normal_text: {
        fontSize: 16,
    }
});