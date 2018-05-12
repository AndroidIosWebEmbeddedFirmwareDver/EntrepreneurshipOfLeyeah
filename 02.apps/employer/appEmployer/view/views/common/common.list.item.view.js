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
    StyleSheet,
    TouchableOpacity,
} from 'react-native'

const codeTime = 60;

export default class CommonListItemView extends Component {

    //1.
    constructor(props) {
        super(props);
        this.state = {
            rightInputActionShow: null,
            timerCount: codeTime,
        };
    }

    //2.
    componentWillMount() {

    }

    //3.
    componentDidMount() {

    }

    //4.
    componentWillUnmount() {
        //当组件要被从界面上移除的时候，就会调用componentWillUnmount(),在这个函数中，可以做一些组件相关的清理工作，例如取消计时器、网络请求等
        this._stopInterval();
    }

    _startRightInputAction = () => {
        this._startInterval();
    };

    _startInterval = () => {
        this.interval = setInterval(() => {
            const timer = this.state.timerCount - 1;
            if (timer === 0) {
                this.interval && clearInterval(this.interval);
                this.setState({
                    timerCount: codeTime,
                    rightInputActionShow: null,
                })
            } else {
                this.setState({
                    timerCount: timer,
                    rightInputActionShow: timer + 's',
                })
            }

        }, 1000);

    };

    _stopInterval = () => {
        if (this.interval) {
            clearInterval(this.interval);
        }
    };

    _commonListItemContentView() {
        return (
            <View
                style={[ThisCommonListItemViewStyles.top, {height: this.props.itemHeight > 0 ? this.props.itemHeight : 56}]}>
                {
                    this.props.hiddeLeft ?
                        <View/>
                        :
                        <Text
                            style={[ThisCommonListItemViewStyles.itemLeftText, {marginLeft: 9.6,}]}
                            numberOfLines={1}
                            ellipsizeMode={'tail'}>{this.props.leftTitle}
                        </Text>
                }

                <View
                    style={[ThisCommonListItemViewStyles.itemRightView, this.props.hiddeLeft ? {
                        marginLeft: 9.6 * 2,
                        marginRight: 9.6 * 2
                    } : {}, {
                        flex: 2,
                    }]}>
                    {

                        this.props.rightType === 'next' ?
                            <View style={ThisCommonListItemViewStyles.itemRightInView}>
                                {this.props.showRightTextWithBgView ?
                                    <View style={[{
                                        backgroundColor: '#0088F3',
                                        borderRadius: 9.6,
                                        paddingLeft: 9.6,
                                        paddingRight: 9.6,
                                        paddingTop: 2.4,
                                        paddingBottom: 2.4,
                                    }]}>
                                        <Text
                                            numberOfLines={1}//文本行数限制，添加后超过限制行数文本会在末尾默认以...的形式省略。
                                            ellipsizeMode={'tail'}//设置文本缩略格式，配合numberOfLines使用，values -> tail：在末尾...省略（默认值） clip：在末尾切割，直接切割字符无省略符 head：在前面...省略  middle：在中间...省略
                                            style={[ThisCommonListItemViewStyles.itemRightInViewText, this.props.rightShowTitleShowAtRight ? {
                                                flex: 0,
                                                flexDirection: 'row',
                                                justifyContent: 'flex-end',
                                                alignItems: 'flex-end',
                                                color: '#FFFFFF',
                                            } : {
                                                flex: 1,
                                                flexDirection: 'row',
                                                justifyContent: 'flex-end',
                                                alignItems: 'flex-end',
                                            }]}>{this.props.rightShowTitle}</Text>
                                    </View>
                                    :
                                    <Text
                                        numberOfLines={1}
                                        ellipsizeMode={'tail'}
                                        style={[ThisCommonListItemViewStyles.itemRightInViewText, this.props.rightShowTitleShowAtRight ? {
                                            flex: 0,
                                            flexDirection: 'row',
                                            justifyContent: 'flex-end',
                                            alignItems: 'flex-end',
                                        } : {
                                            flex: 1,
                                            flexDirection: 'row',
                                            justifyContent: 'flex-end',
                                            alignItems: 'flex-end',
                                        }, {
                                            color: this.props.rightShowTitleColor ? this.props.rightShowTitleColor : '#000000'
                                        }]}>{this.props.rightShowTitle}</Text>
                                }
                                {
                                    this.props.showRightAvator ?
                                        <Image
                                            source={this.props.showRightAvatorUrl}
                                            style={{
                                                width: 44,
                                                height: 44,
                                                resizeMode: 'cover',
                                                borderRadius: 44 / 2,
                                                borderColor: '#FBFBFB',
                                                borderWidth: 2,

                                            }}
                                        />
                                        : <View/>
                                }
                                {this.props.rightNextImage ?
                                    <Image
                                        source={this.props.rightNextImage}
                                        style={{
                                            width: 32,
                                            height: 32,
                                            marginRight: 9.6,
                                        }}/>
                                    :
                                    <View style={{marginRight: 9.6 * 2,}}/>
                                }

                            </View>
                            : this.props.rightType === 'input' ?
                            <TextInput
                                style={[{height: 44, flex: 1}, {
                                    padding: 0,
                                }]}
                                underlineColorAndroid="transparent"
                                placeholder={this.props.rightInputPlaceholder}
                                onChangeText={(text) => this.props.onInputParamsChange(text)}
                                clearButtonMode={'while-editing'}
                                keyboardType={this.props.keyboardTypeIn}
                                autoFocus={this.props.rightInputAutoFocus}
                            />
                            :
                            this.props.rightType === 'inputAndVerfi' ?
                                <View
                                    style={[ThisCommonListItemViewStyles.itemRightInView, {paddingRight: 9.6 * 2,}]}>
                                    <TextInput
                                        style={[{height: 44, flex: 1, alignItems: 'flex-end',}, {
                                            padding: 0,
                                        }]}
                                        underlineColorAndroid="transparent"
                                        placeholder={this.props.rightInputPlaceholder}
                                        onChangeText={(text) => this.props.onInputParamsChange(text)}
                                        clearButtonMode={'while-editing'}
                                        keyboardType={this.props.keyboardTypeIn}
                                        autoFocus={this.props.rightInputAutoFocus}
                                    />
                                    {
                                        this.state.rightInputActionShow ?
                                            <View
                                                style={[ThisCommonListItemViewStyles.style_border, {}]}
                                            >
                                                <Text
                                                    style={[ThisCommonListItemViewStyles.itemRightInViewText,]}
                                                    numberOfLines={1}
                                                    ellipsizeMode={'tail'}
                                                >
                                                    {this.state.rightInputActionShow}
                                                </Text>
                                            </View>
                                            : <TouchableOpacity
                                                style={[ThisCommonListItemViewStyles.style_border, {}]}
                                                onPress={this.props.rightInputActionOnpress}
                                            >
                                                <Text
                                                    style={[ThisCommonListItemViewStyles.itemRightInViewText,]}
                                                    numberOfLines={1}
                                                    ellipsizeMode={'tail'}
                                                >
                                                    {this.props.rightInputActionShow}
                                                </Text>
                                            </TouchableOpacity>
                                    }

                                </View>
                                :
                                <View
                                    style={ThisCommonListItemViewStyles.itemRightInView}>
                                    <Text
                                        numberOfLines={1}
                                        ellipsizeMode={'tail'}
                                        style={[ThisCommonListItemViewStyles.itemRightInViewTextRight, this.props.rightShowTitleShowAtRight ? {
                                            flex: 0,
                                            flexDirection: 'row',
                                            justifyContent: 'flex-end',
                                            alignItems: 'flex-end',
                                        } : {
                                            flex: 1,
                                            flexDirection: 'row',
                                            justifyContent: 'flex-end',
                                            alignItems: 'flex-end',
                                        }, {
                                            marginRight: 9.6,
                                            color: this.props.rightShowTitleColor ? this.props.rightShowTitleColor : '#000000'
                                        }]}>{this.props.rightShowTitle}</Text>
                                </View>
                    }
                </View>
            </View>
        );
    };

    _commonListItemBottomView() {
        return (
            <View style={{
                width: window.width,
                height: this.props.bottomViewHeight,
                backgroundColor: 'transparent'
            }}/>
        );
    };

    render() {
        if (this.props.rootNotTouchable) {
            return (
                <View
                >
                    {this._commonListItemContentView()}
                    {this._commonListItemBottomView()}
                </View>
            );

        } else {
            return (
                <TouchableOpacity
                    onPress={this.props.itemOnpress}
                >
                    {this._commonListItemContentView()}
                    {this._commonListItemBottomView()}

                </TouchableOpacity>
            );
        }

    }
}


ThisCommonListItemViewStyles = StyleSheet.create({
    container: {
        width: window.width,
        flexDirection: 'row',
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: '#F5FCFF',
    },
    top: {
        width: window.width,
        height: 44,
        flexDirection: 'row',
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: '#FFFFFF',
    },
    itemLeftText: {
        flex: 1,
        padding: 9.6,
        fontSize: 14,
    },
    itemRightView: {
        flex: 2,
        flexDirection: 'row',
        justifyContent: 'flex-end',
        alignItems: 'center',
    },
    itemRightInView: {
        flex: 1,
        flexDirection: 'row',
        justifyContent: 'flex-end',
        alignItems: 'center',
    },
    itemRightInViewText: {
        flex: 1,
        flexDirection: 'row',
        justifyContent: 'flex-end',
        alignItems: 'center',
        fontSize: 14,
    },
    itemRightInViewTextRight: {
        justifyContent: 'flex-end',
        alignItems: 'flex-end',
        fontSize: 14,
        paddingRight: 9.6,
    },
    itemBotomView: {
        width: window.width,
        backgroundColor: 'transparent',
    },
    bottomView: {
        width: window.width,
        height: 44,
        flexDirection: 'row',
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: '#FFCC33',
    },
    style_border: {
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: 'transparent',
        justifyContent: 'center',
        alignItems: 'center',
        borderRadius: 4.8,
        borderColor: '#FFCC33',
        borderWidth: 2,
        padding: 9.6,
    },

    bottomItemView: {
        flex: 1,
        height: 44,
        justifyContent: 'center',
        alignItems: 'center',
    },
    bottomItemViewText: {
        fontSize: 16,
        color: '#FFFFFF',
    },
});