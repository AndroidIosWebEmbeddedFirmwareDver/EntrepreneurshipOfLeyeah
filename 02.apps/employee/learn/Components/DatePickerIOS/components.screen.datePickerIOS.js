import React, {Component} from 'react';
import {
    AppRegistry,
    StyleSheet,
    Text,
    ScrollView,
    Image,
    Button,
    View,
    DatePickerIOS,
} from 'react-native';

import styles from '../components.app.style'

export default class DatePickerIOSScreen extends Component {
    static navigationOptions = {
        title: 'DatePickerIOS',
    };
    state = {
        animating: true,
        currentSelectDate: new Date(),
    };

    //= () => {
    _onDateChange = (newDate: Date) => {
        this.state.animating = !this.state.animating;
        this.state.currentSelectDate = newDate;
        this.setState({
            animating: this.state.animating,
            currentSelectDate: this.state.currentSelectDate
        });
        return true;
    };

    render() {
        const {navigate} = this.props.navigation;
        return (
            <ScrollView>
                <DatePickerIOS
                    ref={component => this._datePickerIOS = component}
                    date={this.state.currentSelectDate} onDateChange={this._onDateChange}/>
                <View style={styles.container}>
                    <Text>The Selected Date
                        : {JSON.stringify(this.state.currentSelectDate.toJSON())}</Text>
                </View>
            </ScrollView>
        );
    }
}

