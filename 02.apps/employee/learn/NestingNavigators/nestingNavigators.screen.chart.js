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


export default class ChartScreen extends Component {
    // // Configuring the Header
    // static navigationOptions = ({navigation}) => ({
    //     title: `Chat with ${navigation.state.params.user}`,
    //     headerRight: <Button title="Info"/>,
    // });
    //The navigation options can be defined with a navigation prop. Let's render a different button based on the route params, and set up the button to call navigation.setParams when pressed.
    static navigationOptions = ({navigation}) => {
        const {state, setParams} = navigation;
        const isInfo = state.params.mode === 'info';
        const {user} = state.params;
        return {
            title: isInfo ? `${user}'s Contact Info` : `Chat with ${state.params.user}`,
            headerRight: (
                <Button
                    title={isInfo ? 'Done' : `${user}'s info`}
                    onPress={() => setParams({mode: isInfo ? 'none' : 'info'})}
                />
            ),
        };
    };

    render() {
        // The screen's current route is passed in to `props.navigation.state`:
        const {params} = this.props.navigation.state;
        return (
            <View style={styles.container}>
                <Text>Chat with {params.user}</Text>
            </View>
        );
    }
}

AppRegistry.registerComponent('ChartScreen', () => ChartScreen);