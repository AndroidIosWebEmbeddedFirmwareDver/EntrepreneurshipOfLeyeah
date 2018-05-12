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
    ActivityIndicator,
} from 'react-native';

const {
    width,
    height
} = Dimensions.get('window');

export default class NormalLoadingDialogContainer extends PureComponent {

    _hide = (itemOnpressCllback) => {
        if (this.props.hide) {
            this.props.hide();
        }
        if (itemOnpressCllback) {
            itemOnpressCllback();
        }
    };

    render() {
        return (
            <TouchableOpacity style={NormalLoadingDialogContainerStyles.root}
                              onPress={this.props.hide}>
                <View style={NormalLoadingDialogContainerStyles.container}>

                    <ActivityIndicator
                        size={'small'}//'small', 'large'
                        color={'#000000'}
                    />

                    <Text style={[NormalLoadingDialogContainerStyles.normal_text, {
                        // fontSize: 20,
                        // fontWeight: 'bold',
                        marginLeft: 19.2,
                    }]}>{this.props.title ? this.props.title : 'Loading...'}</Text>
                </View>
            </TouchableOpacity>
        );
    }
}


NormalLoadingDialogContainerStyles = StyleSheet.create({
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
        flexDirection: 'row',
        justifyContent: 'center',
        alignItems: 'center',
        margin: 9.6 * 6,
        padding: 19.2,
        backgroundColor: '#FFFFFF',
        borderRadius: 2.4,
        borderWidth: 1,
        borderColor: '#FFFFFF',
    },
    container_view: {
        height: 56,
        flexDirection: 'column',
        justifyContent: 'center',
        alignItems: 'center',
    },
    cut_line: {
        height: 2,
        backgroundColor: '#FBFBFB',
    },
    normal_text: {
        color: '#000000',
        fontSize: 16,
    }
});
