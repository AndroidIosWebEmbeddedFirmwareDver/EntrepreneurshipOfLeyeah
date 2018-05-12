import React, {Component} from 'react';


import UserDataManager from '../../../../utils/storage/user.data.manager.common.util'

import FindMainTags from './find.main.tags'

import ChoiceWorkTypeForFindMainScreen from './find.mian.screen.choice.work.type'
import FindMianScreenChoiceWorkExp from './find.mian.screen.choice.work.exp'
import ChoiceWorkerForFindMainScreen from './find.mian.screen.choice.worker'
import FindMianScreenChoiceWork from './find.mian.screen.choice.work'
import HireMainScreen from '../hire/hire.mian.screen'

import PushSuccessHireScreen from '../hire/hireSuccess/push.success.hire.screen'
import BaseActivity from "../../../views/base.activity";

export default class FindMainScreen extends Component {


    constructor(props) {
        super(props);
        this.state = {
            mobileUserData: null,
            showTag: FindMainTags.screenTags.WorkType,
            params: {},
        };
    }

    //2.
    componentWillMount() {
    }

    //3.
    componentDidMount() {
        this._refreshUserData().then(data => {
        });
    }

    //4.
    componentWillUnmount() {
    }

    _refreshUserData = () => {
        return UserDataManager.getInstance().load().then((ret) => {
            if (ret) {
                this.setState({
                    mobileUserData: ret,
                });
            }
            return ret;
        });
    };


    _onChangeRender = (params: any, showTag) => {
        if (params && showTag) {
            this.setState({
                params: params,
                showTag: showTag,
            });
        }
    };


    _gener_render_screen = () => {
        switch (this.state.showTag) {
            case FindMainTags.screenTags.WorkType:
                return (
                    <ChoiceWorkTypeForFindMainScreen
                        headerJustCllBack={false}
                        onChangeRender={(params, showTag) => this._onChangeRender(params, showTag)}
                        navigator={this.props.navigator}/>
                );
            case FindMainTags.screenTags.WorkExp:
                return (
                    <FindMianScreenChoiceWorkExp
                        selectedWokerType={this.state.params.selectedWokerType}
                        headerJustCllBack={true}
                        onChangeRender={(params, showTag) => this._onChangeRender(params, showTag)}
                        navigator={this.props.navigator}/>
                );
            case FindMainTags.screenTags.Worker:
                return (
                    <ChoiceWorkerForFindMainScreen
                        selectedWokerType={this.state.params.selectedWokerType}
                        selectedWorkExp={this.state.params.selectedWorkExp}
                        headerJustCllBack={true}
                        onChangeRender={(params, showTag) => this._onChangeRender(params, showTag)}
                        navigator={this.props.navigator}/>
                );
            case FindMainTags.screenTags.Work:
                return (
                    <FindMianScreenChoiceWork
                        mobileUserData={this.state.mobileUserData}
                        selectedWokerType={this.state.params.selectedWokerType}
                        selectedWorkExp={this.state.params.selectedWorkExp}
                        selectedWokers={this.state.params.selectedWokers}
                        headerJustCllBack={true}
                        onChangeRender={(params, showTag) => this._onChangeRender(params, showTag)}
                        navigator={this.props.navigator}/>
                );
            case FindMainTags.screenTags.Hire:
                return (
                    <HireMainScreen
                        mobileUserData={this.state.mobileUserData}
                        selectedWokerType={this.state.params.selectedWokerType}
                        selectedWorkExp={this.state.params.selectedWorkExp}
                        selectedWokers={this.state.params.selectedWokers}
                        selectedShowTitle={this.state.params.selectedShowTitle}
                        selectedTag={this.state.params.selectedTag}
                        headerJustCllBack={true}
                        headerJustCllBackShowTag={this.state.params.headerBackShowTag}
                        onChangeRender={(params, showTag) => this._onChangeRender(params, showTag)}
                        navigator={this.props.navigator}/>
                );
            case FindMainTags.screenTags.HireSuccess:
                return (
                    <PushSuccessHireScreen
                        selectedPushHireType={this.state.params.selectedPushHireType}
                        mobileUserData={this.state.mobileUserData}
                        headerJustCllBack={false}
                        onChangeRender={(params, showTag) => this._onChangeRender(params, showTag)}
                        navigator={this.props.navigator}/>
                );
            default:
                return (
                    <ChoiceWorkTypeForFindMainScreen
                        headerJustCllBack={false}
                        onChangeRender={(params, showTag) => this._onChangeRender(params, showTag)}
                        navigator={this.props.navigator}/>
                );
        }
    };


    render() {
        const {navigator} = this.props.navigator;
        return (this._gener_render_screen());
    }
}
