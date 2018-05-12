import React, {Component} from 'react';

import PushSErrorHireScreen from './hireError/push.error.hire.screen'
import PushSuccessHireScreen from './hireSuccess/push.success.hire.screen'
import PushNromalHireScreen from './hireNormal/push.normal.hire.screen'


import FindMainTags from '../find/find.main.tags'
import BaseActivity from "../../../views/base.activity";


export default class HireMainScreen extends BaseActivity {
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
        // InteractionManager.runAfterInteractions(() => {
        //     //处理消耗时间和性能的任务，把主线程让出来加载UI
        //     this.initQueryProvinceData();
        // });
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


    _onChangeRender = () => {
        if (this.props.onChangeRender) {
            let params = {
                mobileUserData: this.state.mobileUserData,
                selectedWokerType: this.props.selectedWokerType,
                selectedWorkExp: this.props.selectedWorkExp,
                selectedWokers: this.props.selectedWokers,
            };
            this.props.onChangeRender(params, this.props.headerJustCllBackShowTag ? this.props.headerJustCllBackShowTag : FindMainTags.screenTags.Worker);
        }
    };

    render() {
        const {navigator} = this.props.navigator;
        if (this.state.selectedPushHireState === 0) {
            return (
                <PushNromalHireScreen
                    mobileUserData={this.props.mobileUserData}
                    navigator={this.props.navigator}
                    onSuccess={(selectedPushHireType) => this._pushCompoentToSuccess(selectedPushHireType)}
                    onError={(selectedPushHireType, responval) => this._pushCompoentToError(selectedPushHireType, responval)}
                    selectedWokerType={this.props.selectedWokerType}
                    selectedWorkExp={this.props.selectedWorkExp}
                    selectedWokers={this.props.selectedWokers}
                    selectedShowTitle={this.props.selectedShowTitle}
                    selectedTag={this.props.selectedTag}
                    headerOnbackPress={() => this._onChangeRender()}
                    headerJustCllBack={this.props.headerJustCllBack}
                />
            );
        } else if (this.state.selectedPushHireState === 1) {
            return (
                <PushSuccessHireScreen
                    mobileUserData={this.props.mobileUserData}
                    navigator={this.props.navigator}
                    selectedPushHireType={this.state.selectedPushHireType}
                    selectedPushHireState={this.state.selectedPushHireState}
                />
            );
        } else if (this.state.selectedPushHireState === -1) {
            return (
                <PushSErrorHireScreen
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