import React, {
    Component,
} from 'react';
import {
    View
} from 'react-native';
import RootSiblings from '../rootSiblings/SiblingsManager';
import ToastContainer, {positions, durations} from './ToastContainer';


//how to useage ,go to
// https://github.com/magicismight/react-native-root-toast/blob/master/Example/main.js
class Toast extends Component {
    static displayName = 'Toast';
    static propTypes = ToastContainer.propTypes;
    static positions = positions;
    static durations = durations;

    static show = (message, options = {position: positions.BOTTOM, duration: durations.SHORT}) => {
        return new RootSiblings(<ToastContainer
            {...options}
            visible={true}
        >
            {message}
        </ToastContainer>);
    };

    static hide = toast => {
        if (toast instanceof RootSiblings) {
            toast.destroy();
        } else {
            console.warn(`Toast.hide expected a \`RootSiblings\` instance as argument.\nBut got \`${typeof toast}\` instead.`);
        }
    };

    _toast = null;

    componentWillMount = () => {
        this._toast = new RootSiblings(<ToastContainer
            {...this.props}
            duration={0}
        />);
    };

    componentWillReceiveProps = nextProps => {
        this._toast.update(<ToastContainer
            {...nextProps}
            duration={0}
        />);
    };

    componentWillUnmount = () => {
        this._toast.destroy();
    };

    render() {
        return null;
    }
}

export {
    RootSiblings as Manager
};
export default Toast;