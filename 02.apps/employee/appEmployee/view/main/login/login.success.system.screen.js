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


import HeaderCommonView from '../../views/header/header.common.view'
import BaseActivity from "../../views/base.activity";


export default class LoginSuccessSystemScreen extends BaseActivity {
    constructor(props) {
        super(props);
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

    _goBack(): void {
        // super._goBack();
    }

    _onJointoHomePress = () => {
        if (this.props.mloginSuccessCallback) {
            this.props.mloginSuccessCallback();
        }
    };

    render() {
        const {navigator} = this.props.navigator;
        return (
            <View style={LoginSuccessSystemScreenStyles.root}>
                <HeaderCommonView navigator={this.props.navigator}
                                  headerLeftShow={false}
                                  headerCenterShow={true}
                                  headerRightShow={false}
                                  headerCenterTitle={''}/>
                <View style={LoginSuccessSystemScreenStyles.login_container}>
                    <View style={{height: 10, backgroundColor: 'transparent',}}/>
                    <View
                        style={LoginSuccessSystemScreenStyles.login_itemHeadContainer_style_normal}>
                        <Image
                            source={require('../../../stable/image/ic_app_success.png')}
                            style={{
                                width: 56,
                                height: 56,
                                marginBottom: 9.6,
                            }}
                        />
                        <Text
                            style={LoginSuccessSystemScreenStyles.login_commonText_normal}>登录成功</Text>
                    </View>
                    <TouchableOpacity
                        style={LoginSuccessSystemScreenStyles.login_itemHeadContainer_style_full}
                    >
                    </TouchableOpacity>
                    <TouchableOpacity
                        style={LoginSuccessSystemScreenStyles.login_itemHeadContainer_style_border}
                        onPress={() => this._onJointoHomePress()}
                    >
                        <Text
                            style={LoginSuccessSystemScreenStyles.login_commonText_border}>进入首页</Text>
                    </TouchableOpacity>
                </View>
            </View>
        );
    };
}

LoginSuccessSystemScreenStyles = StyleSheet.create({
    //基于flex-box布局
    root: {
        flex: 1,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FBFBFB',
    },
    login_container: {
        flex: 1,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        width: window.width,
        backgroundColor: '#FFFFFF',
        padding: 9.6,
    },
    login_itemHeadContainer_style_normal: {
        width: window.width,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        justifyContent: 'center',
        alignItems: 'center',
        padding: 9.6,
    },
    login_itemHeadContainer_style_full: {
        width: window.width,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        height: 56,
        justifyContent: 'center',
        alignItems: 'center',
    },
    login_itemHeadContainer_style_border: {
        width: window.width,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        height: 56,
        backgroundColor: 'transparent',
        justifyContent: 'center',
        alignItems: 'center',
        borderRadius: 4.8,
        borderColor: '#FFCC33',
        borderWidth: 2,
        marginTop: 9.6,
        padding: 9.6,
    },
    login_commonText_full: {
        color: '#FFFFFF',
        fontSize: 16,
    },
    login_commonText_border: {
        color: '#FFCC33',
        fontSize: 16,
    },
    login_commonText_normal: {
        fontSize: 16,
    },
});