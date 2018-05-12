import React, {Component, PureComponent, PropTypes} from 'react';
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
    TouchableOpacity,
    StyleSheet,
} from 'react-native';

import parse from 'date-fns/parse'
import format from 'date-fns/format'
import addDays from 'date-fns/add_days'
import isEqual from 'date-fns/is_equal'
import eachDay from 'date-fns/each_day'
import {LocaleConfig} from 'react-native-calendars'
import {Calendar, CalendarList, Agenda} from 'react-native-calendars'
import DateCommonUtil from "../../../../utils/date.common.util";


LocaleConfig.locales['fr'] = {
    monthNames: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],
    monthNamesShort: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],
    dayNames: ['周日', '周一', '周二', '周三', '周四', '周五', '周六',],
    dayNamesShort: ['周日', '周一', '周二', '周三', '周四', '周五', '周六',]
};

LocaleConfig.defaultLocale = 'fr';

export default class DateChoiceScreen extends Component {

    //1.Component构造函数
    constructor(props) {
        super(props);
        this.state = {
            showDates: true,
            workStartTime: null,
            workStopTime: null,
            punchCards: null,
            markedDates: {},
        };
    }


    //2.Component要被加载
    componentWillMount() {
        this._init_data();
    }

    //3.
    componentDidMount() {
    }

    //4.
    componentWillUnmount() {
    }

    _init_data = () => {
        if (this.props.workStartTime) {
            this.state.workStartTime = this.props.workStartTime;
            this.setState({
                workStartTime: this.state.workStartTime,
            });
        } else {
            this.state.workStartTime = format(new Date(), 'YYYY-MM-DD');
            this.setState({
                workStartTime: this.state.workStartTime,
            });
        }
        if (this.props.workStopTime) {
            this.state.workStopTime = this.props.workStopTime;
            this.setState({
                workStopTime: this.state.workStopTime,
            });
        } else {
            this.state.workStopTime = format(new Date(), 'YYYY-MM-DD');
            this.setState({
                workStopTime: this.state.workStopTime,
            });
        }
        if (!DateCommonUtil.isAAfterB(this.state.workStopTime, this.state.workStartTime)) {
            this.state.showDates = false;
            this.setState({
                showDates: this.state.showDates,
            });
        } else {
            if (this.props.punchCards) {
                this.state.punchCards = this.props.punchCards;
                this.setState({
                    punchCards: this.state.punchCards,
                });
            }

            this.state.markedDates = this._init_mark_data();
            this.setState({
                markedDates: this.state.markedDates,
            });
        }
    };
    _init_mark_data = () => {
        let markedDates = {};
        if (!this.state.workStartTime || !this.state.workStopTime) {
            return markedDates;
        }
        if (this.state.workStartTime === this.state.workStopTime) {
            return {
                [this.state.workStartTime]: {
                    selected: true,
                    color: '#D2D2D2',
                    textColor: 'black'
                },
            }
        }
        let startDate = parse(this.state.workStartTime);
        let stopDate = parse(this.state.workStopTime);
        const betweebDates = eachDay(startDate, stopDate);

        for (let i = 0; i < betweebDates.length; i++) {
            // //中间
            // markedDates[format(betweebDates[i], 'YYYY-MM-DD')] = {
            //     selected: true,
            //     // color: '#EFF7FF',
            //     color: this._init_mark_params(format(betweebDates[i], 'YYYY-MM-DD')),
            //     textColor: 'black',
            // };

            //开始
            if (i === 0) {
                markedDates[format(betweebDates[i], 'YYYY-MM-DD')] = {
                    selected: true,
                    startingDay: true,
                    // color: '#0088F3',
                    color: this._init_mark_params(format(betweebDates[i], 'YYYY-MM-DD')),
                    textColor: 'white',
                };
            } else if (i > 0 && i < betweebDates.length - 1) {
                //中间
                markedDates[format(betweebDates[i], 'YYYY-MM-DD')] = {
                    selected: true,
                    // color: '#EFF7FF',
                    color: this._init_mark_params(format(betweebDates[i], 'YYYY-MM-DD')),
                    textColor: 'black',
                };
            } else if (i === betweebDates.length - 1) {
                //结束
                markedDates[format(betweebDates[i], 'YYYY-MM-DD')] = {
                    selected: false,
                    endingDay: true,
                    // color: '#0088F3',
                    color: this._init_mark_params(format(betweebDates[i], 'YYYY-MM-DD')),
                    textColor: 'white',
                };
            }
        }

        return markedDates;
    };

    _init_mark_params = (markedDate) => {
        if (!markedDate) {
            return '#EFF7FF';
        }
        for (let i = 0; i < this.state.punchCards.length; i++) {
            if (isEqual(parse(format(parse(this.state.punchCards[i].createdDateTime), 'YYYY-MM-DD')), parse(markedDate))) {
                //已打卡
                return '#D2D2D2';
            }
        }
        return '#EFF7FF';
    };


    render() {
        return (
            <View style={DateChoiceScreenStyles.container}>
                <View style={{
                    flexDirection: 'row',
                    padding: 9.6,
                }}>
                    <View style={{flex: 1, flexDirection: 'row',}}>
                        <Text style={[DateChoiceScreenStyles.normal_text, {
                            fontSize: 12,
                        }]}>未打卡</Text>
                        <View style={[DateChoiceScreenStyles.view_line, {
                            backgroundColor: '#EFF7FF',
                            marginLeft: 9.6,
                        }]}/>
                    </View>
                    <View style={{flex: 1, flexDirection: 'row',}}>
                        <Text style={[DateChoiceScreenStyles.normal_text, {
                            fontSize: 12,
                        }]}>已打卡</Text>
                        <View style={[DateChoiceScreenStyles.view_line, {
                            backgroundColor: '#D2D2D2',
                            marginLeft: 9.6,
                        }]}/>
                    </View>

                    {/*<View style={{flex: 1, flexDirection: 'row',}}>*/}
                    {/*<Text style={[DateChoiceScreenStyles.normal_text, {*/}
                    {/*fontSize: 12,*/}
                    {/*}]}>开始结束</Text>*/}
                    {/*<View style={[DateChoiceScreenStyles.view_line, {*/}
                    {/*backgroundColor: '#0088F3',*/}
                    {/*marginLeft: 9.6,*/}
                    {/*}]}/>*/}
                    {/*</View>*/}
                </View>
                <View style={DateChoiceScreenStyles.cut_line}/>
                {this.state.showDates ?
                    <Calendar
                        style={DateChoiceScreenStyles.calendar}
                        // onDayPress={this.onDayPress}
                        // hideExtraDays
                        // hideDayNames={true}
                        // markedDates={{[this.state.selected]: {selected: true}}}
                        // Collection of dates that have to be colored in a special way. Default = {}
                        // hideArrows={true}
                        // markedDates={testData}
                        markedDates={this.state.markedDates}
                        // Date marking style [simple/period/multi-dot]. Default = 'simple'
                        markingType={'period'}
                    />
                    : <View/>
                }
            </View>
        );
    }

}

const DateChoiceScreenStyles = StyleSheet.create({
    container: {
        flex: 1,
        flexDirection: 'column',
    },
    calendar: {
        marginTop: 9.6,
        marginBottom: 9.6 * 3,
    },
    view_line: {
        width: 9.6 * 2,
        height: 12,
    },
    cut_line: {
        height: 2,
        backgroundColor: '#FBFBFB',
    },
    normal_text: {
        fontSize: 16,
    }
});