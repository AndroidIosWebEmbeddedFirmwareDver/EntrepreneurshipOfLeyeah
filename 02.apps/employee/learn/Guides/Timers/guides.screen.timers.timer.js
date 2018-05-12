import React from 'react';
import {
    Text,
    View,
    ScrollView,
    InteractionManager,
    TouchableOpacity,
    Button,
} from 'react-native';
import styles from '../guides.app.style';



export default class TimerScreen extends React.Component {

    state = {
        times: 0,
        timesResult: 'this is result:',
    };

    static navigationOptions = {
        title: 'Timer',
    };


    _runAfterInteractions = () => {
        this.state.times++;
        this.state.timesResult += '\n第' + this.state.times + '次 ';
        this.setState({times: this.state.times, timesResult: this.state.timesResult});
    };

    _onPress = () => {
        setInterval(this._runAfterInteractions, 3*1000);
    }


    render() {
        return (
            <ScrollView>
                <View style={styles.container}>
                    <Text>{this.state.timesResult}</Text>
                    <Button
                        title={'Press me!'}
                        onPress={this._onPress}
                        hidden={this.state.times > 0}
                    />
                </View>
            </ScrollView>
        );
    }
}
