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

class FragmentOrderItemView extends PureComponent {

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
                style={[FragmentOrderItemViewStyles.root, this.props.rootBgColor ? {backgroundColor: this.props.rootBgColor} : '']}>
                <View style={FragmentOrderItemViewStyles.cut_line}/>
                <View style={FragmentOrderItemViewStyles.layout_container}>
                    <View
                        style={FragmentOrderItemViewStyles.layout_container_container}>

                        <View style={[FragmentOrderItemViewStyles.layout_container_item, {
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
                            style={[FragmentOrderItemViewStyles.layout_container_item, {flex: 1.5,}]}>
                            <View style={FragmentOrderItemViewStyles.layout_container_item_tem}>
                                <Text
                                    style={FragmentOrderItemViewStyles.normal_text}>
                                    {this.props.data && this.props.data.employer && this.props.data.employer.name ? this.props.data.employer.name : ''}
                                </Text>
                            </View>
                            <View style={FragmentOrderItemViewStyles.layout_container_item_tem}>
                                <Text
                                    style={FragmentOrderItemViewStyles.normal_text}>{this.props.data && this.props.data.order ? this.props.data.order.orderWokerTypeName : ''}</Text>
                                <Text
                                    style={FragmentOrderItemViewStyles.normal_text}>评分:{this.props.data && this.props.data.employer && this.props.data.employer.score >= 0 ? this.props.data.employer.score : ''}</Text>
                            </View>
                        </View>
                        {/*head part3*/}
                        {/*<View style={[FragmentOrderItemViewStyles.layout_container_item, {*/}
                        {/*flex: 0.5,*/}
                        {/*justifyContent: 'flex-start',*/}
                        {/*alignItems: 'flex-end',*/}
                        {/*}]}>*/}
                        {/*<Text style={FragmentOrderItemViewStyles.normal_text}>100m</Text>*/}
                        {/*</View>*/}
                    </View>
                    <View
                        style={FragmentOrderItemViewStyles.layout_container_container}>
                        <View style={FragmentOrderItemViewStyles.layout_container_item}>
                            <View style={FragmentOrderItemViewStyles.layout_container_item_tem}>
                                <Text style={[FragmentOrderItemViewStyles.normal_text, {
                                    color: '#707070',
                                    fontSize: 12,
                                }]
                                }>时间：</Text>
                                <Text
                                    style={[FragmentOrderItemViewStyles.normal_text, {
                                        marginBottom: 0, color: '#707070',
                                        fontSize: 12,
                                    }]}>
                                    {this.props.data && this.props.data.order && this.props.data.order.workStartTime ? this.props.data.order.workStartTime + ' ' : ''}
                                    /
                                    {this.props.data && this.props.data.order && this.props.data.order.workStopTime ? ' ' + this.props.data.order.workStopTime : ''}
                                </Text>
                            </View>
                        </View>
                        <View style={FragmentOrderItemViewStyles.layout_container_item}>
                            <View style={FragmentOrderItemViewStyles.layout_container_item_tem}>
                                <Text style={[FragmentOrderItemViewStyles.normal_text, {
                                    color: '#707070',
                                    fontSize: 12,
                                }]
                                }>待遇：</Text>
                                <Text
                                    style={[FragmentOrderItemViewStyles.normal_text, {
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
                        style={FragmentOrderItemViewStyles.layout_container_container}>
                        <View style={FragmentOrderItemViewStyles.layout_container_item}>
                            <View style={FragmentOrderItemViewStyles.layout_container_item_tem}>
                                <Text style={[FragmentOrderItemViewStyles.normal_text, {
                                    color: '#707070',
                                    fontSize: 12,
                                }]
                                }>上工地址：</Text>
                                <Text
                                    numberOfLines={1}
                                    ellipsizeMode={'tail'}
                                    style={[FragmentOrderItemViewStyles.normal_text, {
                                        marginBottom: 0, color: '#707070',
                                        fontSize: 12,
                                    }]}>
                                    {this.props.data && this.props.data.order && this.props.data.order.workAddress ? this.props.data.order.workAddress + ' ' : ''}
                                </Text>
                            </View>
                        </View>
                    </View>
                    <View
                        style={FragmentOrderItemViewStyles.layout_container_container}>
                        <View style={FragmentOrderItemViewStyles.layout_container_item}>
                            <View style={FragmentOrderItemViewStyles.layout_container_item_tem}>
                                <Text style={[FragmentOrderItemViewStyles.normal_text, {
                                    color: '#707070',
                                    fontSize: 12,
                                }]
                                }>工作描述：</Text>
                                <Text
                                    numberOfLines={1}
                                    ellipsizeMode={'tail'}
                                    style={[FragmentOrderItemViewStyles.normal_text, {
                                        marginBottom: 0, color: '#707070',
                                        fontSize: 12,
                                    }]}>
                                    {this.props.data && this.props.data.order && this.props.data.order.workDescription ? this.props.data.order.workDescription + ' ' : ''}
                                </Text>
                            </View>
                        </View>
                    </View>
                    <View
                        style={FragmentOrderItemViewStyles.layout_container_container}>
                        <TouchableOpacity
                            style={[FragmentOrderItemViewStyles.layout_container_item_btn,
                                this.props.itemFunctionData && this.props.itemFunctionData.func_bg_color ?
                                    {
                                        backgroundColor: this.props.itemFunctionData.func_bg_color,
                                    }
                                    :
                                    {
                                        backgroundColor: '#FFCC33',
                                    }
                            ]}
                            onPress={() => this.props.onItemBtnClick()}
                        >
                            {
                                this.props.showClock ?
                                    <Image
                                        source={require('../../../stable/image/main/ic_main_clock_normal.png')}
                                        style={{
                                            width: 16,
                                            height: 16,
                                            resizeMode: 'cover',
                                            marginRight: 2.4,
                                        }}/>
                                    : <View/>
                            }

                            <Text style={[FragmentOrderItemViewStyles.normal_text, {
                                marginBottom: 0,
                            }, this.props.itemFunctionData && this.props.itemFunctionData.func_txt_color ?
                                {
                                    color: this.props.itemFunctionData.func_txt_color,
                                }
                                :
                                {
                                    color: '#FFFFFF',
                                }
                            ]}>{this.props.itemFunctionData && this.props.itemFunctionData.show ? this.props.itemFunctionData.show :
                                this.props.itemBtnTitle ? this.props.itemBtnTitle : ''}</Text>
                        </TouchableOpacity>
                    </View>
                </View>
            </View>
        );
    }
}

FragmentOrderItemViewStyles = StyleSheet.create({
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
        minHeight: 24,
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
        borderRadius: 4.8,
        borderRightColor: '#FFCC33',
    },
    normal_text: {
        fontSize: 14,
        marginBottom: 9.6 / 2,
    }

});

export default FragmentOrderItemView;