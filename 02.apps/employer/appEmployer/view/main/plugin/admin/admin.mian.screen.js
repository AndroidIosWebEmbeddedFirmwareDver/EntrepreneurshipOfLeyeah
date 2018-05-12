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
import AdminHadDoFragment from './fragment/admin.had.do.fragment'
import AdminNotDoFragment from './fragment/admin.not.do.fragment'
import AdminDoneDoFragment from './fragment/admin.done.do.fragment'
import TableBar from '../../../views/tableBar/table.bar.common.view'
import NetworkCommonUtil from '../../../../utils/network.common.util'
import HeaderCommonView from '../../../views/header/header.common.view'
import DialogManagerUtil from '../../../views/dialog/dialog.manager.util'
import CommonListItemView from '../../../views/common/common.list.item.view'
import UserDataManager from '../../../../utils/storage/user.data.manager.common.util'
import BaseActivity from "../../../views/base.activity";


export default class OrderMainScreen extends BaseActivity {
    //1.
    constructor(props) {
        super(props);
        this.state = {
            mobileUserData: null,
            selectTableBarItemIndex: 0,
            tableBarItems: [
                {index: 0, show: '开工中'},
                {index: 1, show: '待开工'},
                {index: 2, show: '已完工'},
            ],
        };
    }


    //2.
    componentWillMount() {
        super.componentWillMount();
        this._refreshUserData().then(data => {
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

    //4.
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
                return <AdminHadDoFragment
                    ref={(adminhaddofragment) => this._adminhaddofragment = adminhaddofragment}
                    navigator={this.props.navigator}
                    mobileUserData={this.props.mobileUserData}
                    onRnaChangeSuccessCallback={(status) => this._onRnaChangeSuccessCallback(status)}
                />;
                break;
            case 1:
                return <AdminNotDoFragment
                    ref={(adminnotdofragment) => this._adminnotdofragment = adminnotdofragment}
                    navigator={this.props.navigator}
                    mobileUserData={this.props.mobileUserData}
                    onRnaChangeSuccessCallback={(status) => this._onRnaChangeSuccessCallback(status)}/>;
                break;
            case 2:
                return <AdminDoneDoFragment
                    ref={(admindonedofragment) => this._admindonedofragment = admindonedofragment}
                    navigator={this.props.navigator}
                    mobileUserData={this.props.mobileUserData}
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
            <View style={OrderMainScreenStyles.container}>
                <HeaderCommonView navigator={this.props.navigator}
                                  bgColor={'#FFCC33'}
                                  headerLeftShow={true}
                                  headerCenterShow={true}
                                  headerRightShow={false}
                                  showCenterAfterLeft={true}
                                  headerCenterTitle={'管理'}/>
                <TableBar items={this.state.tableBarItems}
                          showBgShadow={false}
                          onTableBarItemSelected={(index) => this._onTableBarItemSelected(index)}
                />
                {this._render_table_bar_content(this.state.selectTableBarItemIndex)}
            </View>
        );
    };
}


OrderMainScreenStyles = StyleSheet.create({
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

});