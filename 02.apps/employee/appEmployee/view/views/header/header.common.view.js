import React, {Component} from 'react';
import {
    Text,
    ScrollView,
    Image,
    Button,
    View,
    Platform,
    PixelRatio,
    Alert,
    Dimensions,
    ActivityIndicator,
    TouchableOpacity,
    StyleSheet,
} from 'react-native';

import styles from './header.common.style'

export default class HeaderCommonView extends Component {

    _onbackPress = () => {
        if (this.props.onbackPress) {
            this.props.onbackPress();
        }
        if (!this.props.invalidLeftPop) {
            if (this.props.navigator) {
                this.props.navigator.pop();
            }
        }
    };

    render() {
        return (
            <View
                style={[styles.headerContainer, {backgroundColor: this.props.bgColor ? this.props.bgColor : '#FFCC33'}]}>
                <View style={styles.headerHeader}/>
                <View style={styles.headerBody}>
                    <View
                        style={[styles.headerLeftContainer, this.props.showCenterAfterLeft ? {flex: 0} : {flex: 1}]}>
                        {this.props.headerLeftShow ?
                            <TouchableOpacity
                                onPress={() => this._onbackPress()}>
                                <Image
                                    source={require('../../../stable/image/ic_app_back.png')}
                                    style={styles.headericon}
                                />
                            </TouchableOpacity>
                            : <View/>
                        }
                    </View>

                    <View style={[styles.headerCenterContainer, this.props.showCenterAfterLeft ? {
                        justifyContent: 'flex-start',
                        alignItems: 'center',
                        paddingLeft: 19.2,
                    } : {
                        justifyContent: 'center',
                        alignItems: 'center',
                    }]}>
                        {this.props.headerCenterShow ?
                            <Text style={{fontSize: 18,}}> {this.props.headerCenterTitle}</Text>
                            : <View/>
                        }
                    </View>

                    <View style={styles.headerRightContainer}>
                        {this.props.headerRightShow ?
                            <TouchableOpacity
                                onPress={this.props.headerRightButtonOnpress}
                            >
                                <Text
                                    style={styles.headertext}>{this.props.headerRightButtonTitle}</Text>
                            </TouchableOpacity>
                            : <View/>
                        }
                    </View>

                </View>

            </View>
        );
    }
}