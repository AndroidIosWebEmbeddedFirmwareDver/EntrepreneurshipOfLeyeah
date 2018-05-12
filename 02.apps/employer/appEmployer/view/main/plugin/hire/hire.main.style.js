import {
    StyleSheet
} from 'react-native';

export default hireStyles = StyleSheet.create({
    container: {
        width: window.width,
        flexDirection: 'row',
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: '#F5FCFF',
    },
    top: {
        width: window.width,
        height: 56,
        flexDirection: 'row',
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: '#FFFFFF',
    },
    itemLeftText: {
        flex: 1,
        fontSize: 16,
        padding: 9.6,
    },
    itemRightView: {
        flex: 2,
        flexDirection: 'row',
        justifyContent: 'flex-end',
        alignItems: 'center',
    },
    itemRightInView: {
        flex: 1,
        flexDirection: 'row',
        justifyContent: 'flex-end',
        alignItems: 'center',
    },
    itemRightInViewText: {
        flex: 1,
        flexDirection: 'row',
        justifyContent: 'flex-end',
        alignItems: 'center',
        fontSize: 16,
    },
    itemBotomView: {
        width: window.width,
        backgroundColor: 'transparent',
    },
    bottomView: {
        width: window.width,
        height:56,
        flexDirection: 'row',
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: '#FFCC33',
    },
    bottomItemView: {
        flex: 1,
        height:56,
        justifyContent: 'center',
        alignItems: 'center',
    },
    bottomItemViewText:{
        fontSize: 16,
        color:'#FFFFFF',
    },
});

