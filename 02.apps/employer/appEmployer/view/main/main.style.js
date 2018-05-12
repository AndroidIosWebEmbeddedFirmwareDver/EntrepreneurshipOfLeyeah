import {
    StyleSheet,
    Platform,
    PixelRatio,
} from 'react-native';

export default styles = StyleSheet.create({

    container: {
        flex: 1,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FBFBFB'
    },
    header: {
        flex: 3,
        backgroundColor: '#FFCC33',
        justifyContent: 'center',// 内容居中
        padding: 9.6,

    },
    headerItem: {
        flex: 1,
        flexDirection: 'column',
        marginTop: (Platform.OS === 'ios' ? 20 : 0),
    },
    headerItemItem: {
        flex: 1,
        height: 76,
        flexDirection: 'column',
        marginLeft: 9.6,
        marginRight: 9.6,
        backgroundColor: '#ffffff',
        borderColor: '#f0f0f0',
        borderRadius: 9.6,
        borderWidth: (Platform.OS === 'ios' ? 1.0 : 1.5) / PixelRatio.get(),
    },

    bodyer: {
        flex: 5,
        paddingBottom: 9.6,
        backgroundColor: '#f0f0f0',
    },
    bodyerItem: {
        flex: 1,
        flexDirection: 'row',
        marginLeft: 9.6,
        marginTop: 9.6,
        marginRight: 9.6,
        padding: 4.8,
        backgroundColor: '#ffffff',
        borderColor: '#f0f0f0',
        borderRadius: 9.6,
        borderWidth: (Platform.OS === 'ios' ? 1.0 : 1.5) / PixelRatio.get(),
    },
    bodyerItemItem: {
        flex: 1,
        height: 56,
        flexDirection: 'column',
        justifyContent: 'center',// 内容居中
        // backgroundColor: '#eeeeee',
        borderColor: '#f0f0f0',
        margin: 2.4,
    },
    bodyerItemRightItem: {
        flex: 1,
        height: 56,
        flexDirection: 'row',
        justifyContent: 'flex-end',
        alignItems: 'center',
        margin: 2.4,
    },

    welcome: {
        fontSize: 20,
        textAlign: 'center',
        margin: 10,
    },
    instructions: {
        textAlign: 'center',
        color: '#333333',
        marginBottom: 5,
    },
    text: {
        fontSize: 18,
        padding: 9.6,
    },
    normalView: {
        padding: 9.6,
        margin: 9.6,
    },
});



