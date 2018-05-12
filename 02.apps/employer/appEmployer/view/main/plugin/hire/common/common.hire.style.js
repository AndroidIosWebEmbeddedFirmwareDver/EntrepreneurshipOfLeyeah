import
{
    StyleSheet,
    Dimensions,
    Platform,
    PixelRatio,
}
    from
        'react-native';

const {
    width,
    height
} = Dimensions.get('window');


export default CommonHireStyles = StyleSheet.create({
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
        marginLeft: 9.6,
        fontSize: 16,
    },
    itemHeadContainerRight: {
        backgroundColor: '#FFFFFF',
        alignItems: 'center',
        marginRight: 9.6,
    },
    itemBottomContainer: {
        width: width,
        height: 2.4,
        backgroundColor: '#FBFBFB',
    }
});