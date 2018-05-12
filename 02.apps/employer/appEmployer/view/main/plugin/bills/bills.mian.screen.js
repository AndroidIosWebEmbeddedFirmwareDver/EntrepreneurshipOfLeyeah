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
import TableBar from '../../../views/tableBar/table.bar.common.view'
import NetworkCommonUtil from '../../../../utils/network.common.util'
import BillsHadDoneFragment from './fragment/bills.had.done.fragment'
import BillsNotDoneFragment from './fragment/bills.not.done.fragment'
import HeaderCommonView from '../../../views/header/header.common.view'
import DialogManagerUtil from '../../../views/dialog/dialog.manager.util'
import CommonListItemView from '../../../views/common/common.list.item.view'
import UserDataManager from '../../../../utils/storage/user.data.manager.common.util'
import BaseActivity from "../../../views/base.activity";


export default class BillsMianScreen extends BaseActivity {
    //1.
    constructor(props) {
        super(props);
        this.state = {
            mobileUserData: null,
            selectTableBarItemIndex: 0,
            tableBarItems: [
                {index: 0, show: '待支付'},
                {index: 1, show: '已支付'},
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
                return <BillsNotDoneFragment
                    ref={(adminhaddofragment) => this._adminhaddofragment = adminhaddofragment}
                    navigator={this.props.navigator}
                    mobileUserData={this.props.mobileUserData}
                    onRnaChangeSuccessCallback={(status) => this._onRnaChangeSuccessCallback(status)}
                />;
                break;
            case 1:
                return <BillsHadDoneFragment
                    ref={(adminnotdofragment) => this._adminnotdofragment = adminnotdofragment}
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
            <View style={BillsMianScreenStyles.container}>
                <HeaderCommonView navigator={this.props.navigator}
                                  bgColor={'#FFCC33'}
                                  headerLeftShow={true}
                                  headerCenterShow={true}
                                  headerRightShow={false}
                                  showCenterAfterLeft={true}
                                  headerCenterTitle={'账单'}/>
                <TableBar items={this.state.tableBarItems}
                          showBgShadow={false}
                          onTableBarItemSelected={(index) => this._onTableBarItemSelected(index)}
                />
                {this._render_table_bar_content(this.state.selectTableBarItemIndex)}
            </View>
        );
    };
}


BillsMianScreenStyles = StyleSheet.create({
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