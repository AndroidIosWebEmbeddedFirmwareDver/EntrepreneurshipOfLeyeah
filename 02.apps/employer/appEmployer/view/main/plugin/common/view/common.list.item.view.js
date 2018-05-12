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
    TextInput,
    Dimensions,
    ActivityIndicator,
    StyleSheet,
    TouchableOpacity,
} from 'react-native'


export default class CommonListItemView extends Component {
    render() {
        return (
            <TouchableOpacity
                onPress={this.props.itemOnpress}
            >
                <View
                    style={[CommonListItemViewStyles.top, {height: this.props.itemHeight > 0 ? this.props.itemHeight : 56}]}>
                    <Text
                        style={CommonListItemViewStyles.itemLeftText}>{this.props.leftTitle}</Text>
                    <View style={CommonListItemViewStyles.itemRightView}>
                        {

                            this.props.rightType === 'next' ?
                                <View style={CommonListItemViewStyles.itemRightInView}>
                                    <Text
                                        style={CommonListItemViewStyles.itemRightInViewText}>{this.props.rightShowTitle}</Text>
                                    <Image
                                        source={this.props.rightNextImage}
                                        style={{
                                            width: 32,
                                            height: 32,
                                        }}
                                    />
                                </View>
                                : this.props.rightType === 'input' ?
                                <TextInput
                                    style={{height: 48, flex: 1}}
                                    placeholder={this.props.rightInputPlaceholder}
                                    onChangeText={(text) => this.props.onInputParamsChange(text)}
                                    clearButtonMode={'while-editing'}
                                    keyboardType={this.props.keyboardTypeIn}
                                />
                                : <View style={CommonListItemViewStyles.itemRightInView}>
                                    <Text
                                        style={CommonListItemViewStyles.itemRightInViewTextRight}>{this.props.rightShowTitle}</Text>
                                </View>
                        }
                    </View>
                </View>
                <View style={{
                    width: window.width,
                    height: this.props.bottomViewHeight,
                    backgroundColor: 'transparent'
                }}/>
            </TouchableOpacity>
        );
    }
}


CommonListItemViewStyles = StyleSheet.create({
    container: {
        width: window.width,
        flexDirection: 'row',
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: '#F5FCFF',
    },
    top: {
        width: window.width,
        height: 56,
        flexDirection: 'row',
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: '#FFFFFF',
    },
    itemLeftText: {
        flex: 1,
        fontSize: 16,
        padding: 9.6,
    },
    itemRightView: {
        flex: 1,
        flexDirection: 'row',
        justifyContent: 'flex-end',
        alignItems: 'center',
    },
    itemRightInView: {
        flex: 1,
        flexDirection: 'row',
        justifyContent: 'flex-end',
        alignItems: 'center',
    },
    itemRightInViewText: {
        flex: 1,
        flexDirection: 'row',
        justifyContent: 'flex-end',
        alignItems: 'center',
        fontSize: 16,
    },
    itemRightInViewTextRight: {
        justifyContent: 'flex-end',
        alignItems: 'flex-end',
        fontSize: 16,
        paddingRight: 9.6,
    },
    itemBotomView: {
        width: window.width,
        backgroundColor: 'transparent',
    },
    bottomView: {
        width: window.width,
        height: 56,
        flexDirection: 'row',
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: '#FFCC33',
    },
    bottomItemView: {
        flex: 1,
        height: 56,
        justifyContent: 'center',
        alignItems: 'center',
    },
    bottomItemViewText: {
        fontSize: 16,
        color: '#FFFFFF',
    },
});