import React, {PureComponent, Component} from 'react';
import {
    View,
    Text,
    Image,
    FlatList,
    Platform,
    ScrollView,
    StyleSheet,
    PixelRatio,
    Dimensions,
    TouchableOpacity,
} from 'react-native';

import BaseActivity from "../base.activity";

const {
    width,
    height
} = Dimensions.get('window');

let mainPressBackTimes = 0;


export default class RefreshCommonActivity extends BaseActivity {
    // state = {
    //     data: [],//存储列表使用的数据
    //     mFlatListRefreshing: false,//当前的刷新状态
    // };

    //1.
    constructor(props) {
        super(props);
        this.state = {
            data: [],//存储列表使用的数据
            mFlatListRefreshing: false,//当前的刷新状态
        };
    }

    //2.
    componentWillMount() {
        super.componentWillMount();
    }

    //3.
    componentDidMount() {
        super.componentDidMount();
    }

    //4.
    componentWillUnmount() {
        super.componentWillUnmount();

    }

    _mFlatListRefreshing = () => {
        return this.state.mFlatListRefreshing;
    };

    /*
    下拉刷新
     */
    _mFlatListOnRefresh() {

        //设置刷新状态为正在刷新
        this.setState({
            mFlatListRefreshing: true,
        });
        // //延时加载
        // const timer = setTimeout(() => {
        //     clearTimeout(timer);
        //     // //往数组的第一位插入数据，模拟数据新增 , unshift()会返回数组的长度
        //     // this.state.data.unshift(new this.ItemData('https://pic2.zhimg.com/v2-8f11b41f995ca5340510c1def1c003d1.jpg',
        //     //     '下拉刷新添加的数据——————' + this.count, 475843));
        //     this.count++;
        //     this.setState({
        //         mFlatListRefreshing: false,
        //     });
        // }, 1500);
    };

    _mFlatListStopRefresh = () => {
        this.setState({
            mFlatListRefreshing: false,
        });
    };

    /*
    上拉加载
     */
    _mFlatListOnEndReached() {

    };

    _mFlatListHeader() {
        return (
            <View style={{
                backgroundColor: '#4398ff',
                alignItems: 'center',
                justifyContent: 'center',
                height: 150,
            }}>
                < Text style={{
                    fontSize: 18,
                }}>我是头布局</Text>
            </View>
        );
    };

    _mFlatListFooter() {
        return (
            <View style={{
                backgroundColor: '#ff98ff',
                alignItems: 'center',
                justifyContent: 'center',
                height: 150,
            }}>
                < Text style={{
                    fontSize: 18,
                }}>我是尾布局</Text>
            </View>
        );
    };
}

RefreshCommonActivityStyles = StyleSheet.create({
    root: {
        flex: 1,
        flexDirection: 'column',
        // justifyContent: 'center',
        // alignItems: 'center',
    },
    list_view: {
        flex: 6,
        flexDirection: 'row',
        justifyContent: 'center',
        alignItems: 'center',
    },
});


