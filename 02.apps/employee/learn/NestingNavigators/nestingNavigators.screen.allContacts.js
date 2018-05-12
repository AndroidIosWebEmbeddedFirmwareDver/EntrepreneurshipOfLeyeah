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


export default class  AllContactsScreen extends Component {
    render() {
        return <View style={styles.container}>

            <Text>List of all contacts</Text>
            <Button
                onPress={() => this.props.navigation.navigate('Chat', { user: 'Lucy' })}
                title="Chat with Lucy"
            />
        </View>;
    }
}

AppRegistry.registerComponent('AllContactsScreen', () => AllContactsScreen);