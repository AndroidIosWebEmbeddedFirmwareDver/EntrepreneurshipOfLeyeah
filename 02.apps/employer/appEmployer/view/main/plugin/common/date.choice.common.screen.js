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

import parse from 'date-fns/parse';
import format from 'date-fns/format'

import HeaderCommonView from '../../../views/header/header.common.view'

import commonStyles from '../plugin.common.style'
import {Calendar, CalendarList, Agenda} from 'react-native-calendars';
import {LocaleConfig} from 'react-native-calendars';
import ToastManager from '../../../../utils/toast/Toast.util'
import InfiniteCalendar from '../../../views/calendar/index'

LocaleConfig.locales['fr'] = {
    monthNames: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],
    monthNamesShort: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],
    dayNames: ['周日', '周一', '周二', '周三', '周四', '周五', '周六',],
    dayNamesShort: ['周日', '周一', '周二', '周三', '周四', '周五', '周六',]
};

LocaleConfig.defaultLocale = 'fr';


export class Header extends PureComponent {
    static propTypes = {
        selectedDate: PropTypes.instanceOf(Date)
    };

    render() {
        const {selectedDate} = this.props;

        return (
            <View style={stylesForHeader.root}>
                <View style={stylesForHeader.wrapper}>
                    <Text style={stylesForHeader.year}>{selectedDate.getFullYear()}</Text>
                    <View style={stylesForHeader.dateView}>
                        <Text
                            style={stylesForHeader.date}>{format(selectedDate, 'YYYY-MM-DD')}</Text>
                    </View>
                </View>
                <View style={stylesForHeader.weekdays}>
                    {LocaleConfig.locales['fr'].dayNames.map(weekday => (
                        <Text key={weekday} style={stylesForHeader.weekday}>{weekday}</Text>
                    ))}
                </View>
            </View>
        );
    }
}


const stylesForHeader = StyleSheet.create({
    root: {
        backgroundColor: '#FFCC33',
        borderTopLeftRadius: 3,
        borderTopRightRadius: 3
    },
    wrapper: {
        padding: 15
    },
    year: {
        color: 'rgba(255, 255, 255, 0.9)'
    },
    dateView: {
        width: window.width,
        flexDirection: 'row',
        justifyContent: 'flex-end',
    },
    date: {
        justifyContent: 'flex-end',
        color: '#FFF',
        fontSize: 30
    },
    weekdays: {
        flexDirection: 'row',
        backgroundColor: '#FFCC33'
    },
    weekday: {
        flex: 1,
        textAlign: 'center',
        color: '#FFF',
        lineHeight: 40,
        fontWeight: '600'
    }
});

export default class DateChoiceCommonScreen extends Component {

    constructor(props) {
        super(props);
        this.state = {selected: format(new Date(), 'YYYY-MM-DD')};
        this.onDayPress = this.onDayPress.bind(this);
    }

    onDayPress(day) {
        this.setState({
            selected: day.dateString
        });
    }

    _renderCompontDownPress() {
        if (!this.state.selected) {
            ToastManager.alertWithSure('提示', '你还没有选择日期！', () => {
            });
        } else {
            if (this.props.setDataFlag && this.props.cllbackSetSelectedDate) {
                this.props.cllbackSetSelectedDate(this.props.setDataFlag, parse(this.state.selected));
            }
            this.props.navigator.pop();
        }
    }

    render() {
        return (
            <View style={commonStyles.container}>

                <HeaderCommonView navigator={this.props.navigator}
                                  bgColor={'#FFCC33'}
                                  headerLeftShow={true}
                                  headerCenterShow={true}
                                  headerRightShow={true}
                                  showCenterAfterLeft={true}
                                  headerRightButtonTitle={'完成'}
                                  headerRightButtonOnpress={() => this._renderCompontDownPress()}
                                  headerCenterTitle={'选择日期'}/>


                <Header selectedDate={parse(this.state.selected)}/>
                <Calendar
                    onDayPress={this.onDayPress}
                    style={styles.calendar}
                    hideExtraDays
                    hideDayNames={true}
                    markedDates={{[this.state.selected]: {selected: true}}}
                />

            </View>
        );
    }

}

const styles = StyleSheet.create({
    calendar: {
        flex: 1,
        backgroundColor: '#FFFFFF',
    }
});