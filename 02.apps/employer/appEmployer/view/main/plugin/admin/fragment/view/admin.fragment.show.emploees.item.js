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
import MobileOrderEmoloyUtils from '../../../../../../stable/json/mobile.order.emoloy'

export default class AdminFragmentShowEmploeesItem extends PureComponent {

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
        return (<View style={[AdminFragmentShowEmploeesItemStyles.container_view, {
            flex: 1,
            flexDirection: 'row',
            alignItems: 'center',
        }]}>
            <Text style={[AdminFragmentShowEmploeesItemStyles.normal_text, {
                marginLeft: 4.8,
                padding: 4.8,
                // backgroundColor: '#AEC7F2'
            }]}
                  numberOfLines={1}
                  ellipsizeMode={'tail'}
            >{this.props.itemData && this.props.itemData.user ? this.props.itemData.user.name : '未知'}</Text>
            <Text style={[AdminFragmentShowEmploeesItemStyles.normal_text, {
                fontSize: 12,
                marginLeft: 4.8,
                padding: 4.8,
                backgroundColor: '#AEC7F2'
            }]}
                  numberOfLines={1}
                  ellipsizeMode={'tail'}
            >{this._gener_male_show(this.props.itemData && this.props.itemData.rnaOrder ? this.props.itemData.rnaOrder.userIdCardNo : null)}</Text>
            <Text style={[AdminFragmentShowEmploeesItemStyles.normal_text, {
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
        return (<View style={[AdminFragmentShowEmploeesItemStyles.container_view, {
            flex: 1,
            flexDirection: 'row',
            alignItems: 'center',
        }]}>
            <Text style={[AdminFragmentShowEmploeesItemStyles.normal_text, {
                fontSize: 12,
                marginLeft: 4.8,
                padding: 4.8,
            }]}
                  numberOfLines={1}
                  ellipsizeMode={'tail'}
            >评分：</Text>
            <Image
                source={this._gener_appraise_show(this.props.itemData && this.props.itemData.user ? this.props.itemData.user.score : 5.0, 1.0)}
                style={[AdminFragmentShowEmploeesItemStyles.container_view_img_pj, {}]}
            />
            <Image
                source={this._gener_appraise_show(this.props.itemData && this.props.itemData.user ? this.props.itemData.user.score : 5.0, 2.0)}
                style={[AdminFragmentShowEmploeesItemStyles.container_view_img_pj, {}]}
            />
            <Image
                source={this._gener_appraise_show(this.props.itemData && this.props.itemData.user ? this.props.itemData.user.score : 5.0, 3.0)}
                style={[AdminFragmentShowEmploeesItemStyles.container_view_img_pj, {}]}
            />
            <Image
                source={this._gener_appraise_show(this.props.itemData && this.props.itemData.user ? this.props.itemData.user.score : 5.0, 4.0)}
                style={[AdminFragmentShowEmploeesItemStyles.container_view_img_pj, {}]}
            />
            <Image
                source={this._gener_appraise_show(this.props.itemData && this.props.itemData.user ? this.props.itemData.user.score : 5.0, 5.0)}
                style={[AdminFragmentShowEmploeesItemStyles.container_view_img_pj, {}]}
            />
            <Text style={[AdminFragmentShowEmploeesItemStyles.normal_text, {
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
        return (<View style={[AdminFragmentShowEmploeesItemStyles.container_view, {
            flex: 1,
            flexDirection: 'row',
            alignItems: 'flex-end',
        }]}>
            <Text style={[AdminFragmentShowEmploeesItemStyles.normal_text, {
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
            <Text style={[AdminFragmentShowEmploeesItemStyles.normal_text, {
                fontSize: 12,
                marginLeft: 4.8,
                padding: 4.8,
                backgroundColor: '#0088F3'
            }]}
                  numberOfLines={1}
                  ellipsizeMode={'tail'}
            >{this._gener_work_type_show(this.props.itemData && this.props.itemData.workTypes ? this.props.itemData.workTypes : null, 1)}</Text>
            <Text style={[AdminFragmentShowEmploeesItemStyles.normal_text, {
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

    _gener_right_location_view = () => {
        //存在雇员关系，并且雇员已经确定开工，并且雇员没有下工
        return (
            <View style={[AdminFragmentShowEmploeesItemStyles.container_view, {
                flex: 1.25,
                flexDirection: 'column',
                marginRight: 9.6,
                alignItems: 'flex-end',
                justifyContent: 'flex-start',
            }]}>
                {this.props.showFuntion && this.props.itemData && this.props.itemData.employerWorkConfirm === 1 && this.props.itemData.employeeWorkStart === 1 && this.props.itemData.employeeWorkEnd === 0 ?
                    <View style={[{
                        backgroundColor: '#0088F3',
                        borderColor: '#0088F3',
                        borderTopLeftRadius: 9.6,
                        borderBottomLeftRadius: 9.6,
                        borderTopRightRadius: 9.6,
                        borderBottomRightRadius: 9.6,
                        paddingLeft: 4.8,
                        paddingRight: 4.8,
                        paddingTop: 2.4,
                        paddingBottom: 2.4,
                    }]}>
                        <Text style={[AdminFragmentShowEmploeesItemStyles.normal_text, {
                            fontSize: 12,
                            color: '#FFFFFF',
                        }]}
                              numberOfLines={1}
                              ellipsizeMode={'tail'}
                        >工作中</Text>
                    </View>
                    : <View/>
                }
            </View>);
    };


    _gener_bottom_function_view = () => {
        if (this.props.showFuntion) {

            return (
                <View style={[AdminFragmentShowEmploeesItemStyles.container_view, {
                    flex: 1,
                    flexDirection: 'row',
                    marginBottom: 9.6,
                }]}>
                    <TouchableOpacity
                        style={[AdminFragmentShowEmploeesItemStyles.container_view, {
                            flex: 1,
                            flexDirection: 'column',
                            alignItems: 'center',
                            justifyContent: 'center',
                            backgroundColor: 'transparent',
                            borderRadius: 4.8,
                            borderColor: '#666666',
                            borderWidth: 1,
                            marginRight: 9.6,
                            marginLeft: 9.6,
                            padding: 7.2,
                        }]}
                        onPress={this.props.onShowDetialPressed}
                    >
                        <Text style={[AdminFragmentShowEmploeesItemStyles.normal_text, {
                            marginLeft: 4.8,
                            color: '#666666',
                            fontSize: 14,
                        }]}
                              numberOfLines={1}
                              ellipsizeMode={'tail'}
                        >查看简历</Text>
                    </TouchableOpacity>

                    <TouchableOpacity
                        style={[AdminFragmentShowEmploeesItemStyles.container_view, {
                            flex: 1,
                            flexDirection: 'column',
                            alignItems: 'center',
                            justifyContent: 'center',
                            borderRadius: 4.8,
                            borderWidth: 1,
                            marginRight: 9.6,
                            marginLeft: 9.6,
                            padding: 7.2,
                        }, this.props.rightIemShowBgColor ?
                            {
                                backgroundColor: this.props.rightIemShowBgColor,
                                borderColor: this.props.rightIemShowBgColor,
                            }
                            :
                            {
                                backgroundColor: '#FFCC33',
                                borderColor: '#FFCC33',
                            }
                        ]}
                        onPress={this.props.onShowManagePressed}
                    >
                        <Text style={[AdminFragmentShowEmploeesItemStyles.normal_text, {
                            marginLeft: 4.8,
                            color: '#FFFFFF',
                            fontSize: 14,
                        }]}
                              numberOfLines={1}
                              ellipsizeMode={'tail'}
                        >{this.props.itemFunctionData && this.props.itemFunctionData.show ? this.props.itemFunctionData.show :
                            this.props.rightIemShow ? this.props.rightIemShow :
                                ''}</Text>
                    </TouchableOpacity>

                </View>);
        } else {
            return (<View/>);
        }
    };

    render() {
        return (
            <View style={AdminFragmentShowEmploeesItemStyles.container}
                  onPress={this.props.onSelectPress}
            >
                <View style={AdminFragmentShowEmploeesItemStyles.container_in}>
                    <View style={[AdminFragmentShowEmploeesItemStyles.container_view, {
                        flex: 2,
                        alignItems: 'center',
                        justifyContent: 'center',
                        marginLeft: 9.6,
                    }]}>
                        <Image
                            source={this.props.itemData && this.props.itemData.user && this.props.itemData.user.avatarUrl ?
                                {uri: this.props.itemData.user.avatarUrl}
                                : require('../../../../../../stable/image/app_a.png')
                            }
                            style={[AdminFragmentShowEmploeesItemStyles.container_view_img, {
                                flex: 1,
                                resizeMode: 'stretch',
                                height: 96,
                            }]}
                        />
                    </View>
                    <View style={[AdminFragmentShowEmploeesItemStyles.container_view, {
                        flex: 6,
                        flexDirection: 'column',
                    }]}>
                        {this._gener_center_top_view()}
                        {this._gener_center_center_view()}
                        {this._gener_center_bottom_view()}
                    </View>
                    {this._gener_right_location_view()}
                </View>
                {this._gener_bottom_function_view()}
                <View style={AdminFragmentShowEmploeesItemStyles.cut_line_view}/>
            </View>

        );
    }


}


AdminFragmentShowEmploeesItemStyles = StyleSheet.create({
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