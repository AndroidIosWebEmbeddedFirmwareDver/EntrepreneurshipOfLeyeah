import React, {Component} from 'react';
import {
    AppRegistry,
    StyleSheet,
    Text,
    ScrollView,
    Image,
    Button,
    View,
    ActivityIndicator,
} from 'react-native';

import styles from '../components.app.style'

export default class ButtonScreen extends Component {
    static navigationOptions = {
        title: 'Button',
    };
    state = {
        animating: true,
    };

    _onpress = () => {
        this.state.animating = !this.state.animating;
        this.setState({animating: this.state.animating});
    };
    onPressLearnMore(){

    }

    render() {
        const {navigate} = this.props.navigation;
        return (
            <ScrollView>
                <View style={styles.container} >
                    <Button
                        onPress={this.onPressLearnMore}
                        title="Learn More"
                        color="#841584"
                        accessibilityLabel="Learn more about this purple button"
                    />
                    <Button onPress={this._onpress} title={'press me'}/>
                    <Text>animating:{this.state.animating === true ? 'true' : 'false'}</Text>
                </View>
            </ScrollView>
        );
    }
}

