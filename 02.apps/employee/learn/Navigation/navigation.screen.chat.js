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


export default class  ChatScreen extends Component {
    //传值
    // Nav options can be defined as a plugin of the screen's props:
    static navigationOptions = ({ navigation }) => ({
        title: `Chat with ${navigation.state.params.user}`,
    });
    render() {
        // The screen's current route is passed in to `props.navigation.state`:
        const { params } = this.props.navigation.state;
        return (
            <View style={styles.container}>
                <Text>Chat with {params.user}</Text>
            </View>
        );
    }
}

AppRegistry.registerComponent('ChatScreen', () => ChatScreen);