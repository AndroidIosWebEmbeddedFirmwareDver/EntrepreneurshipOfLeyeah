import parse from 'date-fns/parse';
import isAfter from 'date-fns/is_after';
import isBefore from 'date-fns/is_before';
import isEqual from 'date-fns/is_equal';
import differenceInDays from 'date-fns/difference_in_days';
import format from 'date-fns/format'
import addDays from 'date-fns/add_days'
import eachDay from 'date-fns/each_day'


export default class DateCommonUtil {

    /**
     * 获取今天
     * @returns {any}
     */
    static getTodayStr = () => {
        let todayDate = parse(new Date());
        return format(todayDate, 'YYYY-MM-DD');
    };

    /**
     * 获取现在的时间
     * @returns {any}
     */
    static getNowTimeStr = () => {
        let result = '';
        let todayDate = parse(new Date());
        result += todayDate.getHours() + ':';
        result += todayDate.getSeconds() + ':';
        result += todayDate.getMinutes();
        return result;
    };

    /**
     * 判断日期是否就是今天
     * @param validDateStr
     * @returns {any}
     */
    static isDateIsToday = (validDateStr) => {
        if (!validDateStr) {
            return false;
        }
        let validDate = parse(validDateStr);
        let todayDate = parse(new Date());
        return isEqual(validDate, todayDate);
    };

    /**
     * 判断日期是否早于今天
     * @param validDateStr
     * @returns {any}
     */
    static isDateBeforeToday = (validDateStr) => {
        if (!validDateStr) {
            return false;
        }
        let validDate = parse(validDateStr);
        let todayDate = parse(new Date());
        return isBefore(validDate, todayDate);
    };
    /**
     * 判断日期是否晚于今天
     * @param validDateStr
     * @returns {any}
     */
    static isDateAfterToday = (validDateStr) => {
        if (!validDateStr) {
            return false;
        }
        let validDate = parse(validDateStr);
        let todayDate = parse(new Date());
        return isAfter(validDate, todayDate);
    };

    /**
     * 判断日期A是否晚于日期B
     * @param leftDateStr
     * @param rightDateStr
     * @returns {*}
     */
    static isAAfterB = (leftDateStr, rightDateStr) => {
        if (!leftDateStr && !rightDateStr) {
            return false;
        }
        let leftDate = parse(leftDateStr);
        let rightDate = parse(rightDateStr);
        return isAfter(leftDate, rightDate);
    };

    /**
     * 计算两个日期之间的差值
     * @param leftDateStr
     * @param rightDateStr
     * @returns {any}
     */
    static twODaysDifferenceValue = (leftDateStr, rightDateStr) => {
        if (!leftDateStr || !rightDateStr) {
            return 0;
        }
        let leftDate = parse(leftDateStr);
        let rightDate = parse(rightDateStr);
        return differenceInDays(leftDate, rightDate);
    };


}

