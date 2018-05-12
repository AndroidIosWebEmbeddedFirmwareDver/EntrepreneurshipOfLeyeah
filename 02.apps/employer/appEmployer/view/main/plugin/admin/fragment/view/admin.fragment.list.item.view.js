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


export default class AdminFragmentListItemView extends Component {

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
        return (<View style={[AdminFragmentListItemViewStyles.container_view, {
            flex: 1,
            flexDirection: 'column',
        }]}>
            <Text style={[AdminFragmentListItemViewStyles.normal_text, {
                padding: 4.8,
            }]}
                  numberOfLines={1}
                  ellipsizeMode={'tail'}
            >{this.props.itemData && this.props.itemData.orderWokerTypeName ? this.props.itemData.orderWokerTypeName : '未知'}</Text>
            <Text style={[AdminFragmentListItemViewStyles.normal_text, {
                padding: 4.8,
                fontSize: 12,
                color: '#666666',
            }]}
                  numberOfLines={1}
                  ellipsizeMode={'tail'}
            >时间：</Text>
            <Text style={[AdminFragmentListItemViewStyles.normal_text, {
                padding: 4.8,
                fontSize: 12,
            }]}
                  numberOfLines={1}
                  ellipsizeMode={'tail'}
            >{this.props.itemData && this.props.itemData && this.props.itemData.workStartTime && this.props.itemData.workStopTime ? this.props.itemData.workStartTime + ' / ' + this.props.itemData.workStopTime : '未知'}</Text>

            <Text style={[AdminFragmentListItemViewStyles.normal_text, {
                padding: 4.8,
                fontSize: 12,
                color: '#666666',
            }]}
                  numberOfLines={1}
                  ellipsizeMode={'tail'}
            >上工地址：</Text>

            <Text style={[AdminFragmentListItemViewStyles.normal_text, {
                padding: 4.8,
                fontSize: 12,
            }]}
                  numberOfLines={1}
                  ellipsizeMode={'tail'}
            >{this.props.itemData && this.props.itemData && this.props.itemData.workAddress ? this.props.itemData.workAddress : '未知'}</Text>

        </View>);
    };

    _gener_function_view = () => {
        return (<View style={[AdminFragmentListItemViewStyles.container_view, {
            flex: 1,
            flexDirection: 'row',
        }]}>
            <TouchableOpacity
                style={[AdminFragmentListItemViewStyles.container_view, {
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
                <Text style={[AdminFragmentListItemViewStyles.normal_text, {
                    color: '#666666',
                    fontSize: 14,
                }]}
                      numberOfLines={1}
                      ellipsizeMode={'tail'}
                >查看详情</Text>
            </TouchableOpacity>

            <TouchableOpacity
                style={[AdminFragmentListItemViewStyles.container_view, {
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
                <Text style={[AdminFragmentListItemViewStyles.normal_text, {
                    color: '#FFFFFF',
                    fontSize: 14,
                }]}
                      numberOfLines={1}
                      ellipsizeMode={'tail'}
                >管理工作</Text>
            </TouchableOpacity>

        </View>);
    };

    render() {

        return (
            <View style={AdminFragmentListItemViewStyles.itemContainer}>
                <View style={[AdminFragmentListItemViewStyles.container_view,{
                    padding: 0,
                }]}>
                    {this._gener_content_view()}
                    {this.props.hiddenBottomFunction ? <View/> : this._gener_function_view()}
                </View>
                {this.props.hiddenBottomCutLine ? <View/> :
                    <View style={AdminFragmentListItemViewStyles.cut_line_view}/>}
            </View>
        );
    }
}


AdminFragmentListItemViewStyles = StyleSheet.create({
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