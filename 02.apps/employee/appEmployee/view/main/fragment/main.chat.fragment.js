import React, {PureComponent} from 'react';

import {
    StyleSheet,
    View,
    Text,
    Platform,
    TouchableOpacity,
    Image,
} from 'react-native';

import Toast from '../../../utils/toast/Toast.util'

class MainChatFragment extends PureComponent {
    //1.
    constructor(props) {
        super(props);
        this.state = {
            mainThemeColor: null,
        };
    }

    //2.
    componentWillMount() {

        this.state.mainThemeColor = '#FFFFFF';
        this.setState({
            mainThemeColor: this.state.mainThemeColor,
        });
        if (this.props.changeStatusColor) {
            this.props.changeStatusColor('#FFCC33');
        }

        if (this.props.changeHeadbar) {
            this.props.changeHeadbar('#FFCC33', '工友圈');
        }
    }

    //3.
    componentDidMount() {

    }

    //4.
    render() {
        return (
            <View
                style={[MainChatFragmentStyles.root, this.state.mainThemeColor ? {backgroundColor: this.state.mainThemeColor} : {}]}>
                <Image
                    source={require('../../../stable/image/main/ic_main_chat_had_in_coding.png')}
                    style={MainChatFragmentStyles.header_show_image}
                />
                {/*<Text>will be come soon , just have a wait , please !</Text>*/}
            </View>
        );
    }
}

MainChatFragmentStyles = StyleSheet.create({
    root: {
        flex: 1,
        flexDirection: 'column',
        justifyContent: 'center',
        alignItems: 'center',
    },
    header_show_image: {
        width: 196,
        height: 196,
        resizeMode: 'stretch',//cover:等比拉伸 stretch:保持原有大小 contain:图片拉伸  充满空间
    },
});

export default MainChatFragment;