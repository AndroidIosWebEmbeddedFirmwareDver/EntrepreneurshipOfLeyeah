import React from 'react';
import {
    Text,
    View,
    ScrollView,
    TouchableOpacity,
    Button,
} from 'react-native';
import styles from '../guides.app.style';


/**
 * 自定义组件
 */
class MyButton extends React.Component {
    render() {
        return (
            <View>
                <Text>{this.props.label}</Text>
                <Text>{this.props.color}</Text>
            </View>
        )
    }
}


export default class CompositeComponentsScreen extends React.Component {
    static navigationOptions={
      title:'CompositeComponents',
    };
    render() {
        return (
            <View style={styles.container}>
                <TouchableOpacity>
                    <MyButton label="Press me!" color="#123142"/>
                </TouchableOpacity>
            </View>
        )
    }
}
