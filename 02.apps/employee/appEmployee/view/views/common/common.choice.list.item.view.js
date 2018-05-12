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


const {
    width,
    height
} = Dimensions.get('window');


export default class CommonChoiceListItemView extends Component {

    //1.
    constructor(props) {
        super(props);
        this.state = {};
    }

    //2.
    componentWillMount() {

    }

    //3.
    componentDidMount() {

    }

    //4.
    componentWillUnmount() {
    }

    componentWillReceiveProps() {

    }

    render() {

        return (
            <TouchableOpacity style={CommonChoiceListItemViewStyles.itemContainer}
                              onPress={this.props.onSelectPress}
            >
                <View style={CommonChoiceListItemViewStyles.itemHeadContainer}>
                    <Text
                        style={CommonChoiceListItemViewStyles.itemHeadContainerLeft}>{this.props.leftShowTitle}</Text>

                    <Image
                        source={this.props.rightShowSelected ?
                            require('../../../stable/image/ic_circle_selected.png')
                            : require('../../../stable/image/ic_circle_normal.png')
                        }
                        style={[CommonChoiceListItemViewStyles.itemHeadContainerRight,
                            {
                                width: 24,
                                height: 24,
                            }
                        ]}
                    />
                </View>
                <View style={CommonChoiceListItemViewStyles.itemBottomContainer}/>
            </TouchableOpacity>
        );
    }
}


CommonChoiceListItemViewStyles = StyleSheet.create({
    itemContainer: {
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        width: width,
        backgroundColor: '#FFFFFF',
        alignItems: 'center',
    },
    itemHeadContainer: {
        flex: 1,
        flexDirection: 'row',//row ,row-reverse ,column ('default') column-reverse
        width: width,
        height: 56,
        backgroundColor: '#FFFFFF',
        alignItems: 'center',
    },
    itemHeadContainerLeft: {
        flex: 1,
        backgroundColor: '#FFFFFF',
        alignItems: 'center',
        marginLeft: 9.6 * 2,
        fontSize: 16,
    },
    itemHeadContainerRight: {
        backgroundColor: '#FFFFFF',
        alignItems: 'center',
        marginRight: 9.6 * 2,
    },
    itemBottomContainer: {
        width: width,
        height: 2.4,
        backgroundColor: '#FBFBFB',
    }
});