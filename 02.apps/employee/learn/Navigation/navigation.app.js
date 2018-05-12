import {StackNavigator} from 'react-navigation';

import HomeScreen from './navigation.screen.home'
import ChatScreen from './navigation.screen.chat'


export default  StackNavigatorSimpleApp = StackNavigator({
    HomeScreen: { screen: HomeScreen },
    ChatScreen: { screen: ChatScreen },
});
