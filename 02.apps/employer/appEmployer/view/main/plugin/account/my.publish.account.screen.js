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

import ToastManager from '../../../../utils/toast/Toast.util'
import MyPublishShowScreen from './publish/my.publish.show.screen'
import NumberCommonUtil from '../../../../utils/number.common.util'
import NetworkCommonUtil from '../../../../utils/network.common.util'
import HeaderCommonView from '../../../views/header/header.common.view'
import DialogManagerUtil from '../../../views/dialog/dialog.manager.util'
import UserDataManager from '../../../../utils/storage/user.data.manager.common.util'
import BaseActivity from "../../../views/base.activity";


export default class MyPublishAccountScreen extends BaseActivity {
    //1.
    constructor(props) {
        super(props);
        this.state = {
            mobileUserData: null,
            selectedWokerType: null,
            tableBarItems: [
                {index: 0, show: '普通发布', selected: false, workOrderPushType: 0,},
                {index: 1, show: '紧急发布', selected: false, workOrderPushType: 1,},
                {index: 2, show: '直接招聘', selected: false, workOrderPushType: 2,},
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


    //页面跳转
    _pushCompoent = (component: Component, params: any) => {
        if (component) {
            this.props.navigator.push({
                component: component,
                params: params,
            });
        }
    };

    _getItems() {
        let pages = [];
        if (this.state.tableBarItems) {
            for (let i = 0; i < this.state.tableBarItems.length; i++) {
                pages.push(
                    <TouchableOpacity key={i}
                                      style={[this.state.tableBarItems[i].selected ? MyPublishAccountScreenStyles.item_selected : MyPublishAccountScreenStyles.item_default, {
                                          width: 90,
                                          height: 90,
                                          borderRadius: 90 / 2,
                                          margin: 16,
                                      }]}
                                      onPress={(key) => this._onFlatListItemPress(i)}
                    >
                        <Text
                            style={this.state.tableBarItems[i].selected ? MyPublishAccountScreenStyles.commonText_full : MyPublishAccountScreenStyles.commonText_normal}>
                            {this.state.tableBarItems[i].show}
                        </Text>
                    </TouchableOpacity>
                );
            }
        }
        return pages;
    }

    _onFlatListItemPress = (index) => {
        for (let i of this.state.tableBarItems) {
            i.selected = false;
        }
        this.state.tableBarItems[index].selected = true;
        this.state.selectedWokerType = this.state.tableBarItems[index];
        this.setState({
            tableBarItems: this.state.tableBarItems,
            selectedWokerType: this.state.selectedWokerType,
        });
    };

    _renderNextStep() {
        if (!this.state.selectedWokerType) {
            ToastManager.show('你还没有选择工作发布种类！', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
        } else {
            let params = {
                mobileUserData: this.state.mobileUserData,
                selectedWorkOrderPushType: this.state.selectedWokerType.workOrderPushType,
                showScreenTitle: this.state.selectedWokerType.show,
            };
            this._pushCompoent(MyPublishShowScreen, params);
        }
    }


    render() {
        return (
            <View style={MyPublishAccountScreenStyles.container}>
                <HeaderCommonView navigator={this.props.navigator}
                                  bgColor={'#FFCC33'}
                                  headerLeftShow={true}
                                  headerCenterShow={true}
                                  headerRightShow={true}
                                  headerRightButtonTitle={'下一步'}
                                  headerRightButtonOnpress={() => this._renderNextStep()}
                                  showCenterAfterLeft={true}
                                  headerCenterTitle={'选择发布种类'}/>

                <View style={[MyPublishAccountScreenStyles.function_list, {
                    flex: 1,
                }]}>
                    <View style={MyPublishAccountScreenStyles.containerBody}>
                        {/*动态插入View*/}
                        {this.state.tableBarItems ?
                            this._getItems().map((itemView, index) => {
                                return itemView;
                            })
                            :
                            <View/>
                        }
                    </View>

                </View>

            </View>
        );
    }
}

MyPublishAccountScreenStyles = StyleSheet.create({
    //基于flex-box布局
    container: {
        flex: 1,
        width: width,
        height: height,
        backgroundColor: '#FBFBFB',
    },

    function_list: {
        flex: 1,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FFFFFF',
    },
    function_list_contentContainer: {
        // paddingVertical: 16,
        //暂时解决安卓下布局显示不完整
        paddingBottom: 24,
    },
    containerBody: {
        flex: 1,
        flexDirection: 'row',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: 'transparent',
        padding: 9.6,
        justifyContent: 'center',
        alignItems: 'center',
    },
    item_default: {
        width: 36,
        height: 36,
        backgroundColor: '#FFFFFF',
        justifyContent: 'center',
        alignItems: 'center',
        borderRadius: 36 / 2,
        borderColor: '#FFCC33',
        borderWidth: 2,
        padding: 9.6,
    },
    item_selected: {
        width: 36,
        height: 36,
        backgroundColor: '#FFCC33',
        justifyContent: 'center',
        alignItems: 'center',
        borderRadius: 36 / 2,
        borderColor: '#FFCC33',
        borderWidth: 2,
        padding: 9.6,
    },

    commonText_full: {
        color: '#FFFFFF',
        fontSize: 16,
    },

    commonText_normal: {
        fontSize: 16,
    },
    shadowStyle: {
        shadowColor: '#FFCC33',
        shadowOffset: {
            width: 2,
            height: 2
        },
        shadowOpacity: 0.8,
        shadowRadius: 4.8,
        elevation: 10
    },

});

