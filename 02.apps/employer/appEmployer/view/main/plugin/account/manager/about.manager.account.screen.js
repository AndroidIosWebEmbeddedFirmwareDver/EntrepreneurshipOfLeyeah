import React, {PureComponent, Component} from 'react';
import {
    StyleSheet,
    TouchableOpacity,
    View,
    Text,
    TextInput,
    Button,
    ScrollView,
    Dimensions,
} from 'react-native';


import HeaderCommonView from '../../../../views/header/header.common.view'
import CommonListItemView from '../../../../views/common/common.list.item.view'
import BaseActivity from "../../../../views/base.activity";


export default class AboutManagerAccountActivity extends BaseActivity {
    constructor(props) {
        super(props);
    };

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

    render() {
        return (
            <View style={AboutManagerAccountActivitynStyles.container}>
                <HeaderCommonView navigator={this.props.navigator}
                                  bgColor={'#FFCC33'}
                                  headerLeftShow={true}
                                  headerCenterShow={true}
                                  headerRightShow={false}
                                  showCenterAfterLeft={true}
                                  headerCenterTitle={'关于我们'}/>

                <ScrollView style={AboutManagerAccountActivitynStyles.function_list}>
                    <View style={AboutManagerAccountActivitynStyles.function_list_container}>
                        <View style={{height: 10, backgroundColor: 'transparent',}}/>
                        <CommonListItemView
                            leftTitle={'服务热线'}
                            rightShowTitle={'400-1000-2000'}
                            rightType={'next'}
                            rootNotTouchable={true}
                            showRightAvator={false}
                            rightShowTitleShowAtRight={true}
                            showRightTextWithBgView={false}
                            bottomViewHeight={2}
                        />


                        <CommonListItemView
                            leftTitle={'官方网站'}
                            rightShowTitle={'www.workleye.com'}
                            rightType={'next'}
                            rootNotTouchable={true}
                            showRightAvator={false}
                            rightShowTitleShowAtRight={true}
                            showRightTextWithBgView={false}
                            bottomViewHeight={2}
                        />

                        <CommonListItemView
                            leftTitle={'官方微博'}
                            rightShowTitle={'weibo.cn/workleye'}
                            rightType={'next'}
                            rootNotTouchable={true}
                            showRightAvator={false}
                            rightShowTitleShowAtRight={true}
                            showRightTextWithBgView={false}
                            bottomViewHeight={2}
                        />

                        <CommonListItemView
                            leftTitle={'官方微信'}
                            rightShowTitle={'work_leye'}
                            rightType={'next'}
                            rootNotTouchable={true}
                            showRightAvator={false}
                            rightShowTitleShowAtRight={true}
                            showRightTextWithBgView={false}
                            bottomViewHeight={2}
                        />

                    </View>
                </ScrollView>
            </View>
        );
    };
}
const {
    width,
    height
} = Dimensions.get('window');

AboutManagerAccountActivitynStyles = StyleSheet.create({
    //基于flex-box布局
    container: {
        width: width,
        height: height,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FBFBFB',
    },
    function_list: {
        flex: 1,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FBFBFB',
    },
    function_list_container: {
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FBFBFB',
    },
});