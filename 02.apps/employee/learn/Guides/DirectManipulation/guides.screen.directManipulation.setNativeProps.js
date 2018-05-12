import React from 'react';
import {
    Text,
    View,
    ScrollView,
    TouchableOpacity,
    Button,
    TextInput,
} from 'react-native';
import styles from '../guides.app.style';

export default class SetNativePropsScreen extends React.Component {
    static navigationOptions = {
        title: 'SetNativeProps',
    };
    clearText = () => {
        this._textInput.setNativeProps({text: ''});
    }

    render() {
        return (
            <View style={{flex: 1}}>
                <TextInput
                    ref={component => this._textInput = component}
                    style={{
                        height: 30,
                        flex: 1,
                        marginHorizontal: 20,
                        borderWidth: 1,
                        borderColor: '#ccc'
                    }}
                />
                <TouchableOpacity onPress={this.clearText}>
                    <Text>Clear text</Text>
                </TouchableOpacity>
            </View>
        );
    }
}
