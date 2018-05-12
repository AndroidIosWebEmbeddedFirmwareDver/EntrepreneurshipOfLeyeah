import React from 'react';

import {
    Alert,
} from 'react-native'

import Toast from './Toast'
import ToastContainer, {positions, durations} from './ToastContainer';


let toast;
export default class ToastManager {

    static  POSITION = positions;
    static  DURATION = durations;

    static show(msg: string, duration, position) {
        if (toast) {
            Toast.hide(toast);
        }
        // Add a Toast on screen.
        toast = Toast.show(msg, {
            duration: duration,
            position: position,
            shadow: true,
            animation: true,
            hideOnPress: true,
            delay: 0,
            onShow: () => {
                // calls on toast\`s appear animation start
            },
            onShown: () => {
                // calls on toast\`s appear animation end.
            },
            onHide: () => {
                // calls on toast\`s hide animation start.
            },
            onHidden: () => {
                // calls on toast\`s hide animation end.
            }
        });
    }


    static alertWithSure(title: string, msg: string, callback: Function) {
        Alert.alert(
            title,
            msg,
            [{
                text: '确定', onPress: callback ? callback : () => {
                }
            },],
            {
                cancelable: false, onDismiss: () => {
            }
            }
        );
    }

    static alertDialog(title: string, msg: string, sureShow: string, sureCallback: Function, canlcleShow: string, canlcleCallback: Function) {
        Alert.alert(
            title,
            msg,
            [
                {
                    text: sureShow ? sureShow : '确定', onPress: sureCallback ? sureCallback : () => {
                }
                },
                {
                    text: canlcleShow ? canlcleShow : '取消',
                    onPress: canlcleCallback ? canlcleCallback : () => {
                    }
                },
            ],
            {
                cancelable: false, onDismiss: () => {
            }
            }
        );
    }

}