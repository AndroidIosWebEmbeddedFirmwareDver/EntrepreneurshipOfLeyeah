import React, {Component} from 'react';
import {
    AppRegistry,
    StyleSheet,
    Text,
    ScrollView,
    Image,
    Button,
    View
} from 'react-native';
import {StackNavigator} from 'react-navigation';

import styles from './navigation.app.style'

export default class HomeScreen extends Component {
    static navigationOptions = {
        title: '首页',
    };

    render() {
        const {navigate} = this.props.navigation;
        return (
            <View style={styles.container}>
                <Text>Hello, Chat App!</Text>
                <Button
                    // onPress={() => navigate('ChatScreen')}//normal
                    onPress={() => navigate('ChatScreen', {user: 'Im Passing user'})}//Passing params
                    title="Chat with Lucy"
                />
            </View>
        );
    }
}


