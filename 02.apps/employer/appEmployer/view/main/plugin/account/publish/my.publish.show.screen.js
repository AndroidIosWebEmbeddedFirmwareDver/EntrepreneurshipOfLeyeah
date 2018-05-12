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
    Dimensions,
    ActivityIndicator,
    TouchableOpacity,
    StyleSheet,
    FlatList,
} from 'react-native';

const {
    width,
    height
} = Dimensions.get('window');


import ToastManager from '../../../../../utils/toast/Toast.util'
import TableBar from '../../../../views/tableBar/table.bar.common.view'
import NetworkCommonUtil from '../../../../../utils/network.common.util'
import HeaderCommonView from '../../../../views/header/header.common.view'
import DialogManagerUtil from '../../../../views/dialog/dialog.manager.util'
import CommonListItemView from '../../../../views/common/common.list.item.view'
import MyPublishShowInRecruitFragment from './fragment/my.publish.show.in.recruit.fragment'
import MyPublishShowOutRecruitFragment from './fragment/my.publish.show.out.recruit.fragment'
import UserDataManager from '../../../../../utils/storage/user.data.manager.common.util'
import BaseActivity from "../../../../views/base.activity";

export default class MyPublishShowScreen extends BaseActivity {
    constructor(props) {
        super(props);
        this.state = {
            selectTableBarItemIndex: 0,
            tableBarItems: [
                {index: 0, show: '招聘中'},
                {index: 1, show: '已完成'},
            ],
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
        if (component) {
            this.props.navigator.push({
                component: component,
                params: params,
            });
        }
    };


    _onRnaChangeSuccessCallback = (status) => {
        this.setState({
            beRna: status,
        });
        if (this.props.onRnaChangeSuccessCallback) {
            this.props.onRnaChangeSuccessCallback();
        }
    };

    _render_table_bar_content = (index) => {
        switch (index) {
            case 0:
                return <MyPublishShowInRecruitFragment
                    ref={(myPublishShowInRecruitFragment) => this._myPublishShowInRecruitFragment = myPublishShowInRecruitFragment}
                    navigator={this.props.navigator}
                    mobileUserData={this.props.mobileUserData}
                    workOrderPushType={this.props.selectedWorkOrderPushType}
                    onRnaChangeSuccessCallback={(status) => this._onRnaChangeSuccessCallback(status)}
                />;
                break;
            case 1:
                return <MyPublishShowOutRecruitFragment
                    ref={(myPublishShowOutRecruitFragment) => this._myPublishShowOutRecruitFragment = myPublishShowOutRecruitFragment}
                    navigator={this.props.navigator}
                    mobileUserData={this.props.mobileUserData}
                    workOrderPushType={this.props.selectedWorkOrderPushType}
                    onRnaChangeSuccessCallback={(status) => this._onRnaChangeSuccessCallback(status)}/>;
                break;
        }
    };
    _onTableBarItemSelected = (index) => {
        this.setState({
            selectTableBarItemIndex: index,
        });
    };


    render() {
        return (
            <View style={MyPublishShowScreenStyles.container}>
                <HeaderCommonView navigator={this.props.navigator}
                                  bgColor={'#FFCC33'}
                                  headerLeftShow={true}
                                  headerCenterShow={true}
                                  headerRightShow={false}
                                  showCenterAfterLeft={true}
                                  headerCenterTitle={this.props.showScreenTitle ? this.props.showScreenTitle : '选择发布种类'}/>
                <TableBar
                    items={this.state.tableBarItems}
                    showBgShadow={false}
                    onTableBarItemSelected={(index) => this._onTableBarItemSelected(index)}
                />
                {this._render_table_bar_content(this.state.selectTableBarItemIndex)}
            </View>
        );
    }
}


MyPublishShowScreenStyles = StyleSheet.create({
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
    cut_line_view: {
        height: 2.4,
        backgroundColor: '#FBFBFB',
    },

});

