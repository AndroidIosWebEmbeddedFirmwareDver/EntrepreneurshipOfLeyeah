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
 * 手机号码编辑
 */
export default class RegionNotsetActivity extends BaseActivity {
    //1.
    constructor(props) {
        super(props);
        this.state = {};
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

    _onJointoSetRegion = () => {
        if (this.props.onRegionComponentChange) {
            this.props.onRegionComponentChange('notset.toset');
        }
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
        return (
            <View style={RegionNotsetActivityStyles.container}>
                <HeaderCommonView navigator={this.props.navigator}
                                  bgColor={'#FFCC33'}
                                  headerLeftShow={true}
                                  headerCenterShow={true}
                                  headerRightShow={false}
                                  showCenterAfterLeft={true}
                                  headerCenterTitle={'所在地址'}/>
                <View style={RegionNotsetActivityStyles.function_list}>
                    <View style={{height: 10, backgroundColor: 'transparent',}}/>

                    <View
                        style={RegionNotsetActivityStyles.login_itemHeadContainer_style_normal}>
                        <Image
                            source={require('../../../../../stable/image/ic_app_error.png')}
                            style={{
                                width: 56,
                                height: 56,
                                marginBottom: 9.6,
                            }}
                        />
                        <Text
                            style={[RegionNotsetActivityStyles.normal_Text, {marginTop: 9.6 * 2}]}>还未设置所在位置</Text>
                    </View>
                    <View
                        style={[RegionNotsetActivityStyles.login_itemHeadContainer_style_normal, {
                            flex: 1,
                            flexDirection: 'row',
                            justifyContent: 'flex-end',
                            alignItems: 'flex-end',
                            padding: 9.6,
                        }]}>
                        <TouchableOpacity
                            style={[RegionNotsetActivityStyles.login_itemHeadContainer_style_border, {}]}
                            onPress={() => this._onJointoSetRegion()}
                        >
                            <Text
                                style={RegionNotsetActivityStyles.normal_Text}>立即设置</Text>
                        </TouchableOpacity>
                    </View>
                </View>
            </View>
        );
    }
}
RegionNotsetActivityStyles = StyleSheet.create({
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
    login_itemHeadContainer_style_normal: {
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        justifyContent: 'center',
        alignItems: 'center',
        padding: 9.6,
    },
    login_itemHeadContainer_style_border: {
        flex: 1,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        height: 56,
        backgroundColor: 'transparent',
        justifyContent: 'center',
        alignItems: 'center',
        borderRadius: 4.8,
        borderColor: '#FFCC33',
        borderWidth: 2,
        padding: 9.6,
    },

    normal_Text: {
        fontSize: 16,
        color: '#000000',
    },

});