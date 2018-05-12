import React from 'react';

import {PermissionsAndroid} from 'react-native';


export default class PermissionAndroidCommonUtil {

    static androidPermissions = {
        READ_CALENDAR: {
            key: 'READ_CALENDAR',
            value: 'android.permission.READ_CALENDAR',
            pis: PermissionsAndroid.PERMISSIONS.READ_CALENDAR,
            show: '读取日历'
        },
        WRITE_CALENDAR: {
            key: 'WRITE_CALENDAR',
            value: 'android.permission.WRITE_CALENDAR',
            pis: PermissionsAndroid.PERMISSIONS.WRITE_CALENDAR,
            show: '写入日历'
        },
        CAMERA: {
            key: 'CAMERA',
            value: 'android.permission.CAMERA',
            pis: PermissionsAndroid.PERMISSIONS.CAMERA,
            show: '相机'
        },
        READ_CONTACTS: {
            key: 'READ_CONTACTS',
            value: 'android.permission.READ_CONTACTS',
            pis: PermissionsAndroid.PERMISSIONS.READ_CONTACTS,
            show: '读取联系人'
        },
        WRITE_CONTACTS: {
            key: 'WRITE_CONTACTS',
            value: 'android.permission.WRITE_CONTACTS',
            pis: PermissionsAndroid.PERMISSIONS.WRITE_CONTACTS,
            show: '写入联系人'
        },
        GET_ACCOUNTS: {
            key: 'GET_ACCOUNTS',
            value: 'android.permission.GET_ACCOUNTS',
            pis: PermissionsAndroid.PERMISSIONS.GET_ACCOUNTS,
            show: '获取账号'
        },
        ACCESS_FINE_LOCATION: {
            key: 'ACCESS_FINE_LOCATION',
            value: 'android.permission.ACCESS_FINE_LOCATION',
            pis: PermissionsAndroid.PERMISSIONS.ACCESS_FINE_LOCATION,
            show: '使用位置'
        },
        ACCESS_COARSE_LOCATION: {
            key: 'ACCESS_COARSE_LOCATION',
            value: 'android.permission.ACCESS_COARSE_LOCATION',
            pis: PermissionsAndroid.PERMISSIONS.ACCESS_COARSE_LOCATION,
            show: '定位'
        },

        RECORD_AUDIO: {
            key: 'RECORD_AUDIO',
            value: 'android.permission.RECORD_AUDIO',
            pis: PermissionsAndroid.PERMISSIONS.RECORD_AUDIO,
            show: '录音'
        },
        READ_PHONE_STATE: {
            key: 'READ_PHONE_STATE',
            value: 'android.permission.READ_PHONE_STATE',
            pis: PermissionsAndroid.PERMISSIONS.READ_PHONE_STATE,
            show: '读取手机状态'
        },
        CALL_PHONE: {
            key: 'CALL_PHONE',
            value: 'android.permission.CALL_PHONE',
            pis: PermissionsAndroid.PERMISSIONS.CALL_PHONE,
            show: '拨打电话'
        },
        READ_CALL_LOG: {
            key: 'READ_CALL_LOG',
            value: 'android.permission.READ_CALL_LOG',
            pis: PermissionsAndroid.PERMISSIONS.READ_CALL_LOG,
            show: '读取通话记录'
        },
        WRITE_CALL_LOG: {
            key: 'WRITE_CALL_LOG',
            value: 'android.permission.WRITE_CALL_LOG',
            pis: PermissionsAndroid.PERMISSIONS.WRITE_CALL_LOG,
            show: '写入通话记录'
        },
        ADD_VOICEMAIL: {
            key: 'ADD_VOICEMAIL',
            value: 'com.android.voicemail.permission.ADD_VOICEMAIL',
            pis: PermissionsAndroid.PERMISSIONS.ADD_VOICEMAIL,
            show: '发送语音消息'
        },
        USE_SIP: {
            key: 'USE_SIP', value: 'android.permission.USE_SIP',
            pis: PermissionsAndroid.PERMISSIONS.USE_SIP, show: 'SIP'
        },
        PROCESS_OUTGOING_CALLS: {
            key: 'PROCESS_OUTGOING_CALLS',
            value: 'android.permission.PROCESS_OUTGOING_CALLS',
            pis: PermissionsAndroid.PERMISSIONS.PROCESS_OUTGOING_CALLS,
            show: ''
        },
        BODY_SENSORS: {
            key: 'BODY_SENSORS', value: 'android.permission.BODY_SENSORS',
            pis: PermissionsAndroid.PERMISSIONS.BODY_SENSORS, show: ''
        },
        SEND_SMS: {
            key: 'SEND_SMS', value: 'android.permission.SEND_SMS',
            pis: PermissionsAndroid.PERMISSIONS.SEND_SMS, show: '发送短信'
        },
        RECEIVE_SMS: {
            key: 'RECEIVE_SMS',
            value: 'android.permission.RECEIVE_SMS',
            pis: PermissionsAndroid.PERMISSIONS.RECEIVE_SMS,
            show: '收取短信'
        },
        READ_SMS: {
            key: 'READ_SMS', value: 'android.permission.READ_SMS',
            pis: PermissionsAndroid.PERMISSIONS.READ_SMS, show: '读取短信'
        },
        RECEIVE_WAP_PUSH: {
            key: 'RECEIVE_WAP_PUSH',
            value: 'android.permission.RECEIVE_WAP_PUSH',
            pis: PermissionsAndroid.PERMISSIONS.RECEIVE_WAP_PUSH,
            show: ''
        },
        RECEIVE_MMS: {
            key: 'RECEIVE_MMS',
            value: 'android.permission.RECEIVE_MMS',
            pis: PermissionsAndroid.PERMISSIONS.RECEIVE_MMS,
            show: ''
        },
        READ_EXTERNAL_STORAGE: {
            key: 'READ_EXTERNAL_STORAGE',
            value: 'android.permission.READ_EXTERNAL_STORAGE',
            pis: PermissionsAndroid.PERMISSIONS.READ_EXTERNAL_STORAGE,
            show: '读取SD卡'
        },
        WRITE_EXTERNAL_STORAGE: {
            key: 'WRITE_EXTERNAL_STORAGE',
            value: 'android.permission.WRITE_EXTERNAL_STORAGE',
            pis: PermissionsAndroid.PERMISSIONS.WRITE_EXTERNAL_STORAGE,
            show: '写入SD卡'
        },

    };


    static  _checkPermission = async (permission) => {
        try {
            let result = await PermissionsAndroid.check(permission.pis);
            if (result === PermissionsAndroid.RESULTS.GRANTED) {
                console.log("permission granted");
                return true;
            } else {
                console.log("permission denied");
                return false;
            }
        } catch (err) {
            console.warn(err)
        }
    };


    static _requestPermission = async (permission) => {
        try {
            const result = await
                PermissionsAndroid.request(
                    // PermissionsAndroid.PERMISSIONS.CAMERA,
                    permission.pis,
                    {
                        title: '权限请求',
                        message:
                        '该应用需要如下权限 ' + permission.show +
                        ' 请授权!'
                    }
                );
            if (result === PermissionsAndroid.RESULTS.GRANTED) {
                console.log("permission granted");
                return true;
            } else {
                console.log("permission denied");
                return false;
            }
        } catch (err) {
            console.warn(err)
        }
    }

}


