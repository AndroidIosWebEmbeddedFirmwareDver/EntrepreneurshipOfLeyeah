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
    StyleSheet
} from 'react-native';

const {
    width,
    height
} = Dimensions.get('window');


import HeaderCommonView from '../../views/header/header.common.view'
import LoginUserProtocol from '../../../stable/json/login.user.protocol'
import BaseActivity from "../../views/base.activity";


export default class LoginUserProtocolSystemScreen extends BaseActivity {
    //1.
    constructor(props) {
        super(props);
        this.state = {};
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

    render() {
        return (
            <View style={LoginUserProtocolSystemScreenStyles.container}>
                <HeaderCommonView navigator={this.props.navigator}
                                  bgColor={'#FFCC33'}
                                  headerLeftShow={true}
                                  headerCenterShow={true}
                                  headerRightShow={false}
                                  showCenterAfterLeft={true}
                                  headerCenterTitle={'用户协议'}/>

                <ScrollView style={LoginUserProtocolSystemScreenStyles.function_list}
                            automaticallyAdjustContentInsets={false}
                            horizontal={false}
                            overScrollMode={'always'}
                            contentContainerStyle={LoginUserProtocolSystemScreenStyles.function_list_contentContainer}
                >
                    <View style={LoginUserProtocolSystemScreenStyles.list_view}>
                        <Text style={LoginUserProtocolSystemScreenStyles.normal_text}>
                            {LoginUserProtocol.U}
                        </Text>
                    </View>
                </ScrollView>
            </View>
        );
    };
}

LoginUserProtocolSystemScreenStyles = StyleSheet.create({
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
        paddingVertical: 16,
    },
    list_view: {
        flexDirection: 'row',
        justifyContent: 'center',
        alignItems: 'center',
        margin: 9.6,
    },
    function_list_container: {
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FBFBFB',
    },
    normal_text: {
        fontSize: 16,
    }
});