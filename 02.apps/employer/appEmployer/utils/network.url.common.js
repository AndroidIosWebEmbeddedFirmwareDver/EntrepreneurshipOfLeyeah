import React from 'react';


export default class UrlMap {
    // 处理状态
    static SERVER_HTTP_TASK_STATUS_SUCCESS = 1001;
    static SERVER_HTTP_TASK_STATUS_ERROR = 1002;
    // static SERVERURL = 'http://127.0.0.1:8080'; // 服务端URL
    static SERVERURL = 'http://192.168.2.111:8080'; // 服务端URL
    // static SERVERURL = 'http://127.0.0.1:8808/leyeah'; // 服务端URL
    // static SERVERURL = 'http://47.90.72.19:8808/leyeah'; // 服务端URL
    static SERVERURL_SYS_WORK_HOME = UrlMap.SERVERURL + '/api/sys/work/home';
    static SERVERURL_SYS_WORK_HOME_LOGIN = UrlMap.SERVERURL + '/api/sys/work/home/login';
    static SERVERURL_SYS_WORK_TYPE = UrlMap.SERVERURL + '/api/sys/work/woker/type';
    static SERVERURL_SYS_WORK_TYPE_DELETE = UrlMap.SERVERURL + '/api/sys/work/woker/type/delete';
    static SERVERURL_SYS_WORK_TYPE_UPDATE = UrlMap.SERVERURL + '/api/sys/work/woker/type/update';
    static SERVERURL_SYS_WORK_TYPE_CREATE = UrlMap.SERVERURL + '/api/sys/work/woker/type/create';
    static SERVERURL_SANFANG_FULI_MEINV = UrlMap.SERVERURL + '/sanfang/tianapi/meinv';

    //地理位置查询
    static SERVERURL_SYS_REGION_PROVINCE = UrlMap.SERVERURL + '/api/sys/region/province';
    static SERVERURL_SYS_REGION_CITY = UrlMap.SERVERURL + '/api/sys/region/city';
    static SERVERURL_SYS_REGION_AREAANDCOUNTY = UrlMap.SERVERURL + '/api/sys/region/areaAndCounty';

    //system
    //登录&注册
    static SERVERURL_SYS_USER_LOGIN = UrlMap.SERVERURL + '/api/mobile/user/login';


    //订单
    //订单中对经验的要求
    static SERVERURL_SYS_ORDER_EXPRERIENCEREQUIRETYPE_QUERYALL_GET = UrlMap.SERVERURL + '/api/mobile/order/experienceRequireType/queryAll';
    static SERVERURL_SYS_ORDER_CREATE_POST = UrlMap.SERVERURL + '/api/mobile/order/create';

    static  hadLogined = 0; // 0-未登录、1-已经登录
}

