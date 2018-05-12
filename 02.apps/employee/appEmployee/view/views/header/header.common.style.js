import {
    StyleSheet,
    Dimensions,
    Platform,
    PixelRatio,
} from 'react-native';

const {
    width,
    height
} = Dimensions.get('window');


export default styles = StyleSheet.create({
    headerContainer: {
        width: width,
        height: (Platform.OS === 'ios' ? 48 + 20 : 48),
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#ffffff',
    },
    headerHeader: {
        width: (Platform.OS === 'ios' ? width : 0),
        height: (Platform.OS === 'ios' ? 20 : 0),
    },
    headerBody: {
        flexDirection: 'row',//row ,row-reverse ,column ('default') column-reverse
        width: width,
        height: 48,
    },
    headerLeftContainer: {
        flex: 1,
        flexDirection: 'row',//row ,row-reverse ,column ('default') column-reverse
        justifyContent: 'flex-start',// flex-start flex-end center space-between space-around
        alignItems: 'center',
    },
    headerCenterContainer: {
        flex: 1,
        flexDirection: 'row',//row ,row-reverse ,column ('default') column-reverse
        justifyContent: 'center',
        alignItems: 'center',
    },
    headerRightContainer: {
        flex: 1,
        flexDirection: 'row',//row ,row-reverse ,column ('default') column-reverse
        justifyContent: 'flex-end',
        alignItems: 'center',
    },
    headertext: {
        fontSize: 16,
        marginRight: 9.6,
    },
    headericon: {
        marginLeft: 9.6,
        width: 24,
        height: 24,
    },
});

