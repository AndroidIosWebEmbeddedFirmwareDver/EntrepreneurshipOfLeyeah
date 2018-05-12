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


export default class HomeScreen extends React.Component {
    static navigationOptions = {
        drawerLabel: 'Home',
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
                    onPress={() => this.props.navigation.navigate('NotificationScreen')}
                    title="Go to notifications"
                />
                <Button
                    onPress={() => this.props.navigation.navigate('DrawerOpen')}
                    title="DrawerOpen"
                />
                <Button
                    onPress={() => this.props.navigation.navigate('DrawerClose')}
                    title="DrawerClose"
                />
            </View>
        );
    }
}
