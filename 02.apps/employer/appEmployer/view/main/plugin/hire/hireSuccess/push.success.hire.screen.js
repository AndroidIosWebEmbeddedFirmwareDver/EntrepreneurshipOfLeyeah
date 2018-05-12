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
    CheckBox,
    Dimensions,
    ActivityIndicator,
    TouchableOpacity,
    StyleSheet
} from 'react-native';

import styles from '../../plugin.common.style'

import HeaderCommonView from '../../../../views/header/header.common.view'
import NetworkCommonUtil from '../../../../../utils/network.common.util'
import UserDataManager from '../../../../../utils/storage/user.data.manager.common.util'
import ToastManager from '../../../../../utils/toast/Toast.util'
import DialogManagerUtil from '../../../../views/dialog/dialog.manager.util'
import CommonListItemView from '../../../../views/common/common.list.item.view'
import BaseActivity from "../../../../views/base.activity";


export default class PushSuccessHireScreen extends BaseActivity {
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

    };

    //0-普通 1-紧急 2-被聘
    _gener_push_hire_show = (pushHireType: number) => {
        if (pushHireType === 0) {
            return '普通发布工作成功';
        } else if (pushHireType === 1) {
            return '紧急发布工作成功';
        } else if (pushHireType === 2) {
            return '发布招聘工作成功';
        }
    };

    render() {
        const {navigator} = this.props.navigator;
        return (
            <View style={styles.container}>

                <HeaderCommonView navigator={this.props.navigator}
                                  bgColor={'#FFCC33'}
                                  headerLeftShow={true}
                                  headerCenterShow={true}
                                  headerRightShow={false}
                                  showCenterAfterLeft={true}
                                  headerCenterTitle={'发布成功'}/>

                <View style={PushSuccessHireScreenScreenStyles.container}>
                    <View style={{height: 10, backgroundColor: 'transparent',}}/>
                    <View style={PushSuccessHireScreenScreenStyles.itemHeadContainer_style_normal}>
                        <Image
                            source={require('../../../../../stable/image/ic_app_success.png')}
                            style={{
                                width: 56,
                                height: 56,
                                marginBottom: 9.6,
                            }}
                        />
                        <Text
                            style={PushSuccessHireScreenScreenStyles.commonText_normal}>{this._gener_push_hire_show(this.props.selectedPushHireType)}</Text>
                    </View>
                    <TouchableOpacity
                        style={PushSuccessHireScreenScreenStyles.itemHeadContainer_style_full}
                        onPress={() => this._onFullPress()}
                    >
                        <Text style={PushSuccessHireScreenScreenStyles.commonText_full}>完成</Text>
                    </TouchableOpacity>
                    {/*<TouchableOpacity*/}
                        {/*style={PushSuccessHireScreenScreenStyles.itemHeadContainer_style_border}*/}
                        {/*onPress={() => this._onBorderPress()}*/}
                    {/*>*/}
                        {/*<Text*/}
                            {/*style={PushSuccessHireScreenScreenStyles.commonText_border}>查看详情</Text>*/}
                    {/*</TouchableOpacity>*/}
                </View>
            </View>
        );
    };
}

PushSuccessHireScreenScreenStyles = StyleSheet.create({
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