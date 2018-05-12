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
    Alert,
    Modal,
    Image,
} from 'react-native';

const {
    width,
    height
} = Dimensions.get('window');

export default class NormalChoiceDialogContainer extends PureComponent {

    _refrenceView = () => {

        return null;
    };


    _hide = (itemOnpressCllback) => {
        if (this.props.hide) {
            this.props.hide();
        }
        if (itemOnpressCllback) {
            itemOnpressCllback();
        }
    };

    _getItems() {
        let pages = [];
        if (this.props.items) {
            for (let i = 0; i < this.props.items.length; i++) {
                pages.push(
                    <TouchableOpacity
                        key={i}
                        onPress={() => this._hide(this.props.items[i].itemOnpressCllback)}
                        style={NormalChoiceDialogContainerStyles.container_view}
                    >
                        <Text style={NormalChoiceDialogContainerStyles.normal_text}>
                            {this.props.items[i].itemShow ? this.props.items[i].itemShow : ''}
                        </Text>
                    </TouchableOpacity>
                );
            }
        }
        return pages;
    }

    render() {
        return (
            <TouchableOpacity style={NormalChoiceDialogContainerStyles.root}
                              onPress={this.props.hide}>
                <View style={NormalChoiceDialogContainerStyles.container}>
                    <View onPress={this.props.hide}
                          style={NormalChoiceDialogContainerStyles.container_view}
                    >
                        <Text style={[NormalChoiceDialogContainerStyles.normal_text, {
                            fontSize: 20,
                            fontWeight: 'bold',
                        }]}>{this.props.title ? this.props.title : ''}</Text>
                    </View>
                    {/*动态插入View*/}
                    {this.props.items ?
                        this._getItems().map((itemView, index) => {
                            // console.warn(index + '');
                            return itemView;
                        })
                        : <View/>
                    }

                </View>
            </TouchableOpacity>
        );
    }
}


NormalChoiceDialogContainerStyles = StyleSheet.create({
    root: {
        position: 'absolute',
        width: width,
        height: height,
        backgroundColor: 'rgba(0, 0, 0, 0.56)',
        flexDirection: 'row',
        justifyContent: 'center',
        alignItems: 'center',
    },
    container: {
        flex: 1,
        flexDirection: 'column',
        justifyContent: 'center',
        alignItems: 'flex-start',
        margin: 9.6 * 6,
        padding: 19.2,
        backgroundColor: '#FFFFFF',
        borderRadius: 2.4,
        borderWidth: 1,
        borderColor: '#FFFFFF',
    },
    container_view: {
        height: 56,
        minWidth: 196,
        flexDirection: 'column',
        justifyContent: 'center',
        alignItems: 'flex-start',
    },
    cut_line: {
        height: 2,
        backgroundColor: '#FBFBFB',
    },
    normal_text: {
        fontSize: 16,
    }
});
