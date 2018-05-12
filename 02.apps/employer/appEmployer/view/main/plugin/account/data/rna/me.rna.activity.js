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


import UserRnaStatus from '../../../../../../stable/json/user.rna.status'
import RnaEditMsgActivity from './rna.edit.msg.activity'
import RnaStatusActivity from './rna.status.activity'
import BaseActivity from "../../../../../views/base.activity";


export default class MeRnaActivity extends BaseActivity {
    //1.
    constructor(props) {
        super(props);
        this.state = {
            beRna: 0,
        };
    }

    //2.
    componentWillMount() {
        super.componentWillMount();
        this.setState({
            beRna: this.props.mobileUserData ? this.props.mobileUserData.data ? this.props.mobileUserData.data.beRna : 0 : 0,
        });
    }

    //3.
    componentDidMount() {
        super.componentDidMount();
    }

    //4.
    componentWillUnmount() {
        super.componentWillUnmount();
    }

    //实名认证
    _onRnaChangeSuccessCallback = (status) => {
        this.setState({
            beRna: status,
        });
        if (this.props.onUserDataRefreshCallback) {
            this.props.onUserDataRefreshCallback();
        }
    };

    render() {
        if (this.state.beRna === UserRnaStatus.UN_COMMIT) {
            return (
                <RnaEditMsgActivity
                    navigator={this.props.navigator}
                    mobileUserData={this.props.mobileUserData}
                    onRnaChangeSuccessCallback={(status) => this._onRnaChangeSuccessCallback(status)}
                />
            );
        }
        else {
            return (
                <RnaStatusActivity
                    navigator={this.props.navigator}
                    mobileUserData={this.props.mobileUserData}
                />
            );
        }
    };
}

MeRnaActivityStyles = StyleSheet.create({
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
    function_list_container: {
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FBFBFB',
    },
});