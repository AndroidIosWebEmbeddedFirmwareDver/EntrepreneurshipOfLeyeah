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


import ToastManager from '../../../../../../utils/toast/Toast.util'
import NetworkCommonUtil from '../../../../../../utils/network.common.util'
import AsyncstorageKeyCommonUtil from '../../../../../../utils/storage/asyncstorage.key.common.util'
import AsyncstorageStorageCommonUtil from '../../../../../../utils/storage/asyncstorage.storage.common.util'
import UserDataManager from '../../../../../../utils/storage/user.data.manager.common.util'
import CommonListItemView from '../../../../../views/common/common.list.item.view'
import DialogManagerUtil from '../../../../../views/dialog/dialog.manager.util'
import ImagePickerCommonUtil from '../../../../../../utils/image.picker.common'


import UserRnaStatus from '../../../../../../stable/json/user.rna.status'
import HeaderCommonView from '../../../../../views/header/header.common.view'
import BaseActivity from "../../../../../views/base.activity";


export default class RnaStatusActivity extends BaseActivity {
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

    render() {
        return (
            <View style={RnaStatusActivityStyles.container}>
                <HeaderCommonView navigator={this.props.navigator}
                                  bgColor={'#FFCC33'}
                                  headerLeftShow={true}
                                  headerCenterShow={true}
                                  headerRightShow={false}
                                  showCenterAfterLeft={true}
                                  headerCenterTitle={'实名认证'}/>

                <Text>
                    {
                        UserRnaStatus.rnaShow(this.props.mobileUserData)
                    }
                </Text>
            </View>
        );
    };
}

RnaStatusActivityStyles = StyleSheet.create({
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
    function_list_container: {
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FBFBFB',
    },
});