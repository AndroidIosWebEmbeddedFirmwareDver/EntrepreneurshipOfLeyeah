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

import styles from '../../plugin.common.style'

import HeaderCommonView from '../../../../views/header/header.common.view'
import NetworkCommonUtil from '../../../../../utils/network.common.util'
import UserDataManager from '../../../../../utils/storage/user.data.manager.common.util'
import ToastManager from '../../../../../utils/toast/Toast.util'
import DialogManagerUtil from '../../../../views/dialog/dialog.manager.util'
import CommonListItemView from '../../../../views/common/common.list.item.view'
import BaseActivity from "../../../../views/base.activity";


export default class CreateWorkErroeForFindMainScreen extends BaseActivity {
    //1.
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

    _onFullPress = () => {
        this.props.navigator.pop();
    };

    _onBorderPress = () => {
        if (this.props.reback) {
            this.props.reback();
        }
    };

    render() {
        const {navigator} = this.props.navigator;
        return (
            <View style={styles.container}>
                <HeaderCommonView navigator={this.props.navigator}
                                  headerLeftShow={true}
                                  headerCenterShow={true}
                                  headerRightShow={false}
                                  headerCenterTitle={'发布失败'}/>
                <View style={CreateWorkErroeForFindMainScreenStyles.container}>
                    <View style={{height: 10, backgroundColor: 'transparent',}}/>
                    <View
                        style={CreateWorkErroeForFindMainScreenStyles.itemHeadContainer_style_normal}>
                        <Image
                            source={require('../../../../../stable/image/ic_app_error.png')}
                            style={{
                                width: 56,
                                height: 56,
                                marginBottom: 9.6,
                            }}
                        />
                        <Text
                            style={CreateWorkErroeForFindMainScreenStyles.commonText_normal}>{this.props.selectedPushHireType === 0 ? '普通发布工作失败' : '紧急发布工作失败'}</Text>
                        <Text
                            style={CreateWorkErroeForFindMainScreenStyles.commonText_normal}>{this.props.responval ? JSON.stringify(this.props.responval) : ''}</Text>
                    </View>
                    <TouchableOpacity
                        style={CreateWorkErroeForFindMainScreenStyles.itemHeadContainer_style_full}
                        onPress={() => this._onFullPress()}
                    >
                        <Text
                            style={CreateWorkErroeForFindMainScreenStyles.commonText_full}>返回首页</Text>
                    </TouchableOpacity>
                    <TouchableOpacity
                        style={CreateWorkErroeForFindMainScreenStyles.itemHeadContainer_style_border}
                        onPress={() => this._onBorderPress()}
                    >
                        <Text
                            style={CreateWorkErroeForFindMainScreenStyles.commonText_border}>重新编辑</Text>
                    </TouchableOpacity>
                </View>
            </View>
        );
    };
}

CreateWorkErroeForFindMainScreenStyles = StyleSheet.create({
    container: {
        flex: 1,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        width: window.width,
        backgroundColor: '#FFFFFF',
        marginTop: 9.6,
        padding: 9.6,
    },
    itemHeadContainer_style_normal: {
        width: window.width,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        justifyContent: 'center',
        alignItems: 'center',
        marginTop: 9.6,
        padding: 9.6,
    },
    itemHeadContainer_style_full: {
        width: window.width,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        height: 56,
        backgroundColor: '#FFCC33',
        justifyContent: 'center',
        alignItems: 'center',
        borderRadius: 4.8,
        borderColor: '#FFCC33',
        borderWidth: 2,
        marginTop: 9.6,
        padding: 9.6,
    },
    itemHeadContainer_style_border: {
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
    commonText_full: {
        color: '#FFFFFF',
        fontSize: 16,
    },
    commonText_border: {
        color: '#FFCC33',
        fontSize: 16,
    },
    commonText_normal: {
        fontSize: 16,
    },
});
