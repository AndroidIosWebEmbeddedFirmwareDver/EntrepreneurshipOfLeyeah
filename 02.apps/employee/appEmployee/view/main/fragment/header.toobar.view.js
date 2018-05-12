import React, {PureComponent, Component} from 'react';

import {
    View,
    Text,
    Platform,
    TouchableOpacity,
    Image,
    StyleSheet,
    Dimensions,
    PixelRatio,
    ActivityIndicator,
} from 'react-native';


const {
    width,
    height
} = Dimensions.get('window');

import ToastManager from '../../../utils/toast/Toast.util'
import NetworkCommonUtil from '../../../utils/network.common.util'

class FragmentHeaderToobarView extends Component {
    //1.
    constructor(props) {
        super(props);
        this.state = {
            responValue: null,
        };
    }

    //2.
    componentWillMount() {
    }

    //3.
    componentDidMount() {

    }

    _querySortTypeData = () => {
        NetworkCommonUtil.httpGetRequest(NetworkCommonUtil.SERVERURL_GET_ORDER_SORTTYPE).then((val: any) => {
            // alert(JSON.stringify(val));
            if (val && val.code === NetworkCommonUtil.SERVER_HTTP_TASK_STATUS_SUCCESS) {
                this.setState({responValue: val});
                if (this.state.responValue && this.state.responValue.data) {
                    this._onFlatListItemPress(0);
                }
            } else if (val) {
                ToastManager.show(val.msg + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            } else {
                ToastManager.show('请求网络出错' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            }
        });
    };

    _getItems() {
        let pages = [];
        if (this.state.responValue && this.state.responValue.data) {
            for (let i = 0; i < this.state.responValue.data.length; i++) {
                pages.push(
                    <TouchableOpacity key={i}
                                      style={FragmentHeaderToobarViewStyles.header_item_container}
                                      onPress={(key) => this._onFlatListItemPress(i)}
                    >
                        <Text style={FragmentHeaderToobarViewStyles.header_show_text}>
                            {this.state.responValue.data[i].description}
                        </Text>
                        <Image
                            source={this.state.responValue.data[i].selected ? require('../../../stable/image/ic_indactor_up.png') : require('../../../stable/image/ic_indactor_down.png')}
                            style={FragmentHeaderToobarViewStyles.header_show_image}
                        />
                    </TouchableOpacity>
                );
            }
        }
        return pages;
    }

    _onFlatListItemPress = (index) => {
        this.state.responValue.data[index].selected = !this.state.responValue.data[index].selected;
        this.setState({
            responValue: this.state.responValue,
        });
        if (this.props.onSortTypeItemClickCallback) {
            this.props.onSortTypeItemClickCallback(this.state.responValue.data[index].name, this.state.responValue.data[index].selected ? 1 : 0);
        }
    };

    //4.
    render() {
        if (this.state.responValue) {
            return (
                <View
                    style={[FragmentHeaderToobarViewStyles.root, this.props.rootBgColor ? {backgroundColor: this.props.rootBgColor} : '']}>
                    {/*动态插入View*/}
                    {this.state.responValue ?
                        this._getItems().map((itemView, index) => {
                            return itemView;
                        })
                        :
                        <View/>
                    }
                </View>
            );
        } else {
            return (
                <View
                    style={[FragmentHeaderToobarViewStyles.root, this.props.rootBgColor ? {backgroundColor: this.props.rootBgColor} : '']}>
                    <View style={FragmentHeaderToobarViewStyles.header_item_container}>
                        {/*<ActivityIndicator/>*/}
                    </View>
                </View>
            );
        }
    }
}

FragmentHeaderToobarViewStyles = StyleSheet.create({
    root: {
        width: width,
        height: 44,
        flexDirection: 'row',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#ffffff',
    },
    header_item_container: {
        flex: 1,
        flexDirection: 'row',
        justifyContent: 'center',
        alignItems: 'center',
    },
    header_show_text: {
        fontSize: 16,
        color: '#282828',
    },
    header_show_image: {
        marginLeft: 2.4,
        width: 9.6,
        height: 9.6,
        resizeMode: 'cover',//cover:等比拉伸 strech:保持原有大小 contain:图片拉伸  充满空间
    },
});

export default FragmentHeaderToobarView;