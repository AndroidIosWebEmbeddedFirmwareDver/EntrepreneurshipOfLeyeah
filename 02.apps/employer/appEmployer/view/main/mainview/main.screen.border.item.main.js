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
} from 'react-native';




import styles from '../main.style'


export default  class MainScreenBorderItem extends Component {
    state = {
        bodyerItemBtnValues: 32,
    };

    //根View的onLayout回调函数
    _onLayout(event) {
        //获取根View的宽高，以及左上角的坐标值
        let {x, y, width, height} = event.nativeEvent.layout;
        // alert('通过onLayout得到的宽度：' + width + '\n' + '通过onLayout得到的高度：' + height);
        if (width > height) {
            this.setState({bodyerItemBtnValues: height});
        } else {
            this.setState({bodyerItemBtnValues: width});
        }
    };

    _onItemPress = (index) => {
        // alert(index);
    };

    render() {
        return (
            <TouchableOpacity
                activeOpacity={0.5}
                style={styles.bodyerItem}
                onPress={this.props.itemOnpress}
                // onPress={this._onItemPress.bind(this, this.props._index)}
            >
                <View
                    style={styles.bodyerItemItem} onLayout={this._onLayout.bind(this)}>
                    <Image
                        source={this.props.item1ImageUri}
                        style={{
                            width: this.state.bodyerItemBtnValues,
                            height: this.state.bodyerItemBtnValues,
                            borderRadius: this.state.bodyerItemBtnValues / 2,
                            borderColor: '#eeeeee',
                            borderWidth: (Platform.OS === 'ios' ? 6.0 : 6.5) / PixelRatio.get(),
                        }}
                    />
                </View>
                <View style={styles.bodyerItemItem}>
                    <Text style={{
                        textAlign: 'left',
                        paddingLeft: 16,
                    }}>{this.props.item2Title}</Text>
                </View>
                <View style={styles.bodyerItemItem}>
                    <Text style={{
                        textAlign: 'right',
                    }}>{this.props.item3Title}</Text>
                </View>
                <View style={styles.bodyerItemRightItem}>

                    <Image
                        source={this.props.item3ImageUri}
                        style={{
                            width: 32,
                            height: 32,
                        }}
                    />
                </View>
            </TouchableOpacity>
        )
    };
}
