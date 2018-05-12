import React, {PureComponent, Component} from 'react';
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
} from 'react-native';

const {
    width,
    height
} = Dimensions.get('window');

import HeaderCommonView from '../../../../views/header/header.common.view'
import CommonListItemView from '../../../../views/common/common.list.item.view'

import ToastManager from '../../../../../utils/toast/Toast.util'
import NetworkCommonUtil from '../../../../../utils/network.common.util'
import DialogManagerUtil from '../../../../views/dialog/dialog.manager.util'
import UserDataManager from '../../../../../utils/storage/user.data.manager.common.util'
import PhoneResetActivity from './phone.reset.activity'
import BaseActivity from "../../../../views/base.activity";


/**
 * 手机号码编辑
 */
export default class RegionSetedActivity extends BaseActivity {
    //1.
    constructor(props) {
        super(props);
        this.state = {
            isRegionSeted: false,
        };
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

    //页面跳转
    _pushCompoent = (component: Component, params: any) => {
        if (!component) {
            return;
        }
        this.props.navigator.push({
            component: component,
            params: params,
        });
    };

    _onVerfiOldPhoneSuccess = () => {
        this.setState({
            verfiStatus: true,
        });
    };

    _onUserDataRefreshCallback = () => {
        if (this.props.onUserDataRefreshCallback) {
            this.props.onUserDataRefreshCallback();
        }
        if (this.props.navigator) {
            this.props.navigator.pop();
        }
    };

    render() {
        <View/>
    }
}

