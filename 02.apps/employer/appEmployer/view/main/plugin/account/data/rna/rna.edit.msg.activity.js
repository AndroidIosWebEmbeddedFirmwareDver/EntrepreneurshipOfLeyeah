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

import HeaderCommonView from '../../../../../views/header/header.common.view'
import TableBar from '../../../../../views/tableBar/table.bar.common.view'

import RnaSelfsFragment from './fragment/rna.selfs.fragment'
import RnaCompanyFragment from './fragment/rna.company.fragment'
import BaseActivity from "../../../../../views/base.activity";

export default class RnaEditMsgActivity extends BaseActivity {

    //1.
    constructor(props) {
        super(props);
        this.state = {
            mobileUserData: null,
            selectTableBarItemIndex: 0,
            tableBarItems: [
                {index: 0, show: '个人身份认证'},
                {index: 1, show: '企业身份认证'},
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

    //实名认证
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
                return <RnaSelfsFragment
                    ref={(rnaSelfsFragment) => this._rnaSelfsFragment = rnaSelfsFragment}
                    navigator={this.props.navigator}
                    mobileUserData={this.props.mobileUserData}
                    onRnaChangeSuccessCallback={(status) => this._onRnaChangeSuccessCallback(status)}
                />;
                break;
            case 1:
                return <RnaCompanyFragment
                    ref={(rnaCompanyFragment) => this._rnaCompanyFragment = rnaCompanyFragment}
                    navigator={this.props.navigator}
                    mobileUserData={this.props.mobileUserData}
                    onRnaChangeSuccessCallback={(status) => this._onRnaChangeSuccessCallback(status)}/>;
                break;
        }
    };


    _ValidNetVerCode = () => {
        switch (this.state.selectTableBarItemIndex) {
            case 0:
                if (this._rnaSelfsFragment && this._rnaSelfsFragment._ValidNetVerCode) {
                    this._rnaSelfsFragment._ValidNetVerCode();
                }
                break;
            case 1:
                if (this._rnaCompanyFragment && this._rnaCompanyFragment._ValidNetVerCode) {
                    this._rnaCompanyFragment._ValidNetVerCode();
                }
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
            <View style={RnaEditMsgActivityStyles.container}>
                <HeaderCommonView navigator={this.props.navigator}
                                  bgColor={'#FFCC33'}
                                  headerLeftShow={true}
                                  headerCenterShow={true}
                                  headerRightShow={true}
                                  headerRightButtonTitle={'完成'}
                                  headerRightButtonOnpress={() => this._ValidNetVerCode()}
                                  showCenterAfterLeft={true}
                                  headerCenterTitle={'实名认证'}/>
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


RnaEditMsgActivityStyles = StyleSheet.create({
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