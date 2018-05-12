import React, {Component, PureComponent} from 'react';
import {
    StyleSheet,
    View,
    Button,
    AppRegistry,
    TouchableHighlight,
    Text
} from 'react-native'

import ToastManager from '../../../main/utils/toast/Toast.util'
import Dimensions from 'Dimensions';

/*
USEAGE:

import ToastManager from '../../../main/utils/toast/Toast.util'
ToastManager.show(
    '我是一条消息',
    ToastManager.DURATION.SHORT,
    ToastManager.POSITION.BOTTOM
);
 */

export default class ToastDemoScreen extends PureComponent {
    constructor(props) {
        super(props);
    }

    componentDidMount() {

    }

    addSibling = () => {
        ToastManager.show(
            '我是一条消息',
            ToastManager.DURATION.SHORT,
            ToastManager.POSITION.BOTTOM
        );
    };

    render() {
        return <View style={styles.container}>
            <TouchableHighlight
                style={styles.button}
                onPress={this.addSibling}
            >
                <Text style={styles.buttonText}>Show Toast</Text>
            </TouchableHighlight>

        </View>;
    }

}

styles = StyleSheet.create({
    container: {
        flex: 1,
        alignItems: 'center',
        justifyContent: 'center',
        backgroundColor: 'white',
    },
    button: {
        borderRadius: 4,
        padding: 10,
        marginLeft: 10,
        marginRight: 10,
        backgroundColor: '#ccc',
        borderColor: '#333',
        borderWidth: 1,
    },
    buttonText: {
        color: '#000'
    },
    sibling: {
        left: 0,
        height: 20,
        width: Dimensions.get('window').width / 2,
        backgroundColor: 'blue',
        opacity: 0.5
    }
});