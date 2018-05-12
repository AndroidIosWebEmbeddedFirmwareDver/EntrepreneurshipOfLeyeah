import React from 'react'
import ToastManager from '../../utils/toast/Toast.util'
import DateCommonUtil from '../../utils/date.common.util'
import NetworkCommonUtil from '../../utils/network.common.util'
import UserDataManager from '../../utils/storage/user.data.manager.common.util'
import DialogManagerUtil from "../../view/views/dialog/dialog.manager.util";

export default class MobileOrderEmoloyUtils {

    static next_funcs = {
        gotoemployershowemployeeworks: -3,
        gotonone: -2,
        gotoemployershowdetial: -1,
        gotoemployerWorkConfirm: 1,
        gotoeemployerPaidedWork: 2,
    };
    //雇主显示
    static empploys = {
        employerWorkConfirm: {
            name: 'employerWorkConfirm',
            val: {
                normal: {
                    val: 0,
                    show: '处理录用',
                    tag: MobileOrderEmoloyUtils.next_funcs.gotoemployerWorkConfirm
                },
                passed: {
                    val: 1,
                    show: '待雇员上工',
                    tag: MobileOrderEmoloyUtils.next_funcs.gotonone
                },
                reject: {
                    val: -1,
                    show: '已拒绝录用',
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
                    show: '待雇员上工',
                    tag: MobileOrderEmoloyUtils.next_funcs.gotonone
                },
                passed: {
                    val: 1,
                    show: '查看考勤',
                    tag: MobileOrderEmoloyUtils.next_funcs.gotoemployershowemployeeworks
                },
                reject: {
                    val: -1,
                    show: '雇员拒绝上工',
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
                    show: '查看考勤',
                    tag: MobileOrderEmoloyUtils.next_funcs.gotoemployershowemployeeworks
                },
                passed: {
                    val: 1,
                    show: '处理付款',
                    tag: MobileOrderEmoloyUtils.next_funcs.gotonone
                },
                reject: {
                    val: -1,
                    show: '雇员拒绝下工',
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
                    show: '处理付款',
                    tag: MobileOrderEmoloyUtils.next_funcs.gotoeemployerPaidedWork
                },
                passed: {
                    val: 1,
                    show: '待雇员确定收款',
                    tag: MobileOrderEmoloyUtils.next_funcs.gotonone
                },
                reject: {val: -1, show: '已拒绝付款', tag: MobileOrderEmoloyUtils.next_funcs.gotonone}
            }
        },
        employeeWorkPaided: {
            name: 'employeeWorkPaided',
            val: {
                normal: {
                    val: 0,
                    show: '待雇员确定收款',
                    tag: MobileOrderEmoloyUtils.next_funcs.gotonone
                },
                passed: {
                    val: 1,
                    show: '工作完成',
                    tag: MobileOrderEmoloyUtils.next_funcs.gotonone
                },
                reject: {
                    val: -1,
                    show: '雇员拒绝收款',
                    tag: MobileOrderEmoloyUtils.next_funcs.gotonone
                }
            }
        },
    };


    static adjustDoWhat = (workDownEntity: any) => {
        if (!workDownEntity
            || !workDownEntity.order
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


    //立即录用
    static changeEmployerWorkConfirmStatus = (mobileUserData: any, workDownEntity: any, changeToStatus: number, callback: Function) => {
        if (!mobileUserData || !workDownEntity || !workDownEntity.order || !workDownEntity.employs) {
            return;
        }
        DialogManagerUtil.showNormalLoadingDialog();
        let paramsObject = {
            orderId: workDownEntity.order.id,
            employId: workDownEntity.employs.id,
            workEmployerId: workDownEntity.employs.workEmployerId,
            workEmployeeId: workDownEntity.employs.workEmployeeId,//排序方式
            changeToStatus: changeToStatus,//1-同意，0-默认，-1-拒绝'
        };
        NetworkCommonUtil.httpPostRequest(JSON.stringify(paramsObject), NetworkCommonUtil.SERVERURL_POST_ORDER_FOR_EMPLOYEE_CHANGE_EMPLOYER_WORK_CONFIRM_STATUS).then((val: any) => {
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
    //立即确定付款
    static changeEmployerPaidedWorkStatus = (mobileUserData: any, workDownEntity: any, changeToStatus: number, callback: Function) => {
        if (!mobileUserData || !workDownEntity || !workDownEntity.order || !workDownEntity.employs) {
            return;
        }
        DialogManagerUtil.showNormalLoadingDialog();
        let paramsObject = {
            orderId: workDownEntity.order.id,
            employId: workDownEntity.employs.id,
            workEmployerId: workDownEntity.employs.workEmployerId,
            workEmployeeId: workDownEntity.employs.workEmployeeId,//排序方式
            changeToStatus: changeToStatus,//1-同意，0-默认，-1-拒绝'
        };
        NetworkCommonUtil.httpPostRequest(JSON.stringify(paramsObject), NetworkCommonUtil.SERVERURL_POST_ORDER_FOR_EMPLOYEE_CHANGE_EMPLOYER_WORK_PAIED_STATUS).then((val: any) => {
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
    static changeEmployeeWorkEndStatus = (mobileUserData: any, workDownEntity: any, changeToStatus: number, callback: Function) => {
        if (!mobileUserData || !workDownEntity || !workDownEntity.order || !workDownEntity.employs) {
            return;
        }
        DialogManagerUtil.showNormalLoadingDialog();
        let paramsObject = {
            orderId: workDownEntity.order.id,
            employId: workDownEntity.employs.id,
            workEmployerId: workDownEntity.employs.workEmployerId,
            workEmployeeId: workDownEntity.employs.workEmployeeId,//排序方式
            changeToStatus: changeToStatus,//1-同意，0-默认，-1-拒绝'
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


}
