import React from 'react';


export default class NumberCommonUtil {

    /**
     * 获取不重复随机数
     * @param  start 随机数最小值
     * @param  end 随机数最大值
     * @param  size 随机数获取数量 最小为1，默认1
     * @return integer|array 如 1或者[2,4,7,9]
     */
    static randomNumber(start, end, size): any {
        // 全部随机数值
        let allNums = [];

        // 判断获取随机数个数
        size = size ? (size > end - start ? end - start : size) : 1;

        // 生成随机数值区间数组
        for (let i = start, k = 0; i <= end; i++, k++) {
            allNums[k] = i;
        }

        // 打撒数组排序
        allNums.sort(function () {
            return 0.5 - Math.random();
        });

        // 获取数组从第一个开始到指定个数的下标区间
        return allNums.slice(0, size);
    }


}

