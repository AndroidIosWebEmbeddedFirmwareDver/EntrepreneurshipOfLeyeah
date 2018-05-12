import React, {PureComponent, Component} from 'react';

import PhoneVerfiActivity from './phone.verfi.activity'
import PhoneResetActivity from './phone.reset.activity'
import BaseActivity from "../../../../views/base.activity";

/**
 * 手机号码编辑
 */
export default class PhoneActivity extends BaseActivity {
    //1.
    constructor(props) {
        super(props);
        this.state = {
            verfiStatus: false,
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
        if (this.state.verfiStatus) {
            return (
                <PhoneResetActivity
                    navigator={this.props.navigator}
                    mobileUserData={this.props.mobileUserData}
                    onUserDataRefreshCallback={() => this._onUserDataRefreshCallback()}
                />
            );
        } else {
            return (
                <PhoneVerfiActivity
                    navigator={this.props.navigator}
                    mobileUserData={this.props.mobileUserData}
                    onVerfiOldPhoneSuccess={() => this._onVerfiOldPhoneSuccess()}
                />
            );
        }
    }
}

