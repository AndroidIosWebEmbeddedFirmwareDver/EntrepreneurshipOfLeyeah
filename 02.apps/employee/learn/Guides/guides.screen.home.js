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

import styles from './guides.app.style'

export default class HomeScreen extends Component {
    static navigationOptions = {
        title: 'guides',
    };

    render() {
        const {navigate} = this.props.navigation;
        return (
            <ScrollView>

                <View style={{width: window.width, margin: 9.6, backgroundColor: '#f0f0f0'}}>
                    <Text style={{width: window.width, margin: 9.6, backgroundColor: '#f0f0f0'}}>Animated</Text>
                    <Button style={{
                        width: window.width,
                        height: 200,
                        margin: 9.6,
                        backgroundColor: '#f0f0f0'
                    }}
                            onPress={() => navigate('FadeInViewScreen', {user: 'Im Passing user'})}//Passing params
                            title="FadeInView"/>
                    <Button style={{
                        width: window.width,
                        height: 200,
                        margin: 9.6,
                        backgroundColor: '#f0f0f0'
                    }}
                            onPress={() => navigate('UIManagerScreen', {user: 'Im Passing user'})}//Passing params
                            title="UIManager"/>
                </View>

                <View style={{width: window.width, margin: 9.6, backgroundColor: '#f0f0f0'}}>
                    <Text style={{width: window.width, margin: 9.6, backgroundColor: '#f0f0f0'}}>Accessibility</Text>
                    <Button style={{
                        width: window.width,
                        height: 200,
                        margin: 9.6,
                        backgroundColor: '#f0f0f0'
                    }}
                            onPress={() => navigate('AccessibleScreen', {user: 'Im Passing user'})}//Passing params
                            title="Accessible"/>
                </View>


                <View style={{width: window.width, margin: 9.6, backgroundColor: '#f0f0f0'}}>
                    <Text style={{width: window.width, margin: 9.6, backgroundColor: '#f0f0f0'}}>Timers</Text>
                    <Button style={{
                        width: window.width,
                        height: 200,
                        margin: 9.6,
                        backgroundColor: '#f0f0f0'
                    }}
                            onPress={() => navigate('TimerScreen', {user: 'Im Passing user'})}//Passing params
                            title="Timer"/>
                </View>

                <View style={{width: window.width, margin: 9.6, backgroundColor: '#f0f0f0'}}>
                    <Text style={{width: window.width, margin: 9.6, backgroundColor: '#f0f0f0'}}>Direct Manipulation</Text>
                    <Button style={{
                        width: window.width,
                        height: 200,
                        margin: 9.6,
                        backgroundColor: '#f0f0f0'
                    }}
                            onPress={() => navigate('CompositeComponentsScreen', {user: 'Im Passing user'})}//Passing params
                            title="Composite components"/>
                    <Button style={{
                        width: window.width,
                        height: 200,
                        margin: 9.6,
                        backgroundColor: '#f0f0f0'
                    }}
                            onPress={() => navigate('SetNativePropsScreen', {user: 'Im Passing user'})}//Passing params
                            title="Set NativeProps"/>
                </View>

                <Image
                    source={{uri: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1506445757927&di=7895783e8b4ce1c23762d76b2123c1ff&imgtype=0&src=http%3A%2F%2Fimg17.3lian.com%2Fd%2Ffile%2F201702%2F27%2Fdbc3a459c3009ea4241a5c709ed59bc5.jpg'}}
                    style={{
                        width: window.width,
                        height: 200,
                        margin: 9.6,
                        backgroundColor: '#f0f0f0'
                    }}
                />
                <Image
                    source={{uri: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1506500625953&di=406269398ce05990e5a2728139f9f109&imgtype=0&src=http%3A%2F%2Ff.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F3b292df5e0fe992551c8ff903da85edf8cb1712e.jpg'}}
                    style={{
                        width: window.width,
                        height: 200,
                        margin: 9.6,
                        backgroundColor: '#f0f0f0'
                    }}/>
            </ScrollView>
        );
    }
}

