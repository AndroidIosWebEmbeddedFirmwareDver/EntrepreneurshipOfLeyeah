import React, {Component, PropTypes} from 'react';


import AsyncstorageKeyCommonUtil from './asyncstorage.key.common.util'
import AsyncstorageStorageCommonUtil from './asyncstorage.storage.common.util'


export default class UserDataManager {
    user = {
        code: PropTypes.instanceOf(String),
        msg: PropTypes.instanceOf(String),
        data: {
            id: PropTypes.instanceOf(Number),
            name: PropTypes.instanceOf(String),
            phone: PropTypes.instanceOf(String),
            callPhone: PropTypes.instanceOf(String),
            typeId: PropTypes.instanceOf(String),
            typeName: PropTypes.instanceOf(String),
            sessionToken: PropTypes.instanceOf(String),
            sessionCreateDateTime: PropTypes.instanceOf(Date),
            avatarUrl: PropTypes.instanceOf(String),
            score: PropTypes.instanceOf(Number),
            canBeSearch: PropTypes.instanceOf(Number),
            beRna: PropTypes.instanceOf(Number),
            rnaOrder: {
                id: PropTypes.instanceOf(Number),
                state: PropTypes.instanceOf(Number),
                userId: PropTypes.instanceOf(Number),
                userName: PropTypes.instanceOf(String),
                userIdCardNo: PropTypes.instanceOf(String),
                userPhoneNo: PropTypes.instanceOf(String),
                userCallPhoneNo: PropTypes.instanceOf(String),
                // userIdCardFontImageUrl: PropTypes.instanceOf(String),
                // userIdCardBackImageUrl: PropTypes.instanceOf(String),
                // userSkillBookFontImageUrl: PropTypes.instanceOf(String),
                // userSkillBookBackImageUrl: PropTypes.instanceOf(String),
            }
        },
    };


    static singInstance: UserDataManager;

    constructor() {
        this.user = null;
    }

    static getInstance() {
        if (!UserDataManager.singInstance) {
            UserDataManager.singInstance = new UserDataManager();
        }
        return UserDataManager.singInstance;
    }

    /**
     * 读取最新数据
     * @returns
     */
    load() {
        return AsyncstorageStorageCommonUtil.load(AsyncstorageKeyCommonUtil.LOGINKEYID.key, AsyncstorageKeyCommonUtil.LOGINKEYID.id).then((ret) => {
            if (ret) {
                this.user = ret;

            } else {
                this.user = null;
            }
            return ret;
        });
        // return this.user;
    }

    /**
     * 保存全部数据
     * @param val
     */
    saveAll(val) {
        if (val) {
            this.user = val;
            return AsyncstorageStorageCommonUtil.save(AsyncstorageKeyCommonUtil.LOGINKEYID.key, AsyncstorageKeyCommonUtil.LOGINKEYID.id, val).then(saveToMap => {
                return saveToMap;
            });
        } else {
            this.user = null;
        }
    }

    /**
     * 清理全部数据
     */
    removeAll() {
        AsyncstorageStorageCommonUtil.removeForKeyAndId(AsyncstorageKeyCommonUtil.LOGINKEYID.key, AsyncstorageKeyCommonUtil.LOGINKEYID.id);
        this.user = null;
        return this.user;
    }

    /**
     * 设置name
     * @param name
     * @returns
     */
    saveName(name) {
        this.user.data.name = name;
        return AsyncstorageStorageCommonUtil.save(AsyncstorageKeyCommonUtil.LOGINKEYID.key, AsyncstorageKeyCommonUtil.LOGINKEYID.id, this.user).then(saveToMap => {
            return this.user;
        });
    }

    /**
     * 设置手机号码
     * @param phone
     * @returns
     */
    savePhone(phone) {
        this.user.data.phone = phone;
        this.user.data.rnaOrder.userPhoneNo = phone;
        return AsyncstorageStorageCommonUtil.save(AsyncstorageKeyCommonUtil.LOGINKEYID.key, AsyncstorageKeyCommonUtil.LOGINKEYID.id, this.user).then(saveToMap => {
            return this.user;
        });
    }

    /**
     * 设置联系电话
     * @param callPhone
     * @returns
     */
    saveCallPhoneNo(callPhone) {
        this.user.data.callPhone = callPhone;
        this.user.data.rnaOrder.userCallPhoneNo = callPhone;
        return AsyncstorageStorageCommonUtil.save(AsyncstorageKeyCommonUtil.LOGINKEYID.key, AsyncstorageKeyCommonUtil.LOGINKEYID.id, this.user).then(saveToMap => {
            return this.user;
        });
    }

    /**
     * 设置地理位置
     * @param params
     * @returns
     */
    saveRegion(params) {
        this.user.data.areaCountryPkId = params.areaCountryPkId;
        this.user.data.areaCountryName = params.areaCountryName;
        this.user.data.areaProvincePkId = params.areaProvincePkId;
        this.user.data.areaProvinceName = params.areaProvinceName;
        this.user.data.areaCityPkId = params.areaCityPkId;
        this.user.data.areaCityName = params.areaCityName;
        this.user.data.areaAreaAndCountyPkId = params.areaAreaAndCountyPkId;
        this.user.data.areaAreaAndCountyName = params.areaAreaAndCountyName;
        this.user.data.areaAddress = params.areaAddress;
        return AsyncstorageStorageCommonUtil.save(AsyncstorageKeyCommonUtil.LOGINKEYID.key, AsyncstorageKeyCommonUtil.LOGINKEYID.id, this.user).then(saveToMap => {
            return this.user;
        });
    }


    /**
     * 设置身份类型
     * @param typeId
     * @param typeName
     * @returns
     */
    saveType(typeId, typeName) {
        this.user.data.typeId = typeId;
        this.user.data.typeName = typeName;
        return AsyncstorageStorageCommonUtil.save(AsyncstorageKeyCommonUtil.LOGINKEYID.key, AsyncstorageKeyCommonUtil.LOGINKEYID.id, this.user).then(saveToMap => {
            return this.user;
        });
    }

    /**
     * 设置头像地址
     * @param avatarUrl
     * @returns
     */
    saveAvatarUrl(avatarUrl) {
        this.user.data.avatarUrl = avatarUrl;
        return AsyncstorageStorageCommonUtil.save(AsyncstorageKeyCommonUtil.LOGINKEYID.key, AsyncstorageKeyCommonUtil.LOGINKEYID.id, this.user).then(saveToMap => {
            return this.user;
        });
    }


    /**
     * 设置是否能被搜索
     * @param canBeSearch
     * @returns
     */
    saveCanBeSearch(canBeSearch) {
        this.user.data.canBeSearch = canBeSearch;
        return AsyncstorageStorageCommonUtil.save(AsyncstorageKeyCommonUtil.LOGINKEYID.key, AsyncstorageKeyCommonUtil.LOGINKEYID.id, this.user).then(saveToMap => {
            return this.user;
        });
    }

    /**
     * 设置是否实名认证
     * @param beRna
     * @returns
     */
    saveBeRna(beRna) {
        this.user.data.beRna = beRna;
        return AsyncstorageStorageCommonUtil.save(AsyncstorageKeyCommonUtil.LOGINKEYID.key, AsyncstorageKeyCommonUtil.LOGINKEYID.id, this.user).then(saveToMap => {
            return this.user;
        });
    }


    /**
     * @param userIdCardNo
     * @returns
     */
    saveRrnaOrderOfUserIdCardNo(userIdCardNo) {
        this.user.data.rnaOrder.userIdCardNo = userIdCardNo;
        return AsyncstorageStorageCommonUtil.save(AsyncstorageKeyCommonUtil.LOGINKEYID.key, AsyncstorageKeyCommonUtil.LOGINKEYID.id, this.user).then(saveToMap => {
            return this.user;
        });
    }

    /**
     * @param userPhoneNo
     * @returns
     */
    saveRrnaOrderOfUserPhoneNo(userPhoneNo) {
        this.user.data.phone = userPhoneNo;
        this.user.data.rnaOrder.userPhoneNo = userPhoneNo;
        return AsyncstorageStorageCommonUtil.save(AsyncstorageKeyCommonUtil.LOGINKEYID.key, AsyncstorageKeyCommonUtil.LOGINKEYID.id, this.user).then(saveToMap => {
            return this.user;
        });
    }

    /**
     * @param userCallPhoneNo
     * @returns
     */
    saveRrnaOrderOfUserCallPhoneNo(userCallPhoneNo) {
        this.user.data.callPhone = userCallPhoneNo;
        this.user.data.rnaOrder.userCallPhoneNo = userCallPhoneNo;
        return AsyncstorageStorageCommonUtil.save(AsyncstorageKeyCommonUtil.LOGINKEYID.key, AsyncstorageKeyCommonUtil.LOGINKEYID.id, this.user).then(saveToMap => {
            return this.user;
        });
    }


    saveForRnaOrderParams(params, beRna) {
        //本地认证
        this.user.data.beRna = beRna;
        if (params) {
            //名称
            this.user.data.name = params.userName;
            //电话
            this.user.data.phone = params.userPhoneNo;
            //联系电话
            this.user.data.callPhone = params.userCallPhoneNo;
            //rnaOrder
            this.user.data.rnaOrder.state = this.user.data.beRna;
            this.user.data.rnaOrder.userId = params.userId;
            this.user.data.rnaOrder.userName = params.userName;
            this.user.data.rnaOrder.userIdCardNo = params.userIdCardNo;
            this.user.data.rnaOrder.userCallPhoneNo = params.userCallPhoneNo;
            this.user.data.rnaOrder.userPhoneNo = params.userPhoneNo;
            // this.user.data.rnaOrder.userIdCardFontImageUrl = params.userIdCardFontImageUrl;
            // this.user.data.rnaOrder.userIdCardBackImageUrl = params.userIdCardBackImageUrl;
            // this.user.data.rnaOrder.userSkillBookFontImageUrl = params.userSkillBookFontImageUrl;
            // this.user.data.rnaOrder.userSkillBookBackImageUrl = params.userSkillBookBackImageUrl;
        }
        return AsyncstorageStorageCommonUtil.save(AsyncstorageKeyCommonUtil.LOGINKEYID.key, AsyncstorageKeyCommonUtil.LOGINKEYID.id, this.user).then(saveToMap => {
            return this.user;
        });
    }
}