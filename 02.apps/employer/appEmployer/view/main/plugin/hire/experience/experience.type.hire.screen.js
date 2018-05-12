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
    CheckBox,
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


export default class ExperienceRequireTypeHireScreen extends BaseActivity {
    constructor(props) {
        super(props);

        this.state = {
            responValue: '',
            selectedResponse: '',
            backViewShow: '',
        };
    }

    //2.
    componentWillMount() {
        super.componentWillMount();
    }

    //3.
    componentDidMount() {
        super.componentDidMount();
        this.initQueryData();
    }

    //4.
    componentWillUnmount() {
        super.componentWillUnmount();
    }

    //keyExtractor tells the list to use the ids for the react keys instead of the default key property.
    _keyExtractor = (item, index) => item.id;

    initQueryData = () => {
        NetworkCommonUtil.httpGetRequest(NetworkCommonUtil.SERVERURL_SYS_ORDER_EXPRERIENCEREQUIRETYPE_QUERYALL_GET).then((val: any) => {
            // alert(JSON.stringify(val));
            if (val && val.code === NetworkCommonUtil.SERVER_HTTP_TASK_STATUS_SUCCESS) {
                // this.setState({responValue: this._generNetToLocalData(val)});
                if (val.data && val.data.length > 0) {
                    this.setState({
                        responValue: val,
                        backViewShow: null,
                    });
                } else {
                    this.setState({
                        responValue: null,
                        backViewShow: '暂无工作种类',
                    });
                }
            } else if (val) {
                ToastManager.show(val.msg + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            } else {
                ToastManager.show('请求网络出错' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            }
        });
    };
    _onFlatListItemPress = (index) => {
        // alert(index+'selected');
        for (let i of this.state.responValue.data) {
            i.selected = false;
        }
        this.state.responValue.data[index].selected = true;
        this.state.selectedResponse = this.state.responValue.data[index];
        this.setState({
            responValue: this.state.responValue,
            selectedResponse: this.state.selectedResponse,
        });
    };
    _renderFlatListItem = (item, index) => {
        return (
            <CommonHireListItem
                id={item.id}
                leftShowTitle={this.state.responValue.data[index].description}
                rightShowSelect={this.state.responValue.data[index].selected}
                onSelectPress={() => this._onFlatListItemPress(index)}
            />
        );
    };

    _renderCompontDownPress() {
        if (!this.state.selectedResponse) {
            ToastManager.show('你还没有选择工作经验！', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
        } else {
            // alert(JSON.stringify(this.state.responValue));
            if (this.props.cllbackSetSelectedExperienceType) {
                this.props.cllbackSetSelectedExperienceType(this.state.selectedResponse);
            }
            this.props.navigator.pop();

        }
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
                                  headerCenterTitle={'选择工作经验'}/>
                <FlatList
                    style={{marginTop: 9.6}}
                    ref={(flatList) => this._flatList = flatList}
                    data={this.state.responValue.data}
                    keyExtractor={this._keyExtractor}
                    renderItem={({item, index}) => this._renderFlatListItem(item, index)}
                />

            </View>
        );
    };
}