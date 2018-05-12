import React from 'react';
import {
    View,
    Navigator,
    Text,
    TouchableOpacity,
    StyleSheet
} from 'react-native';

// 初始化数据模型
const USER_MODELS = {
    1: {name: 'mot', age: 23},
    2: {name: '晴明大大', age: 25}
};

import NavigatorMainScreen from './navigator.screen';

// 导出模块
export default class SecondNavigatorMainScreen extends React.Component {
    // 初始化模块信息
    constructor(props) {
        super(props);
        this.state = {
            id: null
        }
    }

    // 当页面加载完成的时候会调用一次，相当于IOS中的ViewDidLoad方法
    componentDidMount() {
        //这里获取从FirstPageComponent传递过来的参数: id
        this.setState({
            id: this.props.id
        });
    }

    _pressButton() {

        const {navigator} = this.props;
        // 如果上一页面有getUser方法再执行下面的方法
        if (this.props.setUser) {
            let user = USER_MODELS[this.props.id];
            //回调传值给上个页面
            this.props.setUser(user);
        }

        if (navigator) {
            //出栈，返回到上一页
            navigator.pop();
        }
    }

    render() {
        return (
            <View style={styles.container}>
                <Text>获得的参数: id={this.state.id}</Text>
                <TouchableOpacity onPress={this._pressButton.bind(this)}>
                    <Text>点我跳回去</Text>
                </TouchableOpacity>
            </View>
        );
    }
}


// // 设置样式
const styles = StyleSheet.create({
    container: {
        justifyContent: 'center',
        alignItems: 'center',
        marginTop: 50,
        width: window.width,
    }
});