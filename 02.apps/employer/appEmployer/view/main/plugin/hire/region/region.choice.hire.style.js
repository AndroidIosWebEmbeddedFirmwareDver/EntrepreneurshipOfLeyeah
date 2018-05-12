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


export default regionChoiceStyles = StyleSheet.create({
    //基于flex-box布局
    container: {
        flex: 1,
        width: width,
        height: height,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FBFBFB',
    },
    listHeaderContainer: {
        height: 56,
        flexDirection: 'row',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FFCC33',
        // backgroundColor: '#448aff',
        justifyContent: 'center',
        alignItems: 'center',
    },
    listHeaderContainerView: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
    },
    listContainer: {
        flex: 1,
        flexDirection: 'row',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FFFFFF',
    },
    listContainerView: {
        flex: 1,
    },
    itemContainer: {
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FFFFFF',
        alignItems: 'center',
    },
    itemHeadContainer: {
        flex: 1,
        flexDirection: 'row',//row ,row-reverse ,column ('default') column-reverse
        height: 56,
        // backgroundColor: '#FFFFFF',
        alignItems: 'center',
    },
    itemHeadContainerLeft: {
        flex: 1,
        // backgroundColor: '#FFFFFF',
        alignItems: 'center',
        fontSize: 16,
        paddingLeft: 9.6,
        paddingRight: 9.6,
    },
    itemBottomContainer: {
        width: width,
        height: 2.4,
        backgroundColor: '#FBFBFB',
    }

});