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
// import {DrawerNavigator} from 'react-navigation';
import styles from './drawerNavigator.app.style';


export default class LocationScreen extends React.Component {
    static navigationOptions = {
        drawerLabel: 'Location',
        drawerIcon: ({tintColor}) => (
            <Image
                source={require('./source/chats-icon.png')}
                style={[styles.icon, {tintColor: tintColor}]}
            />
        ),
    };

    render() {
        return (
            <View style={styles.container}>
                <Button
                    onPress={() => this.props.navigation.navigate('HomeScreen')}
                    title="Go back home"
                />
                <Button
                    onPress={() => this.props.navigation.goBack()}
                    title="Go back home"
                />
            </View>
        );
    }
}
