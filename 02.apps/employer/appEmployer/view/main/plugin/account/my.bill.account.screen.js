import React, {PureComponent, Component} from 'react';
import {
    StyleSheet,
    TouchableOpacity,
    View,
    Text,
    TextInput,
    Button,
} from 'react-native';

import HeaderCommonView from '../../../views/header/header.common.view'
import NetworkCommonUtil from '../../../../utils/network.common.util'
import UserDataManager from '../../../../utils/storage/user.data.manager.common.util'
import AsyncstorageKeyCommonUtil from '../../../../utils/storage/asyncstorage.key.common.util'
import ToastManager from '../../../../utils/toast/Toast.util'
import DialogManagerUtil from '../../../views/dialog/dialog.manager.util'
import CommonListItemView from '../../../views/common/common.list.item.view'
import BaseActivity from "../../../views/base.activity";


export default class MyBillAccountScreen extends BaseActivity {
    constructor(props) {
        super(props);
    };

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
            <View style={MyBillAccountScreenStyles.container}>
                <HeaderCommonView navigator={this.props.navigator}
                                  headerLeftShow={true}
                                  headerCenterShow={true}
                                  headerRightShow={false}
                                  headerCenterTitle={'我的账单'}/>
                <View style={{height: 10, backgroundColor: 'transparent',}}/>
            </View>
        );
    };
}

MyBillAccountScreenStyles = StyleSheet.create({
    //基于flex-box布局
    container: {
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FBFBFB',
    },
});