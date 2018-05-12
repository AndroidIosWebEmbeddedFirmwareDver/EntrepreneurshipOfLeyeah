import React, {PureComponent, Component} from 'react';
import {
    Text,
    ScrollView,
    Image,
    Button,
    View,
    Platform,
    PixelRatio,
    Alert,
    TextInput,
    Dimensions,
    ActivityIndicator,
    StyleSheet,
    TouchableOpacity,
} from 'react-native';

const {
    width,
    height
} = Dimensions.get('window');

import HeaderCommonView from '../../../../views/header/header.common.view'
import CommonListItemView from '../../../../views/common/common.list.item.view'

import ToastManager from '../../../../../utils/toast/Toast.util'
import NetworkCommonUtil from '../../../../../utils/network.common.util'
import DialogManagerUtil from '../../../../views/dialog/dialog.manager.util'
import UserDataManager from '../../../../../utils/storage/user.data.manager.common.util'
import BaseActivity from "../../../../views/base.activity";

/**
 * 用户名称编辑
 */
export default class NameActivity extends BaseActivity {
    //1.
    constructor(props) {
        super(props);
        this.state = {
            nameText: null,
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
        if (!component) {
            return;
        }
        this.props.navigator.push({
            component: component,
            params: params,
        });
    };


    _uploadName = () => {
        if (!this.state.nameText) {
            ToastManager.show('请输入', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            return;
        }
        if (this.state.nameText.length > 4) {
            ToastManager.show('姓名不能超过4个字', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            return;
        }

        DialogManagerUtil.showNormalLoadingDialog();
        let params = {
            id: this.props.mobileUserData.data.id,
            phone: this.props.mobileUserData.data.phone,
            typeId: this.props.mobileUserData.data.typeId,
            name: this.state.nameText,
        };
        NetworkCommonUtil.httpPostRequest(JSON.stringify(params), NetworkCommonUtil.SERVERURL_SYS_USER_UPDATE_NAME).then((val: any) => {

            if (val && val.code === NetworkCommonUtil.SERVER_HTTP_TASK_STATUS_SUCCESS) {
                // ToastManager.show(val.msg + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
                if (val.data) {
                    this._onNameChangeSuccessCallback(val.data.name);
                }
            } else if (val) {
                ToastManager.show(val.msg + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            } else {
                ToastManager.show('请求网络出错' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            }
            DialogManagerUtil.hide();
        });
    };

    _onInputParamsChange = (text) => {
        this.setState({
            nameText: text,
        });
    };

    _onNameChangeSuccessCallback = (name) => {
        UserDataManager.getInstance().saveName(name).then(saveToMap => {
            if (this.props.onUserDataRefreshCallback) {
                this.props.onUserDataRefreshCallback(name);
            }
            if (this.props.navigator) {
                this.props.navigator.pop();
            }
        });
    };

    render() {
        return (
            <View style={NameActivityStyles.container}>
                <HeaderCommonView navigator={this.props.navigator}
                                  bgColor={'#FFCC33'}
                                  headerLeftShow={true}
                                  headerCenterShow={true}
                                  headerRightShow={true}
                                  headerRightButtonTitle={'完成'}
                                  headerRightButtonOnpress={() => this._uploadName()}
                                  showCenterAfterLeft={true}
                                  headerCenterTitle={'我的姓名'}/>
                <View style={NameActivityStyles.function_list}>
                    <View style={{height: 10, backgroundColor: 'transparent',}}/>
                    <View style={[NameActivityStyles.function_list_item, {}]}>
                        <TextInput style={[NameActivityStyles.function_list_item_view, {
                            margin: 9.6,
                            padding: 0,
                        }]}
                                   underlineColorAndroid="transparent"
                                   placeholder={this.props.mobileUserData.data.name}
                                   onChangeText={(text) => this._onInputParamsChange(text)}
                                   clearButtonMode={'while-editing'}
                                   keyboardType={'default'}
                                   autoFocus={true}
                        />
                    </View>
                </View>
            </View>
        );
    }
}

NameActivityStyles = StyleSheet.create({
    //基于flex-box布局
    container: {
        flex: 1,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FBFBFB',
    },
    function_list: {
        flex: 1,
        flexDirection: 'column',
        backgroundColor: '#FBFBFB',
    },
    function_list_item: {
        flex: 1,
        flexDirection: 'row',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FBFBFB',
        justifyContent: 'center',
        alignItems: 'flex-start',
    },
    function_list_item_view: {
        flex: 1,
        height: 56,
        flexDirection: 'row',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FFFFFF',
        justifyContent: 'center',
        alignItems: 'center',
    },
});


/*
position:'relative'
相对布局。这个和html的position有很大的不同，他的相对布局不是相对于父容器，而是相对于兄弟节点。
position:'absolute'
绝对布局。这个是相对于父容器进行据对布局。绝对布局是脱离文档流的，不过奇怪的是依旧在文档层次结构里面，
这个和html的position也很大不一样。另外还有一个和html不一样的是，html中position:absolute要求父容
器的position必须是absolute或者relative，如果第一层父容器position不是absolute或者relative，
在html会依次向上递归查询直到找到为止，然后居于找到的父容器绝对定位。
* */