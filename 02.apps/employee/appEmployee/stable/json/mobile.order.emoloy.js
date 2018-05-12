import React from 'react'
import ToastManager from '../../utils/toast/Toast.util'
import DateCommonUtil from '../../utils/date.common.util'
import NetworkCommonUtil from '../../utils/network.common.util'
import UserDataManager from '../../utils/storage/user.data.manager.common.util'
import DialogManagerUtil from "../../view/views/dialog/dialog.manager.util";

export default class MobileOrderEmoloyUtils {

    static next_funcs = {
        gotonone: -2,
        gotoemployeeshowdetial: -1,
        gotoemployeeWorkStart: 1,
        gotoemployeeWorkPunchCard: 2,
        gotoemployeeWorkEnd: 3,
        gotoemployeeWorkPaided: 4,
    };
    //雇员显示
    static empploys = {
        employerWorkConfirm: {
            name: 'employerWorkConfirm',
            val: {
                normal: {
                    val: 0,
                    show: '待雇主录用',
                    func_bg_color: '#E0E0E0',
                    func_txt_color: '#707070',
                    tag: MobileOrderEmoloyUtils.next_funcs.gotonone
                },
                passed: {
                    val: 1,
                    show: '立即上工',
                    func_bg_color: '#FFCC33',
                    func_txt_color: '#FFFFFF',
                    tag: MobileOrderEmoloyUtils.next_funcs.gotoemployeeWorkStart
                },
                reject: {
                    val: -1,
                    show: '雇主拒绝录用',
                    func_bg_color: '#E0E0E0',
                    func_txt_color: '#707070',
                    tag: MobileOrderEmoloyUtils.next_funcs.gotonone
                }
            }
        },
        //employeeWorkStart===0，判断employerWorkConfirm===1
        employeeWorkStart: {
            name: 'employeeWorkStart',
            val: {
                normal: {
                    val: 0,
                    show: '立即上工',
                    func_bg_color: '#FFCC33',
                    func_txt_color: '#FFFFFF',
                    tag: MobileOrderEmoloyUtils.next_funcs.gotoemployeeWorkStart
                },
                passed: {
                    val: 1,
                    show: '立即打卡',
                    func_bg_color: '#FFCC33',
                    func_txt_color: '#FFFFFF',
                    tag: MobileOrderEmoloyUtils.next_funcs.gotoemployeeWorkPunchCard
                },
                reject: {
                    val: -1,
                    show: '雇员拒绝上工',
                    func_bg_color: '#E0E0E0',
                    func_txt_color: '#707070',
                    tag: MobileOrderEmoloyUtils.next_funcs.gotonone
                }
            }
        },
        //employeeWorkEnd===0,判断是否employeeWorkStart===1且punchCards是否完毕
        employeeWorkEnd: {
            name: 'employeeWorkEnd',
            val: {
                normal: {
                    val: 0,
                    show: '立即下工',
                    func_bg_color: '#FFCC33',
                    func_txt_color: '#FFFFFF',
                    tag: MobileOrderEmoloyUtils.next_funcs.gotoemployeeWorkEnd
                },
                passed: {
                    val: 1,
                    show: '待雇主确定付款',
                    func_bg_color: '#E0E0E0',
                    func_txt_color: '#707070',
                    tag: MobileOrderEmoloyUtils.next_funcs.gotonone
                },
                reject: {
                    val: -1,
                    show: '雇员拒绝下工',
                    func_bg_color: '#E0E0E0',
                    func_txt_color: '#707070',
                    tag: MobileOrderEmoloyUtils.next_funcs.gotonone
                }
            }
        },
        //
        employerPaidedWork: {
            name: 'employerPaidedWork',
            val: {
                normal: {
                    val: 0,
                    show: '待雇主确定付款',
                    func_bg_color: '#E0E0E0',
                    func_txt_color: '#707070',
                    tag: MobileOrderEmoloyUtils.next_funcs.gotonone
                },
                passed: {
                    val: 1,
                    show: '立即确定收款',
                    func_bg_color: '#FFCC33',
                    func_txt_color: '#FFFFFF',
                    tag: MobileOrderEmoloyUtils.next_funcs.gotoemployeeWorkPaided
                },
                reject: {
                    val: -1,
                    show: '雇主拒绝付款',
                    func_bg_color: '#E0E0E0',
                    func_txt_color: '#707070',
                    tag: MobileOrderEmoloyUtils.next_funcs.gotonone
                }
            }
        },
        employeeWorkPaided: {
            name: 'employeeWorkPaided',
            val: {
                normal: {
                    val: 0,
                    show: '立即确定收款',
                    func_bg_color: '#FFCC33',
                    func_txt_color: '#FFFFFF',
                    tag: MobileOrderEmoloyUtils.next_funcs.gotoemployeeWorkPaided
                },
                passed: {
                    val: 1,
                    show: '工作完成',
                    func_bg_color: '#E0E0E0',
                    func_txt_color: '#707070',
                    tag: MobileOrderEmoloyUtils.next_funcs.gotonone
                },
                reject: {
                    val: -1,
                    show: '雇员拒绝收款',
                    func_bg_color: '#E0E0E0',//FBFBFB
                    func_txt_color: '#707070',
                    tag: MobileOrderEmoloyUtils.next_funcs.gotonone
                }
            }
        },
    };


    static adjustDoWhat = (workDownEntity: any) => {
        if (!workDownEntity
            || !workDownEntity.order
            || !workDownEntity.rewards
            || !workDownEntity.employer
            || !workDownEntity.employs
        ) {
            return {val: 0, show: '', tag: 0};
        }
        if (workDownEntity.employs.employerWorkConfirm === 0) {
            return MobileOrderEmoloyUtils.empploys.employerWorkConfirm.val.normal;
        } else if (workDownEntity.employs.employerWorkConfirm === 1) {
            if (workDownEntity.employs.employeeWorkStart === 0) {
                return MobileOrderEmoloyUtils.empploys.employeeWorkStart.val.normal;
            } else if (workDownEntity.employs.employeeWorkStart === 1) {
                if (workDownEntity.employs.employeeWorkEnd === 0) {
                    if (!workDownEntity.punchCards) {
                        //如果已经完成所有打卡,继续下一步，如果还未打卡完成，则继续打卡
                        if (workDownEntity.punchCards.length > 0 && workDownEntity.punchCards.length === (DateCommonUtil.twODaysDifferenceValue(workDownEntity.order.workStopTime, workDownEntity.order.workStartTime) + 1)) {
                            if (workDownEntity.employs.employeeWorkEnd === 0) {
                                return MobileOrderEmoloyUtils.empploys.employeeWorkEnd.val.normal;
                            } else if (workDownEntity.employs.employeeWorkEnd === 1) {
                                if (workDownEntity.employs.employerPaidedWork === 0) {
                                    return MobileOrderEmoloyUtils.empploys.employerPaidedWork.val.normal;
                                } else if (workDownEntity.employs.employerPaidedWork === 1) {
                                    if (workDownEntity.employs.employeeWorkPaided === 0) {
                                        return MobileOrderEmoloyUtils.empploys.employeeWorkPaided.val.normal;
                                    } else if (workDownEntity.employs.employeeWorkPaided === 1) {
                                        return MobileOrderEmoloyUtils.empploys.employeeWorkPaided.val.passed;
                                    } else if (workDownEntity.employs.employeeWorkPaided === -1) {
                                        return MobileOrderEmoloyUtils.empploys.employeeWorkPaided.val.reject;
                                    }
                                } else if (workDownEntity.employs.employerPaidedWork === -1) {
                                    return MobileOrderEmoloyUtils.empploys.employerPaidedWork.val.reject;
                                }
                            } else if (workDownEntity.employs.employeeWorkEnd === -1) {
                                return MobileOrderEmoloyUtils.empploys.employeeWorkEnd.val.reject;
                            }
                        } else {
                            return MobileOrderEmoloyUtils.empploys.employeeWorkStart.val.passed
                        }
                    } else {
                        return MobileOrderEmoloyUtils.empploys.employeeWorkStart.val.passed
                    }
                } else if (workDownEntity.employs.employeeWorkEnd === 1) {
                    if (workDownEntity.employs.employerPaidedWork === 0) {
                        return MobileOrderEmoloyUtils.empploys.employerPaidedWork.val.normal;
                    } else if (workDownEntity.employs.employerPaidedWork === 1) {
                        if (workDownEntity.employs.employeeWorkPaided === 0) {
                            return MobileOrderEmoloyUtils.empploys.employeeWorkPaided.val.normal;
                        } else if (workDownEntity.employs.employeeWorkPaided === 1) {
                            return MobileOrderEmoloyUtils.empploys.employeeWorkPaided.val.passed;
                        } else if (workDownEntity.employs.employeeWorkPaided === -1) {
                            return MobileOrderEmoloyUtils.empploys.employeeWorkPaided.val.reject;
                        }
                    } else if (workDownEntity.employs.employerPaidedWork === -1) {
                        return MobileOrderEmoloyUtils.empploys.employerPaidedWork.val.reject;
                    }
                } else if (workDownEntity.employs.employeeWorkEnd === -1) {
                    return MobileOrderEmoloyUtils.empploys.employeeWorkEnd.val.reject;
                }

            } else if (workDownEntity.employs.employeeWorkStart === -1) {
                return MobileOrderEmoloyUtils.empploys.employeeWorkStart.val.reject;
            }
        } else if (workDownEntity.employs.employerWorkConfirm === -1) {
            return MobileOrderEmoloyUtils.empploys.employerWorkConfirm.val.reject;
        }

    };

    static adjustStatusToShow = (workDownEntity: any) => {
        if (!workDownEntity
            || !workDownEntity.order
            || !workDownEntity.rewards
            || !workDownEntity.employer
            || !workDownEntity.employs
        ) {
            return null;
        }
        if (workDownEntity.employs.employerWorkConfirm === 0) {
            return MobileOrderEmoloyUtils.empploys.employerWorkConfirm.val.normal;
        }
        if (workDownEntity.employs.employerWorkConfirm === 1 && workDownEntity.employs.employeeWorkStart === 0) {
            return MobileOrderEmoloyUtils.empploys.employeeWorkStart.val.normal;
        }
        if (workDownEntity.employs.employerWorkConfirm === 1 && workDownEntity.employs.employeeWorkStart === 1) {
            return MobileOrderEmoloyUtils.empploys.employeeWorkStart.val.passed;
        }

        if (workDownEntity.employs.employerWorkConfirm === 1 && workDownEntity.employs.employeeWorkStart === 1 && workDownEntity.employs.employeeWorkEnd === 0) {
            return MobileOrderEmoloyUtils.empploys.employeeWorkEnd.val.normal;
        }

        if (workDownEntity.employs.employerWorkConfirm === 1 && workDownEntity.employs.employeeWorkStart === 1 && workDownEntity.employs.employeeWorkEnd === 1) {
            return MobileOrderEmoloyUtils.empploys.employeeWorkEnd.val.passed;
        }
        if (workDownEntity.employs.employerWorkConfirm === 1 && workDownEntity.employs.employeeWorkStart === 1 && workDownEntity.employs.employeeWorkEnd === 1 && workDownEntity.employs.employerPaidedWork === 0) {
            return MobileOrderEmoloyUtils.empploys.employerPaidedWork.val.normal;
        }

        if (workDownEntity.employs.employerWorkConfirm === 1 && workDownEntity.employs.employeeWorkStart === 1 && workDownEntity.employs.employeeWorkEnd === 1 && workDownEntity.employs.employerPaidedWork === 1) {
            return MobileOrderEmoloyUtils.empploys.employerPaidedWork.val.passed;
        }

        if (workDownEntity.employs.employerWorkConfirm === 1 && workDownEntity.employs.employeeWorkStart === 1 && workDownEntity.employs.employeeWorkEnd === 1 && workDownEntity.employs.employerPaidedWork === 1 && workDownEntity.employs.employeeWorkPaided === 0) {
            return MobileOrderEmoloyUtils.empploys.employeeWorkPaided.val.normal;
        }

        if (workDownEntity.employs.employerWorkConfirm === 1 && workDownEntity.employs.employeeWorkStart === 1 && workDownEntity.employs.employeeWorkEnd === 1 && workDownEntity.employs.employerPaidedWork === 1 && workDownEntity.employs.employeeWorkPaided === 1) {
            return MobileOrderEmoloyUtils.empploys.employeeWorkPaided.val.passed;
        }

    };


    //立即开工
    static changeEmployeeWorkStartStatus = (mobileUserData: any, workDownEntity: any, callback: Function) => {
        if (!mobileUserData || !workDownEntity || !workDownEntity.order || !workDownEntity.rewards || !workDownEntity.employer || !workDownEntity.employs) {
            return;
        }
        DialogManagerUtil.showNormalLoadingDialog();
        let paramsObject = {
            orderId: workDownEntity.order.id,
            employId: workDownEntity.employs.id,
            workEmployerId: workDownEntity.employer.id,
            workEmployeeId: mobileUserData.data.id,//排序方式
            changeToStatus: 1,//1-同意，0-默认，-1-拒绝'
        };
        NetworkCommonUtil.httpPostRequest(JSON.stringify(paramsObject), NetworkCommonUtil.SERVERURL_POST_ORDER_FOR_EMPLOYEE_CHANGE_EMPLOYEE_WORK_START_STATUS).then((val: any) => {
            // alert(JSON.stringify(val));
            DialogManagerUtil.hide();
            if (val && val.code === NetworkCommonUtil.SERVER_HTTP_TASK_STATUS_SUCCESS) {
                if (callback) {
                    callback(val);
                }
            } else if (val) {
                ToastManager.show(JSON.stringify(val) + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            } else {
                ToastManager.show('请求网络出错' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            }
        });
    };
    //立即下工
    static changeEmployeeWorkEndStatus = (mobileUserData: any, workDownEntity: any, callback: Function) => {
        if (!mobileUserData || !workDownEntity || !workDownEntity.order || !workDownEntity.rewards || !workDownEntity.employer || !workDownEntity.employs) {
            return;
        }
        DialogManagerUtil.showNormalLoadingDialog();
        let paramsObject = {
            orderId: workDownEntity.order.id,
            employId: workDownEntity.employs.id,
            workEmployerId: workDownEntity.employer.id,
            workEmployeeId: mobileUserData.data.id,//排序方式
            changeToStatus: 1,//1-同意，0-默认，-1-拒绝'
        };
        NetworkCommonUtil.httpPostRequest(JSON.stringify(paramsObject), NetworkCommonUtil.SERVERURL_POST_ORDER_FOR_EMPLOYEE_CHANGE_EMPLOYEE_WORK_END_STATUS).then((val: any) => {
            // alert(JSON.stringify(val));
            DialogManagerUtil.hide();
            if (val && val.code === NetworkCommonUtil.SERVER_HTTP_TASK_STATUS_SUCCESS) {
                if (callback) {
                    callback(val);
                }
            } else if (val) {
                ToastManager.show(JSON.stringify(val) + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            } else {
                ToastManager.show('请求网络出错' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            }
        });
    };
    //立即确定收款
    static changeemployeeWorkPaidedStatus = (mobileUserData: any, workDownEntity: any, callback: Function) => {
        if (!mobileUserData || !workDownEntity || !workDownEntity.order || !workDownEntity.rewards || !workDownEntity.employer || !workDownEntity.employs) {
            return;
        }
        DialogManagerUtil.showNormalLoadingDialog();
        let paramsObject = {
            orderId: workDownEntity.order.id,
            employId: workDownEntity.employs.id,
            workEmployerId: workDownEntity.employer.id,
            workEmployeeId: mobileUserData.data.id,//排序方式
            changeToStatus: 1,//1-同意，0-默认，-1-拒绝'
        };
        NetworkCommonUtil.httpPostRequest(JSON.stringify(paramsObject), NetworkCommonUtil.SERVERURL_POST_ORDER_FOR_EMPLOYEE_CHANGE_EMPLOYEE_WORK_PAIED_STATUS).then((val: any) => {
            // alert(JSON.stringify(val));
            DialogManagerUtil.hide();
            if (val && val.code === NetworkCommonUtil.SERVER_HTTP_TASK_STATUS_SUCCESS) {
                if (callback) {
                    callback(val);
                }
            } else if (val) {
                ToastManager.show(JSON.stringify(val) + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            } else {
                ToastManager.show('请求网络出错' + '', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
            }
        });
    };

}
