import React, {PureComponent, Component} from 'react';

import {
    View,
    Text,
    Platform,
    TouchableOpacity,
    Image,
    StyleSheet,
    Dimensions,
    PixelRatio,
} from 'react-native';

const {
    width,
    height
} = Dimensions.get('window');

class MainFragmentHeaderView extends PureComponent {
    //1.
    constructor(props) {
        super(props);
    }

    //2.
    componentWillMount() {
    }

    //3.
    componentDidMount() {

    }

    //4.
    render() {
        return (
            <View
                style={[MainFragmentHeaderViewStyles.root, this.props.rootBgColor ? {backgroundColor: this.props.rootBgColor} : '']}>
                <View style={MainFragmentHeaderViewStyles.header_left_container}>
                    <Text style={MainFragmentHeaderViewStyles.header_big_text_left}>
                        {this.props.headerLeftText}
                    </Text>
                </View>
                <View style={MainFragmentHeaderViewStyles.header_right_container}>
                    {
                        this.props.showNotifiction ?
                            <TouchableOpacity
                                onPress={this.props.onNotifictionPressed}
                            >
                                <Image
                                    source={require('../../../stable/image/ic_app_notificationn.png')}
                                    style={{
                                        width: 48,
                                        height: 48,
                                    }}/>
                            </TouchableOpacity>
                            :
                            <Text style={MainFragmentHeaderViewStyles.header_big_text_right}>
                                {this.props.headerRightText}
                            </Text>
                    }

                </View>
            </View>
        );
    }
}

MainFragmentHeaderViewStyles = StyleSheet.create({
    root: {
        width: width,
        height: 48,
        flexDirection: 'row',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#ffffff',
    },
    header_left_container: {
        flex: 1,
        flexDirection: 'column',
        justifyContent: 'center',
        alignItems: 'flex-start',
    },
    header_right_container: {
        flex: 1,
        flexDirection: 'column',
        justifyContent: 'center',
        alignItems: 'flex-end',
    },
    header_big_text_left: {
        fontSize: 20,
        fontWeight: 'bold',
        color: '#282828',
        marginLeft: 9.6,
    },
    header_big_text_right: {
        fontSize: 20,
        fontWeight: 'bold',
        color: '#282828',
        marginRight: 9.6,
    }
});

export default MainFragmentHeaderView;