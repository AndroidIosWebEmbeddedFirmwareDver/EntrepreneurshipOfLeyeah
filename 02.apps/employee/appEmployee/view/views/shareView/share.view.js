import React, {PureComponent} from 'react'

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
    PixelRatio,
} from 'react-native';


class ShareView extends PureComponent {

    constructor(props) {
        super(props);
        this.state = {
            animationType: 'none',//none slide fade
            modalVisible: false,//模态场景是否可见
            transparent: true,//是否透明显示
        };
    }

    //1.Component即将加载
    componentWillMount() {

    }

    //2.Component加载完毕
    componentDidMount() {

    }

    _setModalVisible = (visible) => {
        this.setState({modalVisible: visible});
    }

    startShow = () => {
    }


    render() {
        let modalBackgroundStyle = {
            backgroundColor: this.state.transparent ? 'rgba(0, 0, 0, 0.5)' : 'red',
        };
        let innerContainerTransparentStyle = this.state.transparent
            ? {backgroundColor: '#fff', padding: 20}
            : null;

        return (

            <View style={{alignItems: 'center', flex: 1}}>

                <Modal
                    animationType={this.state.animationType}
                    transparent={this.state.transparent}
                    visible={this.state.modalVisible}
                    onRequestClose={() => {
                        this._setModalVisible(false)
                    }}
                    onShow={this.startShow}
                >
                    <TouchableOpacity
                        style={[styles.container, modalBackgroundStyle]}
                        onPress={this._setModalVisible.bind(this, false)}
                    >
                        {/*固定背景*/}
                        <TouchableOpacity
                            style={[styles.innerContainer, innerContainerTransparentStyle]}
                            onPress={() => {
                            }}
                        >
                            {/*固定内容*/}

                            <View style={styles.itemView}>
                                <Text style={{fontSize: 18}}>选择分享方式</Text>
                            </View>

                            <View style={styles.itemView}>
                                <TouchableOpacity
                                    style={styles.item}
                                    onPress={() => {
                                    }}
                                >
                                    <Image resizeMode='contain' style={styles.image}
                                           source={require('../../../resource/image/ic_share_weixin.png')}/>
                                    <Text>微信好友</Text>
                                </TouchableOpacity>
                                <TouchableOpacity
                                    style={styles.item}
                                    onPress={() => {
                                    }}
                                >
                                    <Image resizeMode='contain' style={styles.image}
                                           source={require('../../../resource/image/ic_share_weibo.png')}/>
                                    <Text>新浪微博</Text>
                                </TouchableOpacity>
                            </View>
                        </TouchableOpacity>
                    </TouchableOpacity>
                </Modal>
            </View>
        );
    }


}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        justifyContent: 'flex-end',
    },
    innerContainer: {
        flexDirection: 'column',
        justifyContent: 'center',
        alignItems: 'center',
    },
    itemView: {
        height: 36,
        flexDirection: 'row',
        margin: 9.6
    },
    item: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        marginBottom: 20,
    },
    image: {
        width: 36,
        height: 36,
    }
});


export default ShareView;