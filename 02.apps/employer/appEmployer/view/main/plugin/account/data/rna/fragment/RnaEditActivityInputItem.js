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


export default class RnaEditActivityInputItem extends PureComponent {
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
            <View style={[{
                flexDirection: 'column',
                flex: 1,
                height: 56,
            }, this.props.bgColors ? {backgroundColor: this.props.bgColors} : {}]}>
                {
                    this.props.showRight ? this.props.rightType === 'text' ?
                        <View style={RnaEditActivityInputItemStyles.function_list_item_container}>
                            <Text
                                style={[RnaEditActivityInputItemStyles.normal_text, {color: '#666666'}]}>
                                {this.props.showTag}
                            </Text>
                            <Text
                                style={[RnaEditActivityInputItemStyles.normal_text, this.props.righShowClolr ? {color: this.props.righShowClolr} : {}]}>
                                {this.props.showRightTag}
                            </Text>
                        </View>
                        :
                        <View style={RnaEditActivityInputItemStyles.function_list_item_container}>
                            <Text style={[RnaEditActivityInputItemStyles.normal_text, {flex: 1,}]}>
                                {this.props.showTag}
                            </Text>
                            <TextInput style={[RnaEditActivityInputItemStyles.normal_text, {
                                flex: 3,
                            }]}
                                       placeholder={this.props.placeholderShow}
                                       onChangeText={(text) => this._onInputParamsChange(text, this.state.flag)}
                                       clearButtonMode={'while-editing'}
                                       keyboardType={this.props.keyboardTypeIn}
                            />
                        </View>
                        : <View/>
                }
                {
                    this.props.showCutLine ?
                        <View style={{height: 2, backgroundColor: '#FBFBFB'}}/> : <View/>
                }

            </View>
        );
    }

}


RnaEditActivityInputItemStyles = StyleSheet.create({
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