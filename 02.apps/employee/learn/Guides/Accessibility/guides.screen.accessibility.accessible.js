import React from 'react';
import {
    Text,
    View,
    TouchableOpacity,
    TouchableWithoutFeedback,
} from 'react-native';
import styles from '../guides.app.style';

export default class AccessibleScreen extends React.Component {


    static navigationOptions = {
        title: 'Accessible',
    };
    _onPress = () => {
        console.log('aaa');
    };

    render() {
        return (
            <View accessible={true} style={styles.container}>
                <Text>text one</Text>
                <Text>text two</Text>
                <TouchableOpacity accessible={true} accessibilityLabel={'Tap me!'} onPress={this._onPress}>
                    <View style={styles.button}>
                        <Text style={styles.buttonText}>Press me!</Text>
                    </View>
                </TouchableOpacity>

                <TouchableWithoutFeedback accessibilityComponentType="button" onPress={this._onPress}>
                    <View style={styles.button}>
                        <Text style={styles.buttonText}>Press me!</Text>
                    </View>
                </TouchableWithoutFeedback>
            </View>
        );
    }
}
