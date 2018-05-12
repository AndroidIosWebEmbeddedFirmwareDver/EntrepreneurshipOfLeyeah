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
    FlatList,
    Dimensions,
    ActivityIndicator,
    TouchableOpacity,
} from 'react-native';

import CommonHireStyles from './common.hire.style'

export default class  CommonHireListItem extends Component {
    render() {
        return (
            <TouchableOpacity style={CommonHireStyles.itemContainer}
                              onPress={this.props.onSelectPress}
            >
                <View style={CommonHireStyles.itemHeadContainer}>
                    <Text
                        style={CommonHireStyles.itemHeadContainerLeft}>{this.props.leftShowTitle}</Text>
                    {this.props.rightShowSelect ?
                        <Image
                            source={require('../../../../../stable/image/ic_circle_selected.png')}
                            style={[CommonHireStyles.itemHeadContainerRight,
                                {
                                    width: 24,
                                    height: 24,
                                }
                            ]}
                        />
                        :
                        <Image
                            source={require('../../../../../stable/image/ic_circle_normal.png')}
                            style={[CommonHireStyles.itemHeadContainerRight,
                                {
                                    width: 24,
                                    height: 24,
                                }
                            ]}
                        />
                    }
                </View>
                <View style={CommonHireStyles.itemBottomContainer}/>
            </TouchableOpacity>
        );
    }
}