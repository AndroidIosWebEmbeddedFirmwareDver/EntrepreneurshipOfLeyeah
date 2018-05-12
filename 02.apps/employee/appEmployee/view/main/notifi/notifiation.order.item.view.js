import React, {PureComponent, Component} from 'react';

import {
    View,
    Text,
    Button,
    Platform,
    TouchableOpacity,
    Image,
    StyleSheet,
    Dimensions,
    PixelRatio,
} from 'react-native';

const {
    width,
    height
} = Dimensions.get('window');

export default class NotifiationOrderItemView extends PureComponent {

    /*
    数据原型
    private LeMobileWorkOrderEntity order;//1.订单
    private LeMobileWorkOrderRewardsEntity rewards;//2.报酬
    private LeMobileUserEntity employer;//3.雇主信息
    */

    //1.
    constructor(props) {
        super(props);
    }

    //2.
    componentWillMount() {
    }

    //3.
    componentDidMount() {

    }

    //4.
    render() {
        return (
            <View
                style={[NotifiationOrderItemViewStyles.root, this.props.rootBgColor ? {backgroundColor: this.props.rootBgColor} : '']}>
                <View style={NotifiationOrderItemViewStyles.cut_line}/>
                <View style={NotifiationOrderItemViewStyles.layout_container}>
                    <View
                        style={NotifiationOrderItemViewStyles.layout_container_container}>

                        <View style={[NotifiationOrderItemViewStyles.layout_container_item, {
                            justifyContent: 'flex-start',
                            alignItems: 'flex-start',
                            flex: 0,
                        }]}>
                            <Image
                                source={this.props.data && this.props.data.employer && this.props.data.employer.avatarUrl ? {uri: this.props.data.employer.avatarUrl} : require('../../../stable/image/main/ic_main_comp_normal.png')}
                                style={{width: 56, height: 56, resizeMode: 'center',}}
                            />
                        </View>
                        {/*head part2*/}
                        <View
                            style={[NotifiationOrderItemViewStyles.layout_container_item, {flex: 1.5,}]}>
                            <View style={NotifiationOrderItemViewStyles.layout_container_item_tem}>
                                <Text
                                    style={NotifiationOrderItemViewStyles.normal_text}>
                                    {this.props.data ? this.props.data.employer ? this.props.data.employer.name : '' : ''}
                                </Text>
                            </View>
                            <View style={NotifiationOrderItemViewStyles.layout_container_item_tem}>
                                <Text
                                    style={NotifiationOrderItemViewStyles.normal_text}>{this.props.data && this.props.data.order && this.props.data.order.orderWokerTypeName ? this.props.data.order.orderWokerTypeName : ''}</Text>
                                <Text
                                    style={NotifiationOrderItemViewStyles.normal_text}>评分:{this.props.data && this.props.data.employer && this.props.data.employer.score >= 0 ? this.props.data.employer.score : ''}</Text>
                            </View>
                        </View>
                        {/*head part3*/}
                        <View style={[NotifiationOrderItemViewStyles.layout_container_item, {
                            flex: 0.5,
                            justifyContent: 'flex-start',
                            alignItems: 'flex-end',
                        }]}>
                            <Text style={NotifiationOrderItemViewStyles.normal_text}>100m</Text>
                        </View>
                    </View>
                    <View
                        style={NotifiationOrderItemViewStyles.layout_container_container}>
                        <View style={NotifiationOrderItemViewStyles.layout_container_item}>
                            <View style={NotifiationOrderItemViewStyles.layout_container_item_tem}>
                                <Text
                                    style={[NotifiationOrderItemViewStyles.normal_text, {
                                        color: '#707070',
                                        fontSize: 12,
                                    }]}>时间：</Text>
                                <Text
                                    style={[NotifiationOrderItemViewStyles.normal_text, {
                                        marginBottom: 0,
                                        color: '#707070',
                                        fontSize: 12,
                                    }]}>
                                    {this.props.data && this.props.data.order && this.props.data.order.workStartTime ? this.props.data.order.workStartTime + ' ' : ''}
                                    /
                                    {this.props.data && this.props.data.order && this.props.data.order.workStopTime ? ' ' + this.props.data.order.workStopTime : ''}
                                </Text>
                            </View>
                        </View>
                        <View style={NotifiationOrderItemViewStyles.layout_container_item}>
                            <View style={NotifiationOrderItemViewStyles.layout_container_item_tem}>
                                <Text
                                    style={[NotifiationOrderItemViewStyles.normal_text, {
                                        color: '#707070',
                                        fontSize: 12,
                                    }]}>待遇：</Text>
                                <Text
                                    style={[NotifiationOrderItemViewStyles.normal_text, {
                                        marginBottom: 0,
                                        color: '#707070',
                                        fontSize: 12,
                                    }]}>
                                    {this.props.data && this.props.data.rewards && this.props.data.rewards.rewardMoney >= 0 ? '￥' + this.props.data.rewards.rewardMoney : ''}
                                    {this.props.data && this.props.data.rewards && this.props.data.rewards.rewardType >= 0 ? this.props.data.rewards.rewardType === 0 ? ' / 每天' : ' / 总价' : ''}
                                    {this.props.data && this.props.data.rewards && this.props.data.rewards.provideBoard >= 0 ? this.props.data.rewards.provideBoard === 0 ? '' : ' / 包吃' : ''}
                                    {this.props.data && this.props.data.rewards && this.props.data.rewards.provideRoom >= 0 ? this.props.data.rewards.provideRoom === 0 ? '' : ' / 包住' : ''}
                                </Text>
                            </View>
                        </View>
                    </View>
                    <View
                        style={NotifiationOrderItemViewStyles.layout_container_container}>
                        <View style={NotifiationOrderItemViewStyles.layout_container_item}>
                            <View style={NotifiationOrderItemViewStyles.layout_container_item_tem}>
                                <Text
                                    style={[NotifiationOrderItemViewStyles.normal_text, {
                                        color: '#707070',
                                        fontSize: 12,
                                    }]}>上工地址：</Text>
                                <Text
                                    style={[NotifiationOrderItemViewStyles.normal_text, {
                                        marginBottom: 0,
                                        color: '#707070',
                                        fontSize: 12,
                                    }]}>
                                    {this.props.data && this.props.data.order && this.props.data.order.workAddress ? this.props.data.order.workAddress + ' ' : ''}
                                </Text>
                            </View>
                        </View>
                    </View>
                    <View
                        style={NotifiationOrderItemViewStyles.layout_container_container}>
                        <TouchableOpacity
                            style={NotifiationOrderItemViewStyles.layout_container_item_btn2}
                            onPress={() => this.props.onItemBtn1Click()}
                        >

                            <Text style={[NotifiationOrderItemViewStyles.normal_text, {
                                marginBottom: 0,
                                color: '#000000',
                                fontSize: 12,
                            }]}>{this.props.itemBtn1Title}</Text>
                        </TouchableOpacity>

                        <TouchableOpacity
                            style={NotifiationOrderItemViewStyles.layout_container_item_btn}
                            onPress={() => this.props.onItemBtn2Click()}
                        >

                            <Text style={[NotifiationOrderItemViewStyles.normal_text, {
                                marginBottom: 0,
                                color: '#FFFFFF',
                                fontSize: 12,
                            }]}>{this.props.itemBtn2Title}</Text>
                        </TouchableOpacity>
                    </View>
                </View>
            </View>
        );
    }
}

NotifiationOrderItemViewStyles = StyleSheet.create({
    root: {
        flex: 1,
        minHeight: 48,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
    },
    cut_line: {
        backgroundColor: '#FBFBFB',
        height: 1.2
    },
    layout_container: {
        flex: 1,
        padding: 9.6,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        justifyContent: 'center',
    },
    layout_container_container: {
        flex: 1,
        flexDirection: 'row',//row ,row-reverse ,column ('default') column-reverse
        justifyContent: 'center',
    },
    layout_container_item: {
        flex: 1,
        minHeight: 36,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        justifyContent: 'center',
        alignItems: 'flex-start',
        // backgroundColor: '#FBFBFB',
        margin: 4.8,
    },
    layout_container_item_tem: {
        flex: 1,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        justifyContent: 'flex-start',
        alignItems: 'flex-start',
    },
    layout_container_item_btn: {
        flex: 1,
        minHeight: 36,
        flexDirection: 'row',//row ,row-reverse ,column ('default') column-reverse
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: '#FFCC33',
        margin: 4.8,
        borderWidth: 2,
        borderRadius: 4.8,
        borderColor: '#FFCC33',
    },
    layout_container_item_btn2: {
        flex: 1,
        minHeight: 36,
        flexDirection: 'row',//row ,row-reverse ,column ('default') column-reverse
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: '#FFFFFF',
        margin: 4.8,
        borderWidth: 2,
        borderRadius: 4.8,
        borderColor: '#FFCC33',
    },
    normal_text: {
        fontSize: 14,
        marginBottom: 9.6,
    }

});
