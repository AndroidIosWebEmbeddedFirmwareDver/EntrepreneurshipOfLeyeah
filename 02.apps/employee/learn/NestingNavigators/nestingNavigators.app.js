import {TabNavigator, StackNavigator} from "react-navigation";

import RecentChatsScreen from './nestingNavigators.screen.recentChats'
import AllContactsScreen from './nestingNavigators.screen.allContacts'

import ChartScreen from './nestingNavigators.screen.chart'


const MainScreenNavigator = TabNavigator({
    Recent: {screen: RecentChatsScreen},
    All: {screen: AllContactsScreen},
});
export default NestingNavigatorSimpleApp = StackNavigator({
    Home: {
        screen: MainScreenNavigator,
        navigationOptions: {
            title: 'My Chats',
        },
    },
    Chat: {screen: ChartScreen},
});

//normal
const SimpleApp = TabNavigator({
    Recent: {screen: RecentChatsScreen},
    All: {screen: AllContactsScreen},
});