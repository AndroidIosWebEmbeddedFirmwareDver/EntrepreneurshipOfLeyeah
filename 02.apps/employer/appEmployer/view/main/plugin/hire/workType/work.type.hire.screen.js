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
    TextInput,
    FlatList,
    StyleSheet,
    Dimensions,
    ActivityIndicator,
    TouchableOpacity,
} from 'react-native';

import styles from '../../plugin.common.style'

import HeaderCommonView from '../../../../views/header/header.common.view'
import NetworkCommonUtil from '../../../../../utils/network.common.util'
import UserDataManager from '../../../../../utils/storage/user.data.manager.common.util'
import ToastManager from '../../../../../utils/toast/Toast.util'
import DialogManagerUtil from '../../../../views/dialog/dialog.manager.util'
import CommonListItemView from '../../../../views/common/common.list.item.view'

import CommonHireListItem from '../common/common.hire.views'
import BaseActivity from "../../../../views/base.activity";


export default class WorkTypeHireScreen extends BaseActivity {
    constructor(props) {
        super(props);
        this.state = {
            responValue: '',
            selectedWokerType: '',
        };
    }

    //2.
    componentWillMount() {
        super.componentWillMount();
    }

    //3.
    componentDidMount() {
        super.componentDidMount();
        // InteractionManager.runAfterInteractions(() => {
        //     //处理消耗时间和性能的任务，把主线程让出来加载UI
        //     this.initQueryProvinceData();
        // });
        this.initQueryData();
    }

    //4.
    componentWillUnmount() {
        super.componentWillUnmount();
    }


    //keyExtractor tells the list to use the ids for the react keys instead of the default key property.
    _keyExtractor = (item, index) => item.id;

    initQueryData = () => {
        NetworkCommonUtil.httpGetRequest(NetworkCommonUtil.SERVERURL_SYS_WORK_TYPE).then((val: any) => {
            // alert(JSON.stringify(val));
            this.setState({responValue: val});
        });
    };
    _onFlatListItemPress = (index) => {
        // alert(index+'selected');
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
    _renderFlatListItem = (item, index) => {
        return (
            <CommonHireListItem
                id={item.id}
                leftShowTitle={this.state.responValue.data[index].name}
                rightShowSelect={this.state.responValue.data[index].selected}
                onSelectPress={() => this._onFlatListItemPress(index)}
            />
        );
    };

    _renderCompontDownPress() {
        if (!this.state.selectedWokerType) {
            ToastManager.show('你还没有选择工种！', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
        } else {
            // alert(JSON.stringify(this.state.responValue));
            if (this.props.cllbackSetSelectedWokerType) {
                this.props.cllbackSetSelectedWokerType(this.state.selectedWokerType);
            }
            this.props.navigator.pop();

        }
        ``
    }

    render() {
        const {navigator} = this.props.navigator;
        return (
            <View style={styles.container}>

                <HeaderCommonView navigator={this.props.navigator}
                                  bgColor={'#FFCC33'}
                                  headerLeftShow={true}
                                  headerCenterShow={true}
                                  headerRightShow={true}
                                  showCenterAfterLeft={true}
                                  headerRightButtonTitle={'完成'}
                                  headerRightButtonOnpress={() => this._renderCompontDownPress()}
                                  headerCenterTitle={'选择工种'}/>

                <View style={WorkTypeHireScreenStyles.function_list}>
                    <FlatList
                        style={{marginTop: 9.6}}
                        ref={(flatList) => this._flatList = flatList}
                        data={this.state.responValue.data}
                        keyExtractor={this._keyExtractor}
                        renderItem={({item, index}) => this._renderFlatListItem(item, index)}
                        contentContainerStyle={WorkTypeHireScreenStyles.function_list_contentContainer}
                    />
                </View>
            </View>
        );
    };
}


WorkTypeHireScreenStyles = StyleSheet.create({
    //基于flex-box布局
    container: {
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FBFBFB',
    },
    function_list: {
        flex: 1,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FBFBFB',
    },
    function_list_contentContainer: {
        // paddingVertical: 16,
        //暂时解决安卓下布局显示不完整
        paddingBottom: 24,
    },
    list_view: {
        flex: 1,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
    },
    function_list_container: {
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FBFBFB',
    },
    normal_text: {
        fontSize: 16,
    }
});