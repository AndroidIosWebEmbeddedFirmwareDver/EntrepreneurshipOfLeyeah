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


import ToastManager from '../../../../utils/toast/Toast.util'
import NetworkCommonUtil from '../../../../utils/network.common.util'

import UserDataManager from '../../../../utils/storage/user.data.manager.common.util'
import UserRnaStatus from '../../../../stable/json/user.rna.status'

import CommonListItemView from '../../../views/common/common.list.item.view'
import TableBar from '../../../views/tableBar/table.bar.common.view'
import HeaderCommonView from '../../../views/header/header.common.view'


import GrabWorkFragment from './mework/grab.work.fragment'
import FindWorkFragment from './mework/find.work.fragment'
import InvitWorkFragment from './mework/invit.work.fragment'
import BaseActivity from "../../../views/base.activity";


export default class MeWorkActivity extends BaseActivity {
    //1.
    constructor(props) {
        super(props);
        this.state = {
            mobileUserData: null,
            selectTableBarItemIndex: 0,
            tableBarItems: [
                {index: 0, show: '抢急聘'},
                {index: 1, show: '找工作'},
                {index: 2, show: '被邀请'},
            ],
        };
    }

    //2.
    componentWillMount() {
        super.componentWillMount();
        this._refreshUserData().then((ret) => {
        });
    }

    //3.
    componentDidMount() {
        super.componentDidMount();
    }

    //4.
    componentWillUnMount() {
        super.componentWillUnmount();
    }

    //1.查询本地缓存用户数据
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

    _render_table_bar_content = (index) => {
        switch (index) {
            case 0:
                return <GrabWorkFragment navigator={this.props.navigator}/>;
                break;
            case 1:
                return <FindWorkFragment navigator={this.props.navigator}/>;
                break;
            case 2:
                return <InvitWorkFragment navigator={this.props.navigator}/>;
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
            <View style={MeWorkActivityStyles.container}>
                <HeaderCommonView navigator={this.props.navigator}
                                  bgColor={'#FFCC33'}
                                  headerLeftShow={true}
                                  headerCenterShow={true}
                                  headerRightShow={false}
                                  showCenterAfterLeft={true}
                                  headerCenterTitle={'我的工作'}/>
                <TableBar items={this.state.tableBarItems}
                          showBgShadow={false}
                          onTableBarItemSelected={(index) => this._onTableBarItemSelected(index)}
                />
                {
                    this._render_table_bar_content(this.state.selectTableBarItemIndex)
                }
            </View>
        );
    };
}

MeWorkActivityStyles = StyleSheet.create({
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