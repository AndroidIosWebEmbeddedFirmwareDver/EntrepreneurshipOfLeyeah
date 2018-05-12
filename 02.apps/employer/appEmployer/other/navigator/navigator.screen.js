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
    TouchableOpacity,
    StyleSheet
} from 'react-native';

import SecondNavigatorMainScreen from './second.navigator.screen'

export default class NavigatorMainScreen extends React.Component {
    // 构造方法初始化后续需要用到的数据参数，该方法在已进入这个页面的时候会调用一次，从后面页面回来的时候不会调
    constructor(props) {
        // 初始化父类的属性信息
        super(props);
        // 初始化本页面可能会用到的属性信息
        this.state = {
            id: 2,
            user: null,
        }
    }

    _pressButton() {
        // 这里保存一下是为了防止后续事件操作的时候this的执行改变
        let _this = this;
        //为什么这里可以取得 props.navigator?请看上文:
        //<Component {...route.params} navigator={navigator} />
        //这里传递了navigator作为props
        const {navigator} = this.props;
        if (navigator) {
            navigator.push({
                name: 'SecondNavigatorMainScreen',
                // 导航控制器是通过该参数来查找跳转到哪一个控制器
                component: SecondNavigatorMainScreen,
                //这里多出了一个 params 其实来自于<Navigator 里的一个方法的参数...
                //routes.params 里的每个key 作为props的一个属性:
                //这里的 params.id 就变成了 <Navigator id={} 传递给了下一个页面
                params: {
                    id: this.state.id,
                    //回调!从SecondNavigatorMainScreen获取user
                    setUser: function (user) {
                        _this.setState({
                            user: user
                        })
                    }
                }
            });
        }
    }

    // 渲染页面
    render() {
        if (this.state.user) {
            return (
                <View style={styles.container}>
                    <Text style={styles.container}>用户信息: {JSON.stringify(this.state.user)}</Text>
                </View>
            );
        } else {
            return (
                <View style={styles.container}>
                    <TouchableOpacity onPress={this._pressButton.bind(this)}>
                        <Text style={styles.container}>查询ID为{this.state.id}的用户信息</Text>
                    </TouchableOpacity>
                </View>
            );
        }
    }
}


// 设置样式
const styles = StyleSheet.create({
    container: {
        justifyContent:'center',
        alignItems:'center',
        marginTop: 50,
        width: window.width,
        height: 600,
    }
});