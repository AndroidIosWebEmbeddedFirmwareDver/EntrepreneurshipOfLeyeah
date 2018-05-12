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
import UserRnaStatus from '../../../../stable/json/user.rna.status'
import NetworkCommonUtil from '../../../../utils/network.common.util'
import HeaderCommonView from '../../../views/header/header.common.view'
import QrcodeGenerView from '../../../views/qrcode/gener/qrcode.gener.view'
import CommonListItemView from '../../../views/common/common.list.item.view'
import UserDataManager from '../../../../utils/storage/user.data.manager.common.util'
import BaseActivity from "../../../views/base.activity";


export default class MeShareActivity extends BaseActivity {


    //1.
    constructor(props) {
        super(props);
        this.state = {
            mainThemeColor: null,
            mobileUserData: null,
            responValue: '',
        };
    }

    //2.
    componentWillMount() {
        super.componentWillMount();
        this._refreshUserData();
    }

    //3.
    componentDidMount() {
        super.componentDidMount();
    }

    //4.
    componentWillUnMount() {
        super.componentWillUnmount();
    }

    //查询本地缓存用户数据
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

    render() {
        return (
            <View style={MeShareActivityStyles.container}>
                <HeaderCommonView navigator={this.props.navigator}
                                  bgColor={'#FFCC33'}
                                  headerLeftShow={true}
                                  headerCenterShow={true}
                                  headerRightShow={false}
                                  showCenterAfterLeft={true}
                                  headerCenterTitle={'邀请好友'}/>

                <View
                    style={MeShareActivityStyles.function_list}>
                    <View
                        style={[MeShareActivityStyles.function_list_container, {
                            alignItems: 'center',
                            minHeight: 96,
                            backgroundColor: '#FFFFFF',
                        }]}
                    >
                        <View style={[MeShareActivityStyles.function_list_container_item, {
                            flexDirection: 'column',
                            justifyContent: 'center',
                            alignItems: 'center',
                            backgroundColor: 'transparent',
                            padding: 9.6,
                        }]}>
                            <Image
                                source={this.state.mobileUserData && this.state.mobileUserData.data && this.state.mobileUserData.data.avatarUrl ? {uri: this.state.mobileUserData.data.avatarUrl} : require('../../../../stable/image/app_a.png')}
                                style={{
                                    width: 72,
                                    height: 72,
                                    resizeMode: 'cover',
                                    borderRadius: 72 / 2,
                                    borderColor: '#FBFBFB',
                                    borderWidth: 2,

                                }}
                            />
                        </View>
                        <View style={[MeShareActivityStyles.function_list_container_item, {
                            flexDirection: 'column',
                            marginLeft: 9.6
                        }]}>
                            <Text
                                style={[MeShareActivityStyles.normal_text, {}]}>
                                {this.state.mobileUserData && this.state.mobileUserData.data && this.state.mobileUserData.data.name ? this.state.mobileUserData.data.name : ''}
                            </Text>

                        </View>
                    </View>
                </View>
                <View style={{height: 10, backgroundColor: '#FBFBFB',}}/>
                <View style={
                    {
                        flex: 1,
                        alignItems: 'center',
                        justifyContent: 'center',
                    }
                }>
                    <Text style={[MeShareActivityStyles.normal_text, {
                        marginBottom: 9.6 * 2,
                        fontWeight: 'bold',
                    }]}>邀请码:00000000{this.state.mobileUserData && this.state.mobileUserData.data && this.state.mobileUserData.data.id ? this.state.mobileUserData.data.id : ''}</Text>

                    <QrcodeGenerView
                        style={{
                            width: 128,
                            height: 128,
                        }}
                        qrcodeValue={'https://www.pgyer.com/Y1hz'}
                        qrcodeWidth={120}
                        qrcodeHeight={120}
                    />

                    <Text style={[MeShareActivityStyles.normal_text, {marginTop: 9.6 * 2}]}>邀请好友扫一扫,即刻下载乐业!</Text>
                </View>
            </View>
        );
    };
}

MeShareActivityStyles = StyleSheet.create({
    //基于flex-box布局
    container: {
        flex: 1,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FBFBFB',
    },
    function_list: {
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FBFBFB',
    },
    function_list_container: {
        flexDirection: 'row',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FBFBFB',
    },
    function_list_container_item: {
        minHeight: 20,
        flexDirection: 'row',
        justifyContent: 'flex-start',
        alignItems: 'flex-start',
    },
    normal_text: {
        fontSize: 16,
    },
});