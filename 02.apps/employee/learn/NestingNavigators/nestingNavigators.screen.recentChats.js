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

import styles from './nestingNavigators.app.style'

export default class RecentChatsScreen extends Component {

    render() {
        return <View style={styles.container}>
            <Text>List of recent chats</Text><Button
            onPress={() => this.props.navigation.navigate('Chat', {user: 'Jony'})}
            title="Chat with Jony"
        />
        </View>
    }
}


AppRegistry.registerComponent('RecentChatsScreen', () => RecentChatsScreen);