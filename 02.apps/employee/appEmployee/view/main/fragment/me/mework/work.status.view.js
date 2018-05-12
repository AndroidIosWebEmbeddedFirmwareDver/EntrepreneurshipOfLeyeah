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
    FlatList,
} from 'react-native';

const {
    width,
    height
} = Dimensions.get('window');


export default class WorkStatusView extends Component {

    //1.
    constructor(props) {
        super(props);
        this.state = {
            mobileUserData: null,
            selectedResponValue: null,
            responValue: {
                data: [
                    {
                        description: '全部',
                        selected: true,
                        typeQuery: false,
                        employerWorkConfirm: 0,//'雇主确定录用，1-已录用，0-未录用，-1-拒绝'
                        employeeWorkStart: 0,//'雇员上工签到开始工作，1-已签到，0-未签到，-1-拒绝'
                        employeeWorkEnd: 0,//'雇员下工签退工作结束，1-已结束，0-未结束'
                        employerPaidedWork: 0,//'雇主确定付款，1-已付款，0-未付款，-1-拒绝'
                        employeeWorkPaided: 0,//'雇员确定收款，1-已付款，0-未付款，-1-拒绝'
                    },
                    {
                        description: '待录用',
                        selected: false,
                        typeQuery: true,
                        employerWorkConfirm: 0,//'雇主确定录用，1-已录用，0-未录用，-1-拒绝'
                        employeeWorkStart: 0,//'雇员上工签到开始工作，1-已签到，0-未签到，-1-拒绝'
                        employeeWorkEnd: 0,//'雇员下工签退工作结束，1-已结束，0-未结束'
                        employerPaidedWork: 0,//'雇主确定付款，1-已付款，0-未付款，-1-拒绝'
                        employeeWorkPaided: 0,//'雇员确定收款，1-已付款，0-未付款，-1-拒绝'
                    },
                    {
                        description: '已拒绝',
                        selected: false,
                        typeQuery: true,
                        employerWorkConfirm: -1,//'雇主确定录用，1-已录用，0-未录用，-1-拒绝'
                        employeeWorkStart: 0,//'雇员上工签到开始工作，1-已签到，0-未签到，-1-拒绝'
                        employeeWorkEnd: 0,//'雇员下工签退工作结束，1-已结束，0-未结束'
                        employerPaidedWork: 0,//'雇主确定付款，1-已付款，0-未付款，-1-拒绝'
                        employeeWorkPaided: 0,//'雇员确定收款，1-已付款，0-未付款，-1-拒绝'
                    },
                    {
                        description: '待上工',
                        selected: false,
                        typeQuery: true,
                        employerWorkConfirm: 1,//'雇主确定录用，1-已录用，0-未录用，-1-拒绝'
                        employeeWorkStart: 0,//'雇员上工签到开始工作，1-已签到，0-未签到，-1-拒绝'
                        employeeWorkEnd: 0,//'雇员下工签退工作结束，1-已结束，0-未结束'
                        employerPaidedWork: 0,//'雇主确定付款，1-已付款，0-未付款，-1-拒绝'
                        employeeWorkPaided: 0,//'雇员确定收款，1-已付款，0-未付款，-1-拒绝'
                    },
                    {
                        description: '待打卡',
                        selected: false,
                        typeQuery: true,
                        employerWorkConfirm: 1,//'雇主确定录用，1-已录用，0-未录用，-1-拒绝'
                        employeeWorkStart: 1,//'雇员上工签到开始工作，1-已签到，0-未签到，-1-拒绝'
                        employeeWorkEnd: 0,//'雇员下工签退工作结束，1-已结束，0-未结束'
                        employerPaidedWork: 0,//'雇主确定付款，1-已付款，0-未付款，-1-拒绝'
                        employeeWorkPaided: 0,//'雇员确定收款，1-已付款，0-未付款，-1-拒绝'
                    },

                    // {
                    //     description: '立即下工',
                    //     selected: false,
                    // typeQuery:true,
                    //     employerWorkConfirm: 1,//'雇主确定录用，1-已录用，0-未录用，-1-拒绝'
                    //     employeeWorkStart: 1,//'雇员上工签到开始工作，1-已签到，0-未签到，-1-拒绝'
                    //     employeeWorkEnd: 0,//'雇员下工签退工作结束，1-已结束，0-未结束'
                    //     employerPaidedWork: 0,//'雇主确定付款，1-已付款，0-未付款，-1-拒绝'
                    //     employeeWorkPaided: 0,//'雇员确定收款，1-已付款，0-未付款，-1-拒绝'
                    // },
                    {
                        description: '待付款',
                        selected: false,
                        typeQuery: true,
                        employerWorkConfirm: 1,//'雇主确定录用，1-已录用，0-未录用，-1-拒绝'
                        employeeWorkStart: 1,//'雇员上工签到开始工作，1-已签到，0-未签到，-1-拒绝'
                        employeeWorkEnd: 1,//'雇员下工签退工作结束，1-已结束，0-未结束'
                        employerPaidedWork: 0,//'雇主确定付款，1-已付款，0-未付款，-1-拒绝'
                        employeeWorkPaided: 0,//'雇员确定收款，1-已付款，0-未付款，-1-拒绝'
                    },
                    {
                        description: '待收款',
                        selected: false,
                        typeQuery: true,
                        employerWorkConfirm: 1,//'雇主确定录用，1-已录用，0-未录用，-1-拒绝'
                        employeeWorkStart: 1,//'雇员上工签到开始工作，1-已签到，0-未签到，-1-拒绝'
                        employeeWorkEnd: 1,//'雇员下工签退工作结束，1-已结束，0-未结束'
                        employerPaidedWork: 1,//'雇主确定付款，1-已付款，0-未付款，-1-拒绝'
                        employeeWorkPaided: 0,//'雇员确定收款，1-已付款，0-未付款，-1-拒绝'

                    },
                    {
                        description: '已完工',
                        selected: false,
                        typeQuery: true,
                        employerWorkConfirm: 1,//'雇主确定录用，1-已录用，0-未录用，-1-拒绝'
                        employeeWorkStart: 1,//'雇员上工签到开始工作，1-已签到，0-未签到，-1-拒绝'
                        employeeWorkEnd: 1,//'雇员下工签退工作结束，1-已结束，0-未结束'
                        employerPaidedWork: 1,//'雇主确定付款，1-已付款，0-未付款，-1-拒绝'
                        employeeWorkPaided: 1,//'雇员确定收款，1-已付款，0-未付款，-1-拒绝'
                    },
                    // {
                    //     description: '雇员拒绝收款',
                    //     selected: false,
                    // typeQuery:true,
                    //     employerWorkConfirm: 1,//'雇主确定录用，1-已录用，0-未录用，-1-拒绝'
                    //     employeeWorkStart: 1,//'雇员上工签到开始工作，1-已签到，0-未签到，-1-拒绝'
                    //     employeeWorkEnd: 1,//'雇员下工签退工作结束，1-已结束，0-未结束'
                    //     employerPaidedWork: 1,//'雇主确定付款，1-已付款，0-未付款，-1-拒绝'
                    //     employeeWorkPaided: -1,//'雇员确定收款，1-已付款，0-未付款，-1-拒绝'
                    // },
                ],
            },

        };
    }

    //2.
    componentWillMount() {

    }

    //3.
    componentDidMount() {

    }

    //4.
    componentWillUnMount() {

    }

    _onFlatListItemPress = (index) => {
        for (let i of this.state.responValue.data) {
            i.selected = false;
        }
        this.state.responValue.data[index].selected = true;
        this.state.selectedResponValue = this.state.responValue.data[index];
        this.setState({
            responValue: this.state.responValue,
            selectedResponValue: this.state.responValue.data[index],
        });
        if (this.props.onWorkStatusChangeed) {
            this.props.onWorkStatusChangeed(this.state.responValue.data[index]);
        }
    };

    _getItems() {
        let pages = [];
        if (this.state.responValue && this.state.responValue.data) {
            for (let i = 0; i < this.state.responValue.data.length; i++) {
                pages.push(
                    <TouchableOpacity key={i}
                                      style={this.state.responValue.data[i].selected ? WorkStatusViewStyles.function_list_item_selected : WorkStatusViewStyles.function_list_item_normal}
                                      onPress={(key) => this._onFlatListItemPress(i)}
                    >
                        <Text
                            style={[WorkStatusViewStyles.normal_text, this.state.responValue.data[i].selected ? {
                                color: '#ffffff',
                                fontSize: 14,
                            } : {
                                color: '#707070',
                                fontSize: 14,
                            },]}>
                            {this.state.responValue.data[i].description}
                        </Text>
                    </TouchableOpacity>
                );
            }
        }
        return pages;
    }

    //---------------------

    render() {
        return (
            <View style={WorkStatusViewStyles.container}>
                {this.state.responValue ?
                    <View style={WorkStatusViewStyles.function_list}>
                        {this.state.responValue ?
                            this._getItems().map((itemView, index) => {
                                return itemView;
                            })
                            :
                            <View/>
                        }
                    </View>
                    : <Text
                        style={WorkStatusViewStyles.normal_text}>{this.state.backViewShow}</Text>
                }
            </View>
        );
    };

}


WorkStatusViewStyles = StyleSheet.create({
    //基于flex-box布局
    container: {
        width: width,
        flexDirection: 'column',
        flexWrap: 'wrap',
        alignItems: 'flex-start',
        justifyContent: 'flex-start',
    },

    function_list: {
        //以下四个关键属性实现自动换行
        width: width,
        flexWrap: 'wrap',
        display: 'flex',
        flexDirection: 'row',
        backgroundColor: '#FBFBFB',
    },

    function_list_item_normal: {
        flexWrap: 'wrap',
        flexDirection: 'column',
        alignItems: 'flex-start',
        justifyContent: 'flex-start',
        backgroundColor: '#FFFFFF',
        padding: 9.6,
        margin: 9.6 / 4,
    },

    function_list_item_selected: {
        flexWrap: 'wrap',
        flexDirection: 'column',
        alignItems: 'flex-start',
        justifyContent: 'flex-start',
        backgroundColor: '#0088F3',
        padding: 9.6,
        margin: 9.6 / 4,
    },

    normal_text: {
        fontSize: 16,
    },

});