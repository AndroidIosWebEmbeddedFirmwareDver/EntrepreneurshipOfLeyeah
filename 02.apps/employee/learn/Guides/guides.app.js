import {StackNavigator} from 'react-navigation';

import HomeScreen from './guides.screen.home'
import FadeInViewScreen from './Animated/guides.screen.animated.fadeIn'
import UIManagerScreen from './Animated/guides.screen.animated.uiManager'
import AccessibleScreen from './Accessibility/guides.screen.accessibility.accessible'
import TimerScreen from './Timers/guides.screen.timers.timer'
import CompositeComponentsScreen from './DirectManipulation/guides.screen.directManipulation.composite'
import SetNativePropsScreen from './DirectManipulation/guides.screen.directManipulation.setNativeProps'


export default GuidesSimpleApp = StackNavigator({
    HomeScreen: {screen: HomeScreen},
    FadeInViewScreen: {screen: FadeInViewScreen},
    UIManagerScreen: {screen: UIManagerScreen},
    AccessibleScreen: {screen: AccessibleScreen},
    TimerScreen: {screen: TimerScreen},
    CompositeComponentsScreen: {screen: CompositeComponentsScreen},
    SetNativePropsScreen: {screen: SetNativePropsScreen},
});

