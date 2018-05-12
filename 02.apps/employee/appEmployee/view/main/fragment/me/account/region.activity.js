import React, {PureComponent, Component} from 'react';

import RegionNotsetActivity from './region.notset.activity'
import RegionSetedActivity from './region.seted.activity'

import RegionNotsetToSetActivity from './region.notset.toset.activity'
import BaseActivity from "../../../../views/base.activity";


/**
 * 手机号码编辑
 */
export default class RegionActivity extends BaseActivity {
    //1.
    constructor(props) {
        super(props);
        this.state = {
            regionComponentShow: 'notset',
        };
    }

    //2.
    componentWillMount() {
        super.componentWillMount();
        // if (this.props.mobileUserData && this.props.mobileUserData.data) {
        //     this.setState({
        //         isRegionSeted: this._isRegionSeted(this.props.mobileUserData.data),
        //     });
        // }
    }

    //3.
    componentDidMount() {
        super.componentDidMount();
    }

    //4.
    componentWillUnmount() {
        super.componentWillUnmount();
    }

    _isRegionSeted = (data) => {
        if (!data) {
            return false;
        }
        else if (data.areaCountryPkId === null || data.areaCountryPkId <= 0) {
            return false;
        }
        else if (data.areaCountryName === null) {
            return false;
        }

        else if (data.areaProvincePkId === null || data.areaProvincePkId <= 0) {
            return false;
        }
        else if (data.areaProvinceName === null) {
            return false;
        }

        else if (data.areaCityPkId === null || data.areaCityPkId <= 0) {
            return false;
        }
        else if (data.areaCityName === null) {
            return false;
        }

        else if (data.areaAreaAndCountyPkId === null || data.areaAreaAndCountyPkId <= 0) {
            return false;
        }
        else if (data.areaAreaAndCountyName === null) {
            return false;
        }
        else if (data.areaAddress === null) {
            return false;
        } else {
            return true;
        }
    };

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

    _onRegionComponentChange = (tag) => {
        this.setState({
            regionComponentShow: tag,
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
        if (this.state.regionComponentShow === 'seted') {
            return (
                <RegionSetedActivity
                    navigator={this.props.navigator}
                    mobileUserData={this.props.mobileUserData}
                    onRegionComponentChange={(tag) => this._onRegionComponentChange(tag)}
                    onUserDataRefreshCallback={() => this._onUserDataRefreshCallback()}
                />
            );
        } else if (this.state.regionComponentShow === 'notset') {
            return (
                <RegionNotsetActivity
                    navigator={this.props.navigator}
                    mobileUserData={this.props.mobileUserData}
                    onRegionComponentChange={(tag) => this._onRegionComponentChange(tag)}
                    onUserDataRefreshCallback={() => this._onUserDataRefreshCallback()}
                />
            );
        } else if (this.state.regionComponentShow === 'notset.toset') {
            return (
                <RegionNotsetToSetActivity
                    navigator={this.props.navigator}
                    mobileUserData={this.props.mobileUserData}
                    onRegionComponentChange={(tag) => this._onRegionComponentChange(tag)}
                    onUserDataRefreshCallback={() => this._onUserDataRefreshCallback()}
                />
            );
        } else {
            return (
                <RegionNotsetActivity
                    navigator={this.props.navigator}
                    mobileUserData={this.props.mobileUserData}
                    onRegionComponentChange={(tag) => this._onRegionComponentChange(tag)}
                    onUserDataRefreshCallback={() => this._onUserDataRefreshCallback()}
                />
            );
        }
    }
}

