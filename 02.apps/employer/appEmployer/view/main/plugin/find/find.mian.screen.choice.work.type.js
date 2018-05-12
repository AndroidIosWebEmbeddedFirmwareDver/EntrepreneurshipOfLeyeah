import React, {Component} from 'react';
import {
    Text,
    View,
    Alert,
    Image,
    Button,
    FlatList,
    Platform,
    ScrollView,
    PixelRatio,
    StyleSheet,
    Dimensions,
    TouchableOpacity,
    ActivityIndicator,
} from 'react-native';

const {
    width,
    height
} = Dimensions.get('window');


import FindMainTags from './find.main.tags'
import BaseActivity from "../../../views/base.activity";
import ToastManager from '../../../../utils/toast/Toast.util'
import NumberCommonUtil from '../../../../utils/number.common.util'
import NetworkCommonUtil from '../../../../utils/network.common.util'
import HeaderCommonView from '../../../views/header/header.common.view'


export default class ChoiceWorkTypeForFindMainScreen extends BaseActivity {
    //1.
    constructor(props) {
        super(props);
        this.state = {
            responValue: null,
            selectedWokerType: '',
            showBottom: false,
        };
    }

    //2.
    componentWillMount() {
        super.componentWillMount();
    }

    //3.
    componentDidMount() {
        super.componentDidMount();
        this._initQueryData();
    }

    //4.
    componentWillUnmount() {
        super.componentWillUnmount();
    }

    _initQueryData = () => {

        NetworkCommonUtil.httpGetRequest(NetworkCommonUtil.SERVERURL_SYS_WORK_TYPE).then((val: any) => {
            // alert(JSON.stringify(val));
            if (val && val.data) {
                this.state.responValue = val;
                for (let i of this.state.responValue.data) {
                    i.nubmerSize = NumberCommonUtil.randomNumber(56, 96, 1)[0];
                }
                this.setState({
                    responValue: this.state.responValue
                });
            } else if (val) {
                ToastManager.show(val.msg + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            } else {
                ToastManager.show('请求网络出错' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            }
        });
    };

    _onFlatListItemPress = (index) => {
        for (let i of this.state.responValue.data) {
            i.selected = false;
        }
        this.state.responValue.data[index].selected = true;
        this.state.selectedWokerType = this.state.responValue.data[index];
        this.setState({
            responValue: this.state.responValue,
            selectedWokerType: this.state.selectedWokerType,
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
        if (this.state.responValue && this.state.responValue.data) {
            for (let i = 0; i < this.state.responValue.data.length; i++) {
                pages.push(
                    <TouchableOpacity key={i}
                                      style={[this.state.responValue.data[i].selected ? ChoiceWorkTypeForFindMainScreenStyles.item_selected : ChoiceWorkTypeForFindMainScreenStyles.item_default, {
                                          width: this.state.responValue.data[i].nubmerSize,
                                          height: this.state.responValue.data[i].nubmerSize,
                                          borderRadius: this.state.responValue.data[i].nubmerSize / 2,
                                      }]}
                                      onPress={(key) => this._onFlatListItemPress(i)}
                    >
                        <Text
                            style={this.state.responValue.data[i].selected ? ChoiceWorkTypeForFindMainScreenStyles.commonText_full : ChoiceWorkTypeForFindMainScreenStyles.commonText_normal}>
                            {this.state.responValue.data[i].name}
                        </Text>
                    </TouchableOpacity>
                );
            }
        }
        return pages;
    }

    _renderNextStep() {
        if (!this.state.selectedWokerType) {
            ToastManager.show('你还没有选择工作种类！', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
        } else {
            let params = {
                selectedWokerType: this.state.selectedWokerType,
                onEmployerSendInvitCallback: () => this._onEmployerSendInvitCallback(),
            };
            // this._pushCompoent(FindMianScreenChoiceWorkExp, params);
            if (this.props.onChangeRender) {
                this.props.onChangeRender(params, FindMainTags.screenTags.WorkExp);
            }
        }
    }

    _onEmployerSendInvitCallback = () => {
        if (this.props.onEmployerSendInvitCallback) {
            this.props.onEmployerSendInvitCallback();
        }
        if (this.props.navigator) {
            this.props.navigator.pop();
        }
    };


    render() {
        return (
            <View style={ChoiceWorkTypeForFindMainScreenStyles.container}>
                <HeaderCommonView navigator={this.props.navigator}
                                  bgColor={'#FFCC33'}
                                  headerLeftShow={true}
                                  headerCenterShow={true}
                                  headerRightShow={true}
                                  headerRightButtonTitle={'下一步'}
                                  headerRightButtonOnpress={() => this._renderNextStep()}
                                  showCenterAfterLeft={true}
                                  headerCenterTitle={'选择工作种类'}/>

                <View style={[ChoiceWorkTypeForFindMainScreenStyles.function_list, {
                    flex: 0,
                }]}>
                    <View style={{height: 10, backgroundColor: '#FBFBFB',}}/>
                    <Text style={[ChoiceWorkTypeForFindMainScreenStyles.commonText_normal, {
                        marginTop: 9.6,
                        marginLeft: 9.6,
                        marginBottom: 9.6
                    }]}>
                        选择你所需要的工种
                    </Text>
                    <Text style={[ChoiceWorkTypeForFindMainScreenStyles.commonText_normal, {
                        marginLeft: 9.6,
                        marginBottom: 9.6,
                        fontSize: 12,
                    }]}>
                        开始快速筛选
                    </Text>
                </View>
                <ScrollView style={[ChoiceWorkTypeForFindMainScreenStyles.function_list, {
                    marginTop: 2,
                }]}
                            contentContainerStyle={ChoiceWorkTypeForFindMainScreenStyles.function_list_contentContainer}
                >

                    <View style={ChoiceWorkTypeForFindMainScreenStyles.containerBody}>
                        {/*动态插入View*/}
                        {this.state.responValue ?
                            this._getItems().map((itemView, index) => {
                                return itemView;
                            })
                            :
                            <View/>
                        }
                    </View>

                </ScrollView>
                {this.state.showBottom ?
                    <View
                        style={ChoiceWorkTypeForFindMainScreenStyles.itemHeadContainer_style_full}>
                        <TouchableOpacity
                            style={ChoiceWorkTypeForFindMainScreenStyles.itemHeadContainer_style_button}
                            onPress={() => this._renderCompontDownPress()}
                        >
                            <Text
                                style={ChoiceWorkTypeForFindMainScreenStyles.commonText_full}>---></Text>
                        </TouchableOpacity>
                    </View>
                    : <View/>
                }

            </View>
        );
    }
}

ChoiceWorkTypeForFindMainScreenStyles = StyleSheet.create({
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
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: 'transparent',
        padding: 9.6,
        justifyContent: 'center',
        alignItems: 'center',
    },
    item_default: {
        width: 48,
        height: 48,
        backgroundColor: '#FFFFFF',
        justifyContent: 'center',
        alignItems: 'center',
        borderRadius: 48 / 2,
        borderColor: '#FFCC33',
        borderWidth: 2,
        marginTop: 9.6,
        padding: 9.6,
    },
    item_selected: {
        width: 48,
        height: 48,
        backgroundColor: '#FFCC33',
        justifyContent: 'center',
        alignItems: 'center',
        borderRadius: 48 / 2,
        borderColor: '#FFCC33',
        borderWidth: 2,
        marginTop: 9.6,
        padding: 9.6,
    },
    itemHeadContainer_style_full: {
        width: width,
        flexDirection: 'row',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FFFFFF',
        justifyContent: 'center',
        alignItems: 'center',
    },
    itemHeadContainer_style_button: {
        flex: 1,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        height: 56,
        backgroundColor: '#FFCC33',
        justifyContent: 'center',
        alignItems: 'center',
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

