import React, {Component, PureComponent} from 'react';
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

import PatterCommonUtil from '../../../../../utils/patter/patter.common.util'


export default class ChoiceWorkListItem extends PureComponent {

    //1.
    constructor(props) {
        super(props);
    }

    //2.
    componentWillMount() {
    }

    //3.
    //...
    //check the status of a single permission
    componentDidMount() {

    }

    _gener_content_view = () => {
        return (<View style={[ChoiceWorkListItemStyles.container_view, {
            flex: 1,
            flexDirection: 'column',
        }]}>
            <Text style={[ChoiceWorkListItemStyles.normal_text, {
                marginLeft: 4.8,
                padding: 4.8,
                // backgroundColor: '#AEC7F2'
            }]}
                  numberOfLines={1}
                  ellipsizeMode={'tail'}
            >{this.props.itemData && this.props.itemData.order && this.props.itemData.order.orderWokerTypeName ? this.props.itemData.order.orderWokerTypeName : '未知'}</Text>
            <Text style={[ChoiceWorkListItemStyles.normal_text, {
                marginLeft: 4.8,
                padding: 4.8,
                fontSize: 12,
                color: '#707070',
            }]}
                  numberOfLines={1}
                  ellipsizeMode={'tail'}
            >时间：</Text>
            <Text style={[ChoiceWorkListItemStyles.normal_text, {
                marginLeft: 4.8,
                padding: 4.8,
                fontSize: 14,
            }]}
                  numberOfLines={1}
                  ellipsizeMode={'tail'}
            >{this.props.itemData && this.props.itemData.order && this.props.itemData.order.workStartTime && this.props.itemData.order.workStopTime ? this.props.itemData.order.workStartTime + ' / ' + this.props.itemData.order.workStopTime : '未知'}</Text>

            <Text style={[ChoiceWorkListItemStyles.normal_text, {
                marginLeft: 4.8,
                padding: 4.8,
                fontSize: 12,
                color: '#707070',
            }]}
                  numberOfLines={1}
                  ellipsizeMode={'tail'}
            >上工地址：</Text>

            <Text style={[ChoiceWorkListItemStyles.normal_text, {
                marginLeft: 4.8,
                padding: 4.8,
                fontSize: 14,
            }]}
                  numberOfLines={1}
                  ellipsizeMode={'tail'}
            >{this.props.itemData && this.props.itemData.order && this.props.itemData.order.workAddress ? this.props.itemData.order.workAddress : '未知'}</Text>

        </View>);
    };

    render() {
        return (
            <TouchableOpacity style={ChoiceWorkListItemStyles.container}
                              onPress={this.props.onSelectPress}
            >
                <View style={ChoiceWorkListItemStyles.container_in}>
                    <View style={[ChoiceWorkListItemStyles.container_view, {
                        flex: 1,
                        alignItems: 'center',
                        justifyContent: 'center',
                    }]}>
                        <Image
                            source={this.props.rightShowSelected ?
                                require('../../../../../stable/image/ic_circle_selected.png')
                                : require('../../../../../stable/image/ic_circle_normal.png')
                            }
                            style={[ChoiceWorkListItemStyles.container_view_img, {}]}
                        />
                    </View>
                    <View style={[ChoiceWorkListItemStyles.container_view, {
                        flex: 7,
                        alignItems: 'center',
                        justifyContent: 'center',
                        backgroundColor: '#FFFFFF',
                    }]}>
                        {this._gener_content_view()}
                    </View>
                </View>
                <View style={ChoiceWorkListItemStyles.cut_line_view}/>
            </TouchableOpacity>

        );
    }


}


ChoiceWorkListItemStyles = StyleSheet.create({
    //基于flex-box布局
    container: {
        flex: 1,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FFFFFF',
    },
    container_in: {
        flex: 1,
        flexDirection: 'row',//row ,row-reverse ,column ('default') column-reverse,
        paddingTop: 9.6,
        paddingBottom: 9.6,
    },
    container_view: {
        flex: 1,
        flexDirection: 'row',
    },
    container_view_img: {
        width: 24,
        height: 24,
    },
    container_view_img_pj: {
        width: 12,
        height: 12,
        resizeMode: 'stretch',
    },
    cut_line_view: {
        height: 2.4,
        backgroundColor: '#FBFBFB',
    },
    normal_text: {
        fontSize: 16,
    }
});