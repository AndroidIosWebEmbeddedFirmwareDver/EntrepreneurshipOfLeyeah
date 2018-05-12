import React, {PureComponent, Component} from 'react';
import {
    StyleSheet,
    TouchableOpacity,
    View,
    Text,
    TextInput,
    Button,
    ActivityIndicator,
} from 'react-native';


import ToastManager from '../../../../../utils/toast/Toast.util'
import NetworkCommonUtil from '../../../../../utils/network.common.util'
import UserDataManager from '../../../../../utils/storage/user.data.manager.common.util'
import UserRnaStatus from '../../../../../stable/json/user.rna.status'
import CommonListItemView from '../../../../views/common/common.list.item.view'
import HeaderCommonView from '../../../../views/header/header.common.view'
import BaseActivity from "../../../../views/base.activity";


export default class UpdateManagerAccountActivity extends BaseActivity {

    //1.
    constructor(props) {
        super(props);
        this.state = {
            mobileUserData: null,
            meSoftUpdateValue: null,
            meSoftUpdateShow: null,
        };
    }

    //2.
    componentWillMount() {
        super.componentWillMount();
        this._refreshUserData().then((ret) => {
            this._initGetIsMeNeedToUpdate();
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
    _initGetIsMeNeedToUpdate = () => {

        NetworkCommonUtil.httpGetRequest(NetworkCommonUtil.SERVERURL_POST_API_MOBILE_SOFT_UPDATE_CHECKISMENEEDUPDATE).then((val: any) => {
            // alert(JSON.stringify(val));
            if (val && val.code === NetworkCommonUtil.SERVER_HTTP_TASK_STATUS_SUCCESS) {
                this.setState({
                    meSoftUpdateValue: val,
                    meSoftUpdateShow: val.data.msg,
                });
            } else if (val) {
                if (val.data) {
                    this.setState({
                        meSoftUpdateShow: val.data.msg,
                    });
                    ToastManager.alertWithSure('提示', this.state.meSoftUpdateShow, () => {
                        if (this.props.navigator) {
                            this.props.navigator.pop();
                        }
                    })
                }
            } else {
                ToastManager.show('请求网络出错' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            }
        });
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


    render() {
        return (
            <View style={UpdateManagerAccountActivityStyles.container}>
                <HeaderCommonView navigator={this.props.navigator}
                                  bgColor={'#FFCC33'}
                                  headerLeftShow={true}
                                  headerCenterShow={true}
                                  headerRightShow={false}
                                  showCenterAfterLeft={true}
                                  headerCenterTitle={'版本更新'}/>
                <View style={UpdateManagerAccountActivityStyles.function_list}>
                    {this.state.meSoftUpdateShow ?
                        <Text style={UpdateManagerAccountActivityStyles.normal_text}>
                            {this.state.meSoftUpdateShow}
                        </Text>
                        :
                        <ActivityIndicator/>
                    }
                </View>

            </View>
        );
    };
}

UpdateManagerAccountActivityStyles = StyleSheet.create({
    //基于flex-box布局
    container: {
        flex: 1,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FBFBFB',
    },
    function_list: {
        flex: 1,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FBFBFB',
        alignItems: 'center',
        justifyContent: 'center',
    },
    normal_text: {
        fontSize: 16,
    }
});