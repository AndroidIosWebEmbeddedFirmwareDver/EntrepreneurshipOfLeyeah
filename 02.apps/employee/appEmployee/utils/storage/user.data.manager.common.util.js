import React, {Component, PropTypes} from 'react';


import AsyncstorageKeyCommonUtil from './asyncstorage.key.common.util'
import AsyncstorageStorageCommonUtil from './asyncstorage.storage.common.util'

//
// global.user =  {
// code: PropTypes.instanceOf(String),
//     msg: PropTypes.instanceOf(String),
//     data: {
//     id: PropTypes.instanceOf(Number),
//         name: PropTypes.instanceOf(String),
//         phone: PropTypes.instanceOf(Number),
//         typeId: PropTypes.instanceOf(String),
//         typeName: PropTypes.instanceOf(String),
//         sessionToken: PropTypes.instanceOf(String),
//         sessionCreateDateTime: PropTypes.instanceOf(Date),
//         avatarUrl: PropTypes.instanceOf(String),
//         score: PropTypes.instanceOf(Number),
//         canBeSearch: PropTypes.instanceOf(Number),
//         beRna: PropTypes.instanceOf(Number),
// },
// };


export default class UserDataManager {
    user = {
        code: PropTypes.instanceOf(String),
        msg: PropTypes.instanceOf(String),
        data: {
            id: PropTypes.instanceOf(Number),
            name: PropTypes.instanceOf(String),
            phone: PropTypes.instanceOf(Number),
            typeId: PropTypes.instanceOf(String),
            typeName: PropTypes.instanceOf(String),
            sessionToken: PropTypes.instanceOf(String),
            sessionCreateDateTime: PropTypes.instanceOf(Date),
            avatarUrl: PropTypes.instanceOf(String),
            score: PropTypes.instanceOf(Number),
            canBeSearch: PropTypes.instanceOf(Number),
            beRna: PropTypes.instanceOf(Number),
            resume: {
                id: PropTypes.instanceOf(Number),
                workTypes: PropTypes.instanceOf(String),
                workExperienceType: PropTypes.instanceOf(String),
                workExperienceTypeDesc: PropTypes.instanceOf(String),
                workGoodAts: PropTypes.instanceOf(String),
                workSelfEvals: PropTypes.instanceOf(String),
            }
        },
        app: {
            position: {
                longitude: PropTypes.instanceOf(Number),// 经度
                latitude: PropTypes.instanceOf(Number),//纬度
                formattedAddress: PropTypes.instanceOf(String),//格式化地址
            },
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
                if (!this.user.app || !this.user.app.position) {
                    this.user.app = {position: {longitude: 102.00, latitude: 37.00}};
                }
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
     *检测是否已经填写了完整的简历
     * @returns {boolean}
     */
    isHadSetFullResume() {
        return !!(this.user && this.user.data && this.user.data.resume && this.user.data.resume.id > 0
            && this.user.data.resume.workTypes && this.user.data.resume.workTypes.length > 0
            && this.user.data.resume.workGoodAts && this.user.data.resume.workGoodAts.length > 0
            && this.user.data.resume.workSelfEvals && this.user.data.resume.workSelfEvals.length > 0
            && this.user.data.resume.workExperienceType > 0 && this.user.data.resume.workExperienceTypeDesc);

    }


    /**
     * 设置个人简历之workTypes
     * @param workTypes
     * @returns
     */
    saveResumeOfWorkTypes(workTypes) {
        this.user.data.resume.workTypes = workTypes;
        return AsyncstorageStorageCommonUtil.save(AsyncstorageKeyCommonUtil.LOGINKEYID.key, AsyncstorageKeyCommonUtil.LOGINKEYID.id, this.user).then(saveToMap => {
            return this.user;
        });
    }

    /**
     * 设置个人简历之workGoodAts
     * @param workGoodAts
     * @returns
     */
    saveResumeOfWorkGoodAts(workGoodAts) {
        this.user.data.resume.workGoodAts = workGoodAts;
        return AsyncstorageStorageCommonUtil.save(AsyncstorageKeyCommonUtil.LOGINKEYID.key, AsyncstorageKeyCommonUtil.LOGINKEYID.id, this.user).then(saveToMap => {
            return this.user;
        });
    }

    /**
     * 设置个人简历之workSelfEvals
     * @param workSelfEvals
     * @returns
     */
    saveResumeOfWorkSelfEvals(workSelfEvals) {
        this.user.data.resume.workSelfEvals = workSelfEvals;
        return AsyncstorageStorageCommonUtil.save(AsyncstorageKeyCommonUtil.LOGINKEYID.key, AsyncstorageKeyCommonUtil.LOGINKEYID.id, this.user).then(saveToMap => {
            return this.user;
        });
    }

    /**
     * 设置个人简历之 workExperience
     * @param workExperienceType
     * @param workExperienceTypeDesc
     * @returns
     */
    saveResumeOfWorkExperience(workExperienceType, workExperienceTypeDesc) {
        if (!(this.user && this.user.data && this.user.data.resume)) {
            return;
        }
        this.user.data.resume.workExperienceType = workExperienceType;
        this.user.data.resume.workExperienceTypeDesc = workExperienceTypeDesc;
        return AsyncstorageStorageCommonUtil.save(AsyncstorageKeyCommonUtil.LOGINKEYID.key, AsyncstorageKeyCommonUtil.LOGINKEYID.id, this.user).then(saveToMap => {
            return this.user;
        });
    }

    saveAppPosition(longitude, latitude) {
        if (!(this.user && this.user.app && this.user.app.position)) {
            return;
        }
        this.user.app.position.longitude = longitude;
        this.user.app.position.latitude = latitude;
        return AsyncstorageStorageCommonUtil.save(AsyncstorageKeyCommonUtil.LOGINKEYID.key, AsyncstorageKeyCommonUtil.LOGINKEYID.id, this.user).then(saveToMap => {
            return this.user;
        });
    }
    saveAppPositionFormattedAddress(formattedAddress) {
        if (!(this.user && this.user.app && this.user.app.position)) {
            return;
        }
        this.user.app.position.formattedAddress = formattedAddress;
        return AsyncstorageStorageCommonUtil.save(AsyncstorageKeyCommonUtil.LOGINKEYID.key, AsyncstorageKeyCommonUtil.LOGINKEYID.id, this.user).then(saveToMap => {
            return this.user;
        });
    }
}