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

export default class ActivityIndicatorScreen extends Component {
    static navigationOptions = {
        title: 'ActivityIndicator',
    };
    state = {
        animating: true,
    };

    _onpress = () => {
        this.state.animating = !this.state.animating;
        this.setState({animating: this.state.animating});
    };

    render() {
        const {navigate} = this.props.navigation;
        return (
            <ScrollView>
                <View style={styles.container}>
                    <ActivityIndicator hidesWhenStopped={true} animating={this.state.animating}
                                       color={'white'} style={styles.normalView}/>

                    <ActivityIndicator hidesWhenStopped={true} animating={this.state.animating}
                                       color={'red'} style={styles.normalView}/>

                    <ActivityIndicator hidesWhenStopped={true} animating={this.state.animating}
                                       color={'blue'} style={styles.normalView}/>

                    <ActivityIndicator hidesWhenStopped={true} animating={this.state.animating}
                                       color={'green'} style={styles.normalView}/>


                    <ActivityIndicator hidesWhenStopped={true} animating={this.state.animating}
                                       color={'white'} style={styles.normalView} size={'large'}/>

                    <ActivityIndicator hidesWhenStopped={true} animating={this.state.animating}
                                       color={'red'} style={styles.normalView} size={'large'}/>

                    <ActivityIndicator hidesWhenStopped={true} animating={this.state.animating}
                                       color={'blue'} style={styles.normalView} size={'large'}/>

                    <ActivityIndicator hidesWhenStopped={true} animating={this.state.animating}
                                       color={'green'} style={styles.normalView} size={'large'}/>



                    <Button onPress={this._onpress} title={'press me'}/>
                    <Text>animating:{this.state.animating === true ? 'true' : 'false'}</Text>
                </View>
            </ScrollView>
        );
    }
}

