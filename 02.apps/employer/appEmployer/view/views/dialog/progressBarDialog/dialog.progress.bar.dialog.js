import React, {
    PropTypes,
    PureComponent
} from 'react';
import {
    View,
    StyleSheet,
    Modal,
    Text,
    Dimensions,
    TouchableOpacity
} from 'react-native';
import Bar from './bar.progress.bar.dialog';

const {
    width
} = Dimensions.get('window');

class ProgressBarDialog extends PureComponent {

    constructor(props) {
        super(props);
    }

    //2.Component加载完毕
    componentDidMount() {

    }

    static propTypes = {
        ...Modal.propTypes,
        title: PropTypes.string,
        canclePress: PropTypes.func,
        cancleText: PropTypes.string,
        needCancle: PropTypes.bool
    };

    static defaultProps = {
        animationType: 'none',
        transparent: true,
        progressModalVisible: false,
        onShow: () => {
        },
        onRequestClose: () => {
        },
        onOutSidePress: () => {
        },
        title: '上传文件',
        cancleText: '取消是',
        canclePress: () => {
        },
        needCancle: true
    }

    render() {
        const {
            animationType,
            transparent,
            onRequestClose,
            progress,
            title,
            canclePress,
            cancleText,
            needCancle,
            progressModalVisible
        } = this.props;
        return (
            <Modal
                animationType={animationType}
                transparent={transparent}
                visible={progressModalVisible}
                onRequestClose={onRequestClose}>
                <View style={styles.progressBarView}>
                    <View style={styles.subView}>
                        <Text style={styles.title}>
                            {title}
                        </Text>
                        <Bar
                            ref={this.refBar}
                            style={{marginLeft: 10, marginRight: 10, width: width - 80}}
                            progress={progress}
                            backgroundStyle={styles.barBackgroundStyle}
                        />
                        <View style={styles.progressContainer}>
                            <Text style={styles.progressLeftText}>
                                {`${progress}`}%
                            </Text>
                            <Text style={styles.progressRightText}>
                                {`${progress}`}/100
                            </Text>
                        </View>
                        {needCancle &&
                        <View style={styles.cancleContainer}>
                            <TouchableOpacity style={styles.cancleButton} onPress={canclePress}>
                                <Text style={styles.cancleText}>
                                    {cancleText}
                                </Text>
                            </TouchableOpacity>
                        </View>
                        }
                    </View>
                </View>
            </Modal>
        );
    }
}

const styles = StyleSheet.create({
    progressBarView: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: 'rgba(0,0,0,0.2)'
    },
    barStyle: {
        marginLeft: 10,
        marginRight: 10,
        width: width - 80
    },
    progressLeftText: {
        fontSize: 14
    },
    cancleContainer: {
        justifyContent: 'center',
        alignItems: 'flex-end'
    },
    progressRightText: {
        fontSize: 14,
        color: '#666666'
    },
    barBackgroundStyle: {
        backgroundColor: '#cccccc'
    },
    progressContainer: {
        flexDirection: 'row',
        padding: 10,
        justifyContent: 'space-between'
    },
    subView: {
        marginLeft: 30,
        marginRight: 30,
        backgroundColor: '#fff',
        alignSelf: 'stretch',
        justifyContent: 'center'
    },
    progressView: {
        flexDirection: 'row',
        padding: 10,
        paddingBottom: 5,
        justifyContent: 'space-between'
    },
    title: {
        textAlign: 'left',
        padding: 10,
        fontSize: 16
    },
    cancleButton: {
        padding: 10
    },
    cancleText: {
        textAlign: 'right',
        paddingTop: 0,
        fontSize: 16,
        color: 'rgba(0, 122, 255, 1)'
    }
});

export default ProgressBarDialog;


/*
props
modal的props - 这些都是modal的属性
animationType - 动画类型
transparent - 是否透明
progressModalVisible - 是否可见
onShow - 弹框出现
onRequestClose - 弹框请求消失(比如安卓按返回键会触发这个方法)
onOutSidePress - 点击弹框外部动作
title - 弹框的标题
cancleText - 取消的文字
canclePress - 取消动作
needCancle - 是否需要取消按钮
 */