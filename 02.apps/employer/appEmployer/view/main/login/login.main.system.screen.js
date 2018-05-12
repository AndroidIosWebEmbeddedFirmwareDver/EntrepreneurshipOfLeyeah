import React, {Component} from 'react';

import LoginSuccessSystemScreen from './login.success.system.screen'
import LoginNormalSystemScreen from './login.normal.system.screen'

export default class LoginMainSystemScreen extends Component {
    constructor(props) {
        super(props);
        this.state = {
            isLoginSuccess: false,
        };
    }

    _onSuccessCallback = () => {
        // this.state.isLoginSuccess = true;
        // this.setState({
        //     isLoginSuccess: this.state.isLoginSuccess,
        // });
        if (this.props.loginSuccessCallback) {
            this.props.loginSuccessCallback();
        }
        this.props.navigator.pop();
    };
    _mloginSuccessCallback = () => {
        if (this.props.loginSuccessCallback) {
            this.props.loginSuccessCallback();
        }
        this.props.navigator.pop();
    };

    render() {
        if (this.state.isLoginSuccess === true) {
            return (
                <LoginSuccessSystemScreen
                    navigator={this.props.navigator}
                    mloginSuccessCallback={() => this._mloginSuccessCallback()}
                />
            );
        } else {
            return (
                <LoginNormalSystemScreen
                    navigator={this.props.navigator}
                    onSuccess={() => this._onSuccessCallback()}
                />
            );

        }

    };
}
