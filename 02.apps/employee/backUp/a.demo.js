import React, {Component} from 'react';
import {
    Image, ScrollView, Text, AppRegistry,
    StyleSheet,
    View
} from 'react-native';

class AwkwardScrollingImageWithText extends Component {
    render() {
        return (
            <ScrollView>
                <Image
                    source={{uri: 'https://i.chzbgr.com/full/7345954048/h7E2C65F9/'}}
                    style={{width: 320, height: 180}}
                />
                <Text>
                    On iOS, a React Native ScrollView uses a native UIScrollView.
                    On Android, it uses a native ScrollView.

                    On iOS, a React Native Image uses a native UIImageView.
                    On Android, it uses a native ImageView.

                    React Native wraps the fundamental native components, giving you
                    the performance of a native app, plus the clean design of React.
                </Text>
            </ScrollView>
        );
    }
}


AppRegistry.registerComponent('untitled', () => untitled);