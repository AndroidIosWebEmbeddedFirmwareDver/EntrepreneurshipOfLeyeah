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




export default class RnaEditActivityImageItem extends PureComponent {
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
                style={[RnaEditActivityImageItemStyles.function_list_item_container, {
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
                        source={this.props.leftImage ? this.props.leftImage : require('../../../../../../../stable/image/shareqrcode.png')}
                        style={{
                            width: (width - 9.6 * 6) / 2,
                            height: 72,
                            resizeMode: 'cover',
                        }}
                    />
                    <Text
                        style={[RnaEditActivityImageItemStyles.normal_text, {marginTop: 9.6}]}>{this.props.leftItemShow}</Text>
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
                                source={this.props.rightImage ? this.props.rightImage : require('../../../../../../../stable/image/shareqrcode.png')}
                                style={{
                                    width: (width - 9.6 * 6) / 2,
                                    height: 72,
                                    resizeMode: 'cover',
                                }}
                            />
                            <Text
                                style={[RnaEditActivityImageItemStyles.normal_text, {marginTop: 9.6}, this.props.rightShowColor ? {color: this.props.rightShowColor} : {}]}>{this.props.rightItemShow}</Text>
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



RnaEditActivityImageItemStyles = StyleSheet.create({
    //基于flex-box布局
    container: {
        width: width,
        height: height,
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