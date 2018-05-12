import React, {Component} from 'react';

import CreateWorkNromalForFindMainScreen from './create/find.mian.screen.create.work.normal'
import CreateWorkSuccessForFindMainScreen from './create/find.mian.screen.create.work.success'
import CreateWorkErroeForFindMainScreen from './create/find.mian.screen.create.work.error'
import BaseActivity from "../../../views/base.activity";


export default class CreateWorkForFindMainScreen extends BaseActivity {
    constructor(props) {
        super(props);
        this.state = {
            responval: '',
            selectedPushHireType: 0,//0-普通发布，1-紧急发布
            selectedPushHireState: 0,//0-操作，1-成功，-1-失败
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

    _pushCompoentToSuccess = (selectedPushHireType) => {
        this.state.selectedPushHireState = 1;
        this.setState({
            selectedPushHireType: selectedPushHireType,
            selectedPushHireState: this.state.selectedPushHireState,
        });
    };
    _pushCompoentToError = (selectedPushHireType, responval) => {
        this.state.selectedPushHireState = -1;
        this.setState({
            selectedPushHireType: selectedPushHireType,
            responval: responval,
            selectedPushHireState: this.state.selectedPushHireState,
        });
    };
    _reback = () => {
        this.state.selectedPushHireState = 0;
        this.setState({
            selectedPushHireState: this.state.selectedPushHireState,
        });
    };

    render() {
        const {navigator} = this.props.navigator;
        if (this.state.selectedPushHireState === 0) {
            return (
                <CreateWorkNromalForFindMainScreen
                    mobileUserData={this.props.mobileUserData}
                    navigator={this.props.navigator}
                    selectedWokerType={this.state.selectedWokerType}
                    onSuccess={(selectedPushHireType) => this._pushCompoentToSuccess(selectedPushHireType)}
                    onError={(selectedPushHireType, responval) => this._pushCompoentToError(selectedPushHireType, responval)}
                />
            );
        } else if (this.state.selectedPushHireState === 1) {
            return (
                <CreateWorkSuccessForFindMainScreen
                    mobileUserData={this.props.mobileUserData}
                    navigator={this.props.navigator}
                    selectedPushHireType={this.state.selectedPushHireType}
                    selectedPushHireState={this.state.selectedPushHireState}
                />
            );
        } else if (this.state.selectedPushHireState === -1) {
            return (
                <CreateWorkErroeForFindMainScreen
                    mobileUserData={this.props.mobileUserData}
                    navigator={this.props.navigator}
                    selectedPushHireType={this.state.selectedPushHireType}
                    selectedPushHireState={this.state.selectedPushHireState}
                    responval={this.state.responval}
                    reback={() => this._reback()}
                />
            );
        }
    }

}
