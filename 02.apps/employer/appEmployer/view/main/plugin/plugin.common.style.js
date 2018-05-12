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


export default styles = StyleSheet.create({
    //基于flex-box布局
    container: {
        flex: 1,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FBFBFB',
    },

});