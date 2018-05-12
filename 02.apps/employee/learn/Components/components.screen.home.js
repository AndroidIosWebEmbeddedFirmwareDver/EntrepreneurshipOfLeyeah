import React, {Component} from 'react';
import {
    AppRegistry,
    StyleSheet,
    Text,
    ScrollView,
    Image,
    Button,
    View,
    Platform,
    Alert,
} from 'react-native';

import styles from './components.app.style'

export default class HomeScreen extends Component {
    static navigationOptions = {
        title: 'components',
    };
    _alertButtonPress=()=>{
        Alert.alert(
            'title',
            'msg',
            [{text:'sure',onPress:this._alertOnPress()},{text:'cancle',onPress:this._alertOnPress()}],
            {cancelable: true,onDismiss: this._alertOnDismiss()}
        );
    }
    _alertOnPress =()=>{
        console.log('_alertOnPress');
    };
    _alertOnDismiss =()=>{
        console.log('_alertOnDismiss');

    };
    render() {
        const {navigate} = this.props.navigation;
        return (
            <ScrollView>
                <View style={styles.container}>
                    <Button onPress={() => navigate('ActivityIndicatorScreen')}
                            title={'ActivityIndicator'} color={'green'}/>
                </View>
                <View style={styles.container}>
                    <Button onPress={() => navigate('ButtonScreen')}
                            title={'Button'} color={'green'}/>
                </View>
                {/*Platform.OS 区别平台*/}
                {Platform.OS === 'ios' ?
                    <View style={styles.container}>
                        <Button onPress={() => navigate('DatePickerIOSScreen')}
                                title={'DatePickerIOS'} color={'green'}/>
                    </View>
                    :
                    <View style={styles.container}>
                        <Text>Not support compoent</Text>
                    </View>
                }
                {/*Platform.OS 区别平台*/}
                {Platform.OS === 'android' ?
                    <View style={styles.container}>
                        <Button onPress={() => navigate('DrawerLayoutAndroidScreen')}
                                title={'DrawerLayoutAndroid'} color={'green'}/>
                    </View>
                    :
                    <View style={styles.container}>
                        <Text>Not support compoent</Text>
                    </View>
                }
                <View style={styles.container}>
                    <Button onPress={this._alertButtonPress} title={'Call Alert'} color={'green'}/>
                </View>

                {/*FlatListScreen*/}
                <View style={styles.container}>
                    <Button onPress={() => navigate('FlatListScreen')}
                            title={'FlatList'} color={'green'}/>
                </View>
            </ScrollView>
        );
    }
}

