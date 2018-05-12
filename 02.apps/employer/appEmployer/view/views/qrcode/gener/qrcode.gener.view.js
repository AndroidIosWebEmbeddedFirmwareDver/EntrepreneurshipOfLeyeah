import React, {PureComponent} from 'react'
import {
    Text,
    View,
    Alert,
    Image,
    Button,
    WebView,
    Platform,
    ScrollView,
    Dimensions,
    PixelRatio,
    StyleSheet,
    ActivityIndicator,
    TouchableOpacity,
} from 'react-native';
import QrcodeGenerContent from './qrcode.gener.content'

export default class QrcodeGenerView extends PureComponent {

    //-----------------------------------------------------
    //1.构造函数
    constructor(props) {
        super(props);
        this.state = {
            webapp: '',
        };

    }

    //2.Component将要加载
    componentWillMount() {
        this._gener();
    }

    //3.Component加载完毕
    componentDidMount() {
    }

    //4.Component将要移除
    componentWillUnmount() {
    }

    _gener = () => {
        let webapp;
        if (Platform.OS === 'android') {
            webapp = {
                uri: 'file:///android_asset/web/qrgener/qrcode_content.html' + '?'
                + 'qrcodeValue=' + this.props.qrcodeValue
                + '&qrcodeWidth=' + this.props.qrcodeWidth
                + '&qrcodeHeight=' + this.props.qrcodeHeight
            };
        } else {
            webapp = {html: this._gener_html_content(this.props.qrcodeValue, this.props.qrcodeWidth, this.props.qrcodeHeight)};
        }
        this.setState({
            webapp: webapp,
        });
    };

    //5.Component渲染内容
    render() {

        return (
            <View style={[this.props.style, {
                justifyContent: 'center',
                alignItems: 'center',
            }]}>
                <WebView
                    automaticallyAdjustContentInsets={false}
                    scalesPageToFit={Platform.OS === 'android'}
                    contentInset={{top: 0, right: 0, bottom: 0, left: 0}}
                    source={this.state.webapp}
                    opaque={false}
                    underlayColor={'transparent'}
                    style={[this.props.style, {
                        justifyContent: 'center',
                        alignItems: 'center',
                    }]}
                    javaScriptEnabled={true}
                    scrollEnabled={false}
                />
            </View>
        );
    };

    _gener_html_content = (meQrcodeValue, meQrcodeWidth, meQrcodeHeight) => {
        return QrcodeGenerContent.gener_html_content(meQrcodeValue, meQrcodeWidth, meQrcodeHeight);
    };

}

QrcodeGenerViewStyles = StyleSheet.create({
    //基于flex-box布局
    container: {
        flex: 1,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FBFBFB',
    },
    normal_text: {
        fontSize: 16,
    },
});