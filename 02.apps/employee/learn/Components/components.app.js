import {StackNavigator} from 'react-navigation';

import HomeScreen from './components.screen.home'
import ActivityIndicatorScreen from './ActivityIndicator/components.screen.activityIndicator'
import ButtonScreen from './Button/components.screen.button'
import DatePickerIOSScreen from './DatePickerIOS/components.screen.datePickerIOS'
import DrawerLayoutAndroidScreen from './DrawerLayoutAndroid/components.screen.drawerLayoutAndroid'
import FlatListScreen from './FlatList/components.screen.flatList'


export default ComponentsSimpleApp = StackNavigator({
    HomeScreen: {screen: HomeScreen},
    ActivityIndicatorScreen: {screen: ActivityIndicatorScreen},
    ButtonScreen: {screen: ButtonScreen},
    DatePickerIOSScreen: {screen: DatePickerIOSScreen},
    DrawerLayoutAndroidScreen: {screen: DrawerLayoutAndroidScreen},
    FlatListScreen: {screen: FlatListScreen},
});

