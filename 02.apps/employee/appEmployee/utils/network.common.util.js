import React from 'react';

import ToastManager from './toast/Toast.util'

import Base64 from '../utils/base64/base64'

import RNFetchBlob from 'react-native-fetch-blob'

import {
    Platform,
} from 'react-native'

export default class NetworkCommonUtil {

    // 处理状态
    static SERVER_HTTP_TASK_STATUS_SUCCESS = 1001;
    static SERVER_HTTP_TASK_STATUS_ERROR = 1002;
    // static SERVERURL = 'http://127.0.0.1:8080'; // 服务端URL
    // static SERVERURL = 'http://47.90.72.19:8808/leyeah'; // 服务端URL
    static SERVERURL = 'http://120.78.189.94:8808/leyeah'; // 服务端URL
    static SERVERURL_SYS_WORK_HOME = NetworkCommonUtil.SERVERURL + '/api/sys/work/home';
    static SERVERURL_SYS_WORK_HOME_LOGIN = NetworkCommonUtil.SERVERURL + '/api/sys/work/home/login';
    //查询工种字典
    static SERVERURL_SYS_WORK_TYPE = NetworkCommonUtil.SERVERURL + '/api/sys/work/woker/type';
    //查询自我擅长字典
    static SERVERURL_API_MOBILE_USER_RESUME_GOODATS_QUERYALL = NetworkCommonUtil.SERVERURL + '/api/mobile/user/resume/goodats/queryall';
    //查询自我评价字典
    static SERVERURL_API_MOBILE_USER_RESUME_SELFSVALS_QUERYALL = NetworkCommonUtil.SERVERURL + '/api/mobile/user/resume/selefevals/queryall';

    static SERVERURL_SYS_WORK_TYPE_DELETE = NetworkCommonUtil.SERVERURL + '/api/sys/work/woker/type/delete';
    static SERVERURL_SYS_WORK_TYPE_UPDATE = NetworkCommonUtil.SERVERURL + '/api/sys/work/woker/type/update';
    static SERVERURL_SYS_WORK_TYPE_CREATE = NetworkCommonUtil.SERVERURL + '/api/sys/work/woker/type/create';
    static SERVERURL_SANFANG_FULI_MEINV = NetworkCommonUtil.SERVERURL + '/sanfang/tianapi/meinv';

    //地理位置查询
    static SERVERURL_SYS_REGION_PROVINCE = NetworkCommonUtil.SERVERURL + '/api/sys/region/province';
    static SERVERURL_SYS_REGION_CITY = NetworkCommonUtil.SERVERURL + '/api/sys/region/city';
    static SERVERURL_SYS_REGION_AREAANDCOUNTY = NetworkCommonUtil.SERVERURL + '/api/sys/region/areaAndCounty';

    //system
    //登录&注册
    static SERVERURL_SYS_USER_LOGIN = NetworkCommonUtil.SERVERURL + '/api/mobile/user/login';
    static SERVERURL_SYS_USER_UPDATE_AVATER = NetworkCommonUtil.SERVERURL + '/api/mobile/user/update/avater';
    static SERVERURL_SYS_USER_UPDATE_NAME = NetworkCommonUtil.SERVERURL + '/api/mobile/user/update/name';
    static SERVERURL_SYS_USER_UPDATE_PHONE = NetworkCommonUtil.SERVERURL + '/api/mobile/user/update/phone';
    static SERVERURL_SYS_USER_UPDATE_REGION = NetworkCommonUtil.SERVERURL + '/api/mobile/user/update/region';


    //简历
    //更新工种
    static SERVERURL_SYS_POST_USER_RESUME_UPDATE_WORKTYPES = NetworkCommonUtil.SERVERURL + '/api/mobile/user/resume/update/weorkTypes';
    //更新工作经验
    static SERVERURL_SYS_POST_USER_RESUME_UPDATE_WORKEXPERIENCE = NetworkCommonUtil.SERVERURL + '/api/mobile/user/resume/update/experience';
    //更新擅长
    static SERVERURL_SYS_POST_USER_RESUME_UPDATE_WORKGOODATS = NetworkCommonUtil.SERVERURL + '/api/mobile/user/resume/update/workGoodAts';
    //更新自我评价
    static SERVERURL_SYS_POST_USER_RESUME_UPDATE_WORKSELFEVALS = NetworkCommonUtil.SERVERURL + '/api/mobile/user/resume/update/workSelfEvals';

    //实名认证

    //提交实名
    static SERVERURL_API_MOBILE_USER_RNA_CREATE = NetworkCommonUtil.SERVERURL + '/api/mobile/user/rna/create';


    //订单
    //订单中对经验的要求
    static SERVERURL_SYS_ORDER_EXPRERIENCEREQUIRETYPE_QUERYALL_GET = NetworkCommonUtil.SERVERURL + '/api/mobile/order/experienceRequireType/queryAll';
    static SERVERURL_SYS_ORDER_CREATE_POST = NetworkCommonUtil.SERVERURL + '/api/mobile/order/create';

    static  hadLogined = 0; // 0-未登录、1-已经登录


    //------------------------------------------ee---------

    //查询排序类型
    static SERVERURL_GET_ORDER_SORTTYPE = NetworkCommonUtil.SERVERURL + '/api/mobile/order/sorttype/queryAll';
    //查询工作
    static SERVERURL_POST_ORDER_FINDWORK_BY_SORTTYPE = NetworkCommonUtil.SERVERURL + '/api/mobile/order/findWorkBySortType';//查询工作
    //查询BANAR
    static SERVERURL_POST_API_SYS_MOBILR_APP_BANAR_QUERY_ALL = NetworkCommonUtil.SERVERURL + '/api/sys/mobile/app/banar/query/all';//查询工作
    //发送简历
    static SERVERURL_POST_ORDER_RESUME_SENDRESUME = NetworkCommonUtil.SERVERURL + '/api/mobile/order/resume/sendResume';//发送简历
    //查询我是否已经收藏此订单
    static SERVERURL_POST_ORDER_LOVE_QUERY_ISMELOVETHISORDER = NetworkCommonUtil.SERVERURL + '/api/mobile/order/love/query/isMeLoveThisOder';
    //收藏订单
    static SERVERURL_POST_ORDER_LOVE_CREATE = NetworkCommonUtil.SERVERURL + '/api/mobile/order/love/create';
    //查询我的所有收藏订单
    static SERVERURL_POST_ORDER_LOVE_QUERY_ALLMELOVEORDERS = NetworkCommonUtil.SERVERURL + '/api/mobile/order/love/query/allmeloveoders';
    //查询是否已经投递简历
    static SERVERURL_POST_ORDER_RESUME_IS_SENDRESUME = NetworkCommonUtil.SERVERURL + '/api/mobile/order/resume/queryIsSendedResume';

    //查询我的工作
    //查询我的紧急工作
    //查询我的投递工作
    //查询我的被聘工作
    static SERVERURL_POST_ORDER_FIND_WORK_FOR_EMPLOYEE_BY_PUSHTYPE_WITH_PARAMS_FOR_PAGE = NetworkCommonUtil.SERVERURL + '/api/mobile/order/page/query/findWorkForEmployeeByPushType';
    static SERVERURL_POST_ORDER_FIND_WORK_FOR_EMPLOYEE_BY_PUSHTYPE = NetworkCommonUtil.SERVERURL + '/api/mobile/order/findWorkForEmployeeByPushType';

    //修改----------------
    //修改雇员开工状态
    static SERVERURL_POST_ORDER_FOR_EMPLOYEE_CHANGE_EMPLOYEE_WORK_START_STATUS = NetworkCommonUtil.SERVERURL + '/api/mobile/order/for/emplpyee/changeEmployeeWorkStartStatus';
    //修改雇员下工状态
    static SERVERURL_POST_ORDER_FOR_EMPLOYEE_CHANGE_EMPLOYEE_WORK_END_STATUS = NetworkCommonUtil.SERVERURL + '/api/mobile/order/for/emplpyee/changeEmployeeWorkEndStatus';
    //修改雇员确定收款状态
    static SERVERURL_POST_ORDER_FOR_EMPLOYEE_CHANGE_EMPLOYEE_WORK_PAIED_STATUS = NetworkCommonUtil.SERVERURL + '/api/mobile/order/for/emplpyee/changeemployeeWorkPaidedStatus';

    //-------------------

    //查询被雇主雇佣的订单（通知）
    static SERVERURL_POST_ORDER_EM_NOTOFICATION = NetworkCommonUtil.SERVERURL + '/api/mobile/order/employ/findOrdersForNotification/employee';
    //修改更新是否接受雇主的邀请
    static SERVERURL_POST_ORDER_EM_NOTOFICATION_ACCEPT = NetworkCommonUtil.SERVERURL + '/api/mobile/order/employ/updateEmployeeWorkStart/employee';
    //查询我的账单
    //查询我确定收款的账单
    //查询我未确定收款的账单
    static SERVERURL_POST_ORDER_FIND_WORK_FOR_EMPLOYEE_BY_PADIDSTATUS = NetworkCommonUtil.SERVERURL + '/api/mobile/order/findWorkForEmployeeByPaidStatus';


    //打卡
    //查询今天是否已经打卡
    static SERVERURL_POST_ORDER_PUNCHCARD_ISPUNCHCARD = NetworkCommonUtil.SERVERURL + '/api/mobile/order/punchcard/isPuchCard';
    //打卡
    static SERVERURL_POST_ORDER_PUNCHCARD_CREATE = NetworkCommonUtil.SERVERURL + '/api/mobile/order/punchcard/create';


    //上传图片
    static SERVERURL_POST_IMAGE_UPLOAD = NetworkCommonUtil.SERVERURL + '/api/qiniu/up/fileUpload';
    static SERVERURL_POST_IMAGE_UPLOAD_BASE64 = NetworkCommonUtil.SERVERURL + '/api/qiniu/up/fileUpload/base64';
    //获取验证码
    static SERVERURL_POST_SMS_SEND_VERFI_CODE = NetworkCommonUtil.SERVERURL + '/api/sms/send/verfi/code';
    //验证验证码
    static SERVERURL_POST_SMS_SEND_VERFI_VALIDCODE = NetworkCommonUtil.SERVERURL + '/api/sms/send/verfi/validCode';


    //反馈意见
    //提交反馈
    static SERVERURL_POST_API_MOBILE_USER_ADVISE_CREATE = NetworkCommonUtil.SERVERURL + '/api/mobile/user/advise/create';

    //查询新版本
    static SERVERURL_POST_API_MOBILE_SOFT_UPDATE_CHECKISMENEEDUPDATE = NetworkCommonUtil.SERVERURL + '/api/mobile/soft/update/checkIsNeedUpdate';


    /**
     * GET 网络请求
     * @param {string} url posturl地址
     * @returns {any} 返回数据
     */
    static httpGetRequest(url: string): any {
        return fetch(url,
            {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/json',
                    'Access-Control-Allow-Origin': '*',
                    'Access-Control-Allow-Credentials': 'true',
                    'Access-Control-Allow-Headers': 'Content-Type, Accept, X-Requested-With,' +
                    ' remember-me',
                },
            })
            .then((response) => response.json())
            .then((responseJson) => {
                return responseJson;
            })
            .catch(this.handleError);
    }

    /**
     * POST 网络请求
     * @param params post请求参数
     * @param {string} url posturl地址
     * @returns {any} 返回数据
     */
    static httpPostRequest(params: JSON, url: string): any {
        return fetch(url,
            {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'Access-Control-Allow-Origin': '*',
                    'Access-Control-Allow-Credentials': 'true',
                    'Access-Control-Allow-Headers': 'Content-Type, Accept, X-Requested-With,' +
                    ' remember-me',
                },
                body: params
            })
            .then((response) => response.json())
            .then((responseJson) => {
                // return this.baseDecode(responseJson);
                return responseJson;
            })
            .catch(this.handleError);
    }

    static httpUpLoadImageWithProgress(params, url, onProgress): any {
        let opts = {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
                'Access-Control-Allow-Origin': '*',
                'Access-Control-Allow-Credentials': 'true',
                'Access-Control-Allow-Headers': 'Content-Type, Accept, X-Requested-With,' +
                ' remember-me',
            }
        };
        return new Promise((res, rej) => {
            let xhr = new XMLHttpRequest();
            xhr.open(opts.method || 'get', url);
            for (let k in opts.headers || {}) {
                xhr.setRequestHeader(k, opts.headers[k]);
            }
            xhr.onload = e => res(e.target);
            xhr.onerror = rej;
            if (xhr.upload && onProgress)
                xhr.upload.onprogress = onProgress; // event.loaded / event.total * 100 ; //event.lengthComputable
            xhr.send(params);
        });

    }

    static httUP(name, uri, url): any {

        // 这里需要将'///'处理掉,因为使用wrap的时候,会再包裹一层
        // 本文的fetch-blob使用的是0.10.4版本，据说其他版本不用添加下面的代码。
        // let PATH = iOS ? response.uri.replace('file:///', '') : response.uri;
        // let PATH = uri.replace('file:///', '');
        let PATH = uri;

        // 创建上传的请求头，使用fetch-blob必须要遵循name，data的格式，要不然就不成功。
        let body = [{
            name: 'file',
            filename: name,
            data: RNFetchBlob.wrap(PATH)
        }];


        return RNFetchBlob.fetch('POST', url, {
            // 上传图片要设置Header
            'Content-Type': 'multipart/form-data',
        }, body)
            .uploadProgress((written, total) => {
                // 本地查找进度
            })
            .progress((received, total) => {
                let perent = received / total;
                // 上传进度打印
                console.log(perent);
            })
            .then((response) => response.json())
            .then((response) => {
                // 上传信息返回
                console.log(response);
                return response;
            })
            .catch((error) => {
                // 错误信息
                console.log(error);
            });
    }

    /**
     *
     * @param image
     * @param url
     * @returns {Promise.<TResult>}
     */
    static httpUpLoadSingleImage(image, url): any {
        if (!image || !image.data || !image.path) {
            return;
        }
        let data = image.data;
        let uri = Platform.OS === 'ios' ? 'file:///' + image.path : image.path;
        let index = uri.lastIndexOf("\/");
        let name = uri.substring(index + 1, uri.length);
        let formData = new FormData();
        let file = {uri: uri, type: 'multipart/form-data', name: name};   //这里的key(uri和type和name)不能改变,
        formData.append("file", file);   //这里的file就是后台需要的key
        return fetch(url,
            {
                method: 'POST',
                headers: {
                    'Content-Type': 'multipart/form-data;charset=utf-8',
                    // 'Content-Type': 'multipart/form-data',
                    'Access-Control-Allow-Origin': '*',
                    'Access-Control-Allow-Credentials': 'true',
                    'Access-Control-Allow-Headers': 'Content-Type, Accept, X-Requested-With,' +
                    ' remember-me',
                },
                body: formData,
            })
            .then((response) => response.json())
            .then((responseJson) => {
                return responseJson;
            })
            .catch(this.handleError);
    }

    /**
     *
     * @param image
     * @param url
     * @returns {Promise.<TResult>}
     */
    static httpUpLoadSingleBase64Image(image, url): any {
        if (!image || !image.data || !image.path) {
            return;
        }
        let data = image.data;
        let uri = Platform.OS === 'ios' ? 'file:///' + image.path : image.path;
        let index = uri.lastIndexOf("\/");
        let name = uri.substring(index + 1, uri.length);
        let params = {
            fileName: name,
            baseFileStr: data,
        };
        //NetworkCommonUtil.SERVERURL_POST_IMAGE_UPLOAD_BASE64
        return fetch(url,
            {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'Access-Control-Allow-Origin': '*',
                    'Access-Control-Allow-Credentials': 'true',
                    'Access-Control-Allow-Headers': 'Content-Type, Accept, X-Requested-With,' +
                    ' remember-me',
                },
                body: JSON.stringify(params),
            })
            .then((response) => response.json())
            .then((responseJson) => {
                return responseJson;
            })
            .catch(this.handleError);
    }

    /**
     *
     * @param imgAry {name,uri,}
     * @param url
     * @returns {Promise.<TResult>}
     */
    static httpUpLoadMultiImage(imgAry, url): any {
        let formData = new FormData();//因为需要上传多张图片,所以需要遍历数组,把图片的路径数组放入formData中
        for (let i = 0; i < imgAry.length; i++) {
            let file = {uri: imgAry[i], type: 'multipart/form-data', name: 'image.png'};   //这里的key(uri和type和name)不能改变,
            formData.append("files", file);   //这里的files就是后台需要的key
        }
        return fetch(url,
            {
                method: 'POST',
                headers: {
                    'Content-Type': 'multipart/form-data',
                    'Access-Control-Allow-Origin': '*',
                    'Access-Control-Allow-Credentials': 'true',
                    'Access-Control-Allow-Headers': 'Content-Type, Accept, X-Requested-With,' +
                    ' remember-me',
                },
                body: formData,
            })
            .then((response) => response.json())
            .then((responseJson) => {
                return responseJson;
            })
            .catch(this.handleError);

    }

    static handleError(error: any): Promise<any> {
        // console.error('An error occurred', error); // for demo purposes only
        // console.warn('An error occurred', error); // for demo purposes only
        // ToastManager.show('' + error, ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
        return Promise.reject(error.message || error);
    }

    static baseEncode(responseJson: any) {
        if (Base64.encode) {
            // you have to explicitly extend String.prototype
            // alert(JSON.stringify(responseJson));
            return Base64.encode(JSON.stringify(responseJson));
        }
        return responseJson;
    }

    static baseDecode(encodeResponseStr: any) {
        if (Base64.decode) {
            // you have to explicitly extend String.prototype
            // alert(JSON.stringify(responseJson));
            // alert(Base64.decode(encodeResponseStr));
            return JSON.parse(Base64.decode(encodeResponseStr));
        }
        return encodeResponseStr;
    }

}

