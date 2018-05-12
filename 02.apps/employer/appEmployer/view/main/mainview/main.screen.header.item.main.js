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


export default class MainScreenHeaderItem extends Component {
    state = {
        bodyerItemBtnValues: 0,
    };

    //根View的onLayout回调函数
    _onLayout(event) {
        //获取根View的宽高，以及左上角的坐标值
        let {x, y, width, height} = event.nativeEvent.layout;
        console.log('通过onLayout得到的宽度：' + width);
        console.log('通过onLayout得到的高度：' + height);
        // alert('通过onLayout得到的宽度：' + width + '\n' + '通过onLayout得到的高度：' + height);
        if (width > height) {
            this.setState({bodyerItemBtnValues: height});
        } else {
            this.setState({bodyerItemBtnValues: width});
        }
    };

    _notificationOnpress = () => {

    };


    render() {
        if (this.props.showForAccount) {
            return (
                <View
                    style={[MainScreenHeaderItemStyles.header, {}]}
                >


                    <View style={MainScreenHeaderItemStyles.headerItemForAccount}>

                        <TouchableOpacity
                            style={{
                                marginLeft: 9.6,
                                marginRight: 9.6,
                                justifyContent: 'center',
                                alignItems: 'center',
                            }}
                            onPress={this.props.headerAccountOnpress}
                        >
                            <Image
                                source={this.props.mobileUserAvatorUrl ? this.props.mobileUserAvatorUrl : require('../../../stable/image/app_a.png')}
                                style={{
                                    width: 96,
                                    height: 96,
                                    borderRadius: 96 / 2,
                                    borderColor: '#F0F0F0',
                                    borderWidth: (Platform.OS === 'ios' ? 3.0 : 3.5) / PixelRatio.get(),
                                }}
                            />
                        </TouchableOpacity>

                        <View style={{
                            margin: 9.6,
                            justifyContent: 'center',
                            alignItems: 'center',
                        }}>
                            <Text style={{
                                fontSize: 18,
                                color: '#000000'
                            }}>{this.props.mobileUserId}</Text>
                        </View>

                        <View style={{
                            justifyContent: 'center',
                            alignItems: 'center',
                        }}>
                            <View style={{
                                justifyContent: 'center',
                                alignItems: 'center',
                                backgroundColor: '#0088F3',
                                borderRadius: 12,
                                paddingLeft: 9.6,
                                paddingRight: 9.6,
                                borderColor: '#0088F3',
                                borderWidth: (Platform.OS === 'ios' ? 6.0 : 6.5) / PixelRatio.get(),
                            }}>
                                <Text style={{
                                    fontSize: 12,
                                    color: '#ffffff'
                                }}>{this.props.mobileUserBeRna}</Text>
                            </View>
                        </View>

                        <View style={{
                            margin: 9.6,
                            justifyContent: 'center',
                            alignItems: 'center',
                        }}>
                            <Text style={{
                                fontSize: 16,
                                color: '#000000'
                            }}>评分:{this.props.mobileUserScore}</Text>
                        </View>
                    </View>
                </View>
            );
        } else {
            return (
                <View
                    style={MainScreenHeaderItemStyles.header}
                >
                    <Image
                        source={require('../../../stable/image/main/ic_main_bgi.png')}
                        style={{
                            flex: 1,
                            // height:326,
                            // resizeMode: 'stretch',
                            resizeMode: 'contain',
                            // resizeMode: 'cover',
                            justifyContent: 'center',
                            position: 'absolute',
                            padding: 0,
                        }}
                    />
                    <View style={MainScreenHeaderItemStyles.headerItem}>

                        <View
                            style={MainScreenHeaderItemStyles.headerItemNotificationView}>
                            <TouchableOpacity
                                onPress={this.props.headerNotificationOnpress}
                            >
                                <Image
                                    source={this.props.headerNotificationIcon}
                                    style={{
                                        width: 48,
                                        height: 48,
                                    }}
                                />
                            </TouchableOpacity>

                        </View>

                        <TouchableOpacity
                            style={{
                                marginLeft: 9.6,
                                marginRight: 9.6,
                                justifyContent: 'center',
                                alignItems: 'center',
                            }}
                            onPress={this.props.headerAccountOnpress}
                        >
                            <Image
                                source={this.props.mobileUserAvatorUrl ? this.props.mobileUserAvatorUrl : require('../../../stable/image/app_a.png')}
                                style={{
                                    width: 96,
                                    height: 96,
                                    borderRadius: 96 / 2,
                                    borderColor: '#F0F0F0',
                                    borderWidth: (Platform.OS === 'ios' ? 3.0 : 3.5) / PixelRatio.get(),
                                }}
                            />
                        </TouchableOpacity>

                        <View style={{
                            margin: 9.6,
                            justifyContent: 'center',
                            alignItems: 'center',
                        }}>
                            <Text style={{
                                fontSize: 18,
                                color: '#000000'
                            }}>{this.props.mobileUserId}</Text>
                        </View>

                        <View style={{
                            justifyContent: 'center',
                            alignItems: 'center',
                        }}>
                            {this.props.mobileUserBeRna ?
                                <View style={{
                                    justifyContent: 'center',
                                    alignItems: 'center',
                                    backgroundColor: '#0088F3',
                                    borderRadius: 12,
                                    paddingLeft: 9.6,
                                    paddingRight: 9.6,
                                    borderColor: '#0088F3',
                                    borderWidth: (Platform.OS === 'ios' ? 6.0 : 6.5) / PixelRatio.get(),
                                }}>
                                    <Text style={{
                                        fontSize: 12,
                                        color: '#ffffff'
                                    }}>{this.props.mobileUserBeRna}</Text>
                                </View>
                                : <View/>
                            }
                        </View>

                        <View style={{
                            margin: 9.6,
                            justifyContent: 'center',
                            alignItems: 'center',
                        }}>
                            {this.props.mobileUserScore ?
                                <Text style={{
                                    fontSize: 12,
                                    color: '#000000'
                                }}>评分:{this.props.mobileUserScore}</Text>
                                : <View/>
                            }
                        </View>
                    </View>
                </View>
            );
        }

    }
}

MainScreenHeaderItemStyles = StyleSheet.create({

    container: {
        flex: 1,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#F6F6F6'
    },
    header: {
        flex: 3,
        backgroundColor: 'transparent',
        justifyContent: 'center',// 内容居中
        // padding: 9.6,
    },
    headerItem: {
        flex: 1,
        flexDirection: 'column',
        marginTop: (Platform.OS === 'ios' ? 20 : 0),
    },

    headerItemForAccount: {
        flex: 1,
        flexDirection: 'column',
    },
    headerItemNotificationView: {
        flex: 1,
        height: 44,
        flexDirection: 'row',
        marginLeft: 9.6,
        marginRight: 9.6,
        justifyContent: 'flex-end',
        alignItems: 'center',
    },
    headerItemItem: {
        flex: 1,
        height: 66,
        flexDirection: 'column',
        marginLeft: 9.6,
        marginRight: 9.6,
        backgroundColor: '#ffffff',
        borderColor: '#f0f0f0',
        borderRadius: 9.6,
        borderWidth: (Platform.OS === 'ios' ? 1.0 : 1.5) / PixelRatio.get(),
    },

    bodyer: {
        flex: 5,
        paddingBottom: 9.6,
    },
    bodyerItem: {
        flex: 1,
        flexDirection: 'row',
        marginLeft: 9.6,
        marginTop: 9.6,
        marginRight: 9.6,
        padding: 4.8,
        backgroundColor: '#ffffff',
        borderColor: '#f0f0f0',
        borderRadius: 9.6,
        borderWidth: (Platform.OS === 'ios' ? 1.0 : 1.5) / PixelRatio.get(),
    },

    welcome: {
        fontSize: 20,
        textAlign: 'center',
        margin: 10,
    },
    instructions: {
        textAlign: 'center',
        color: '#333333',
        marginBottom: 5,
    },
    text: {
        fontSize: 18,
        padding: 9.6,
    },
    normalView: {
        padding: 9.6,
        margin: 9.6,
    },
});


