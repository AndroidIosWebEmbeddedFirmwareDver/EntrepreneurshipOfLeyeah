import {DrawerNavigator} from 'react-navigation';

import HomeScreen from './drawerNavigator.screen.home'
import NotificationScreen from './drawerNavigator.screen.notification'
import LocationScreen from './drawerNavigator.screen.location'
import AboutScreen from './drawerNavigator.screen.about'


export default DrawerNavigatorSimpleApp = DrawerNavigator({
    HomeScreen: {
        screen: HomeScreen,
    },
    LocationScreen: {
        screen: LocationScreen,
    },
    NotificationScreen: {
        screen: NotificationScreen,
    },
    AboutScreen: {
        screen: AboutScreen,
    },
});
