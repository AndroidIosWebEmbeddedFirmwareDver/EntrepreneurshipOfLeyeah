import React from 'react';


//是否实名认证 ，默认0，默认0，0-未提交，待提交;1-已提交，待审核，2-已审核，未通过，3-已审核，已通过

export default class UserRnaStatus {

    static UN_COMMIT = 0;//未提交，待提交
    static COMMITED_WAIT_EXAM = 1;//已提交，待审核
    static EXAMED_NOT_PASS = 2;//已审核，未通过
    static EXAMED_PASSED = 3;//已审核，已通过


    static UN_COMMIT_SHOW = '未认证';//未提交，待提交
    static COMMITED_WAIT_EXAM_SHOW = '审核中';//已提交，待审核
    static EXAMED_NOT_PASS_SHOW = '未通过';//已审核，未通过
    static EXAMED_PASSED_SHOW = '已认证';//已审核，已通过

    static  checkRna = (status) => {
        return status !== UserRnaStatus.UN_COMMIT;
    };

    static  rnaShow = (mobileUserData: any) => {
        if (!mobileUserData || !mobileUserData.data) {
            return '';
        }
        switch (mobileUserData.data.beRna) {
            case UserRnaStatus.UN_COMMIT:
                return UserRnaStatus.UN_COMMIT_SHOW;
                break;
            case UserRnaStatus.COMMITED_WAIT_EXAM:
                return UserRnaStatus.COMMITED_WAIT_EXAM_SHOW;
                break;
            case UserRnaStatus.EXAMED_NOT_PASS:
                return UserRnaStatus.EXAMED_NOT_PASS_SHOW;
                break;
            case UserRnaStatus.EXAMED_PASSED:
                return UserRnaStatus.EXAMED_PASSED_SHOW;
                break;
            default:
                return '';
        }
    };
}
