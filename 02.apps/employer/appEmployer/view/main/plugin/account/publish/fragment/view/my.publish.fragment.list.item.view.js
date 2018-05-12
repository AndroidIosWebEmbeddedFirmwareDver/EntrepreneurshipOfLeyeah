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
    Dimensions,
    ActivityIndicator,
    StyleSheet,
    TouchableOpacity,
} from 'react-native'


const {
    width,
    height
} = Dimensions.get('window');


export default class MyPublishFragmentListItemView extends Component {

    //1.
    constructor(props) {
        super(props);
        this.state = {};
    }

    //2.
    componentWillMount() {

    }

    //3.
    componentDidMount() {

    }

    //4.
    componentWillUnmount() {
    }

    componentWillReceiveProps() {

    }

    _gener_content_view = () => {
        return (
            <View style={[MyPublishFragmentListItemViewStyles.container_view, {
                flex: 1,
                flexDirection: 'row',
                paddingTop: 4.8,
                paddingBottom: 4.8,
                paddingLeft: 4.8,
                paddingRight: 0,
            }]}>
                <View style={[MyPublishFragmentListItemViewStyles.container_view, {
                    flex: 8,
                    flexDirection: 'column',
                }]}>
                    <Text style={[MyPublishFragmentListItemViewStyles.normal_text, {
                        padding: 4.8,
                    }]}
                          numberOfLines={1}
                          ellipsizeMode={'tail'}
                    >{this.props.itemData && this.props.itemData.orderWokerTypeName ? this.props.itemData.orderWokerTypeName : '未知'}</Text>
                    <Text style={[MyPublishFragmentListItemViewStyles.normal_text, {
                        padding: 4.8,
                        fontSize: 12,
                        color: '#666666',
                    }]}
                          numberOfLines={1}
                          ellipsizeMode={'tail'}
                    >时间：</Text>
                    <Text style={[MyPublishFragmentListItemViewStyles.normal_text, {
                        padding: 4.8,
                        fontSize: 12,
                    }]}
                          numberOfLines={1}
                          ellipsizeMode={'tail'}
                    >{this.props.itemData && this.props.itemData && this.props.itemData.workStartTime && this.props.itemData.workStopTime ? this.props.itemData.workStartTime + ' / ' + this.props.itemData.workStopTime : '未知'}</Text>

                    <Text style={[MyPublishFragmentListItemViewStyles.normal_text, {
                        padding: 4.8,
                        fontSize: 12,
                        color: '#666666',
                    }]}
                          numberOfLines={1}
                          ellipsizeMode={'tail'}
                    >上工地址：</Text>

                    <Text style={[MyPublishFragmentListItemViewStyles.normal_text, {
                        padding: 4.8,
                        fontSize: 12,
                    }]}
                          numberOfLines={1}
                          ellipsizeMode={'tail'}
                    >{this.props.itemData && this.props.itemData && this.props.itemData.workAddress ? this.props.itemData.workAddress : '未知'}</Text>
                </View>
                {this._gener_right_location_view()}
            </View>);
    };

    _gener_function_view = () => {
        return (<View style={[MyPublishFragmentListItemViewStyles.container_view, {
            flex: 1,
            flexDirection: 'row',
        }]}>
            <TouchableOpacity
                style={[MyPublishFragmentListItemViewStyles.container_view, {
                    flex: 1,
                    flexDirection: 'column',
                    alignItems: 'center',
                    justifyContent: 'center',
                    backgroundColor: 'transparent',
                    borderRadius: 4.8,
                    borderColor: '#666666',
                    borderWidth: 1,
                    marginRight: 9.6 / 2,
                    marginLeft: 9.6 / 2,
                    padding: 7.2,
                }]}
                onPress={this.props.onShowDetialPressed}
            >
                <Text style={[MyPublishFragmentListItemViewStyles.normal_text, {
                    color: '#666666',
                    fontSize: 14,
                }]}
                      numberOfLines={1}
                      ellipsizeMode={'tail'}
                >查看详情</Text>
            </TouchableOpacity>

            <TouchableOpacity
                style={[MyPublishFragmentListItemViewStyles.container_view, {
                    flex: 1,
                    flexDirection: 'column',
                    alignItems: 'center',
                    justifyContent: 'center',
                    backgroundColor: '#FFCC33',
                    borderRadius: 4.8,
                    borderColor: '#FFCC33',
                    borderWidth: 1,
                    marginRight: 9.6 / 2,
                    marginLeft: 9.6 / 2,
                    padding: 7.2,
                }]}
                onPress={this.props.onShowManagePressed}
            >
                <Text style={[MyPublishFragmentListItemViewStyles.normal_text, {
                    color: '#FFFFFF',
                    fontSize: 14,
                }]}
                      numberOfLines={1}
                      ellipsizeMode={'tail'}
                >管理招聘</Text>
            </TouchableOpacity>
        </View>);
    };


    _gener_right_location_view = () => {
        //存在雇员关系，并且雇员已经确定开工，并且雇员没有下工
        return (
            <View style={[MyPublishFragmentListItemViewStyles.container_view, {
                flex: 1.25,
                flexDirection: 'column',
                alignItems: 'flex-end',
                justifyContent: 'flex-start',
                padding: 0,
            }]}>
                <View style={[MyPublishFragmentListItemViewStyles.container_view, {
                    flex: 1,
                    flexDirection: 'row',
                    alignItems: 'center',
                    justifyContent: 'flex-end',
                    paddingRight: 0,
                }]}>
                    <View style={[{
                        backgroundColor: '#0088F3',
                        borderColor: '#0088F3',
                        borderTopLeftRadius: 9.6,
                        borderBottomLeftRadius: 9.6,
                        borderTopRightRadius: 0,
                        borderBottomRightRadius: 0,
                        paddingLeft: 4.8,
                        paddingRight: 0,
                        paddingTop: 2.4,
                        paddingBottom: 2.4,
                    }]}>
                        <Text style={[MyPublishFragmentListItemViewStyles.normal_text, {
                            fontSize: 12,
                            color: '#FFFFFF',
                        }]}
                              numberOfLines={1}
                              ellipsizeMode={'tail'}
                        >{this.props.itemData && this.props.itemData.workRecruitStatus === 1 ? '已完成' : '招聘中'}</Text>
                    </View>
                </View>
                <View style={[MyPublishFragmentListItemViewStyles.container_view, {
                    flex: 1,
                    flexDirection: 'column',
                }]}>
                </View>
                <View style={[MyPublishFragmentListItemViewStyles.container_view, {
                    flex: 1,
                    flexDirection: 'column',
                }]}>
                </View>

            </View>);
    };

    render() {

        return (
            <View style={MyPublishFragmentListItemViewStyles.itemContainer}>
                <View style={[MyPublishFragmentListItemViewStyles.container_view, {
                    padding: 0,
                }]}>
                    {this._gener_content_view()}
                    {this.props.hiddenBottomFunction ? <View/> : this._gener_function_view()}
                </View>
                {this.props.hiddenBottomCutLine ? <View/> :
                    <View style={MyPublishFragmentListItemViewStyles.cut_line_view}/>}
            </View>
        );
    }
}


MyPublishFragmentListItemViewStyles = StyleSheet.create({
    itemContainer: {
        flex: 1,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FFFFFF',
    },
    container_view: {
        flex: 1,
        flexDirection: 'column',
        padding: 4.8,
    },
    cut_line_view: {
        height: 2.4,
        backgroundColor: '#FBFBFB',
    },
    normal_text: {
        fontSize: 16,
        color: '#000000',
    }
});