import React from 'react';

import {
    Dimensions,
    PixelRatio,
} from 'react-native';


/**
 * 屏幕工具类
 * ui设计基准,iphone 6
 * width:750
 * height:1334
 */

/*
 设备的像素密度，例如：
 PixelRatio.get() === 1          mdpi Android 设备 (160 dpi)
 PixelRatio.get() === 1.5        hdpi Android 设备 (240 dpi)
 PixelRatio.get() === 2          iPhone 4, 4S,iPhone 5, 5c, 5s,iPhone 6,xhdpi Android 设备 (320 dpi)
 PixelRatio.get() === 3          iPhone 6 plus , xxhdpi Android 设备 (480 dpi)
 PixelRatio.get() === 3.5        Nexus 6
*/

export const screenW = Dimensions.get('window').width;
export const screenH = Dimensions.get('window').height;
const fontScale = PixelRatio.getFontScale();
const pixelRatio = PixelRatio.get();
const r2 = 2;
const w2 = 750 / r2;
const h2 = 1334 / r2;
/**
 * 设置text为sp
 * @param size  sp
 * @returns {Number} dp
 */
export const DEFAULT_DENSITY = 2;

export default class ScreenAdapterCommonUtil {

    /**
     * 设置text为sp
     * @param size sp
     * return number dp
     */
    static setSpText(size: Number) {
        let scaleWidth = screenW / w2;
        let scaleHeight = screenH / h2;
        let scale = Math.min(scaleWidth, scaleHeight);
        size = Math.round((size * scale + 0.5) * pixelRatio / fontScale);
        return size;
    }

    /**
     * 屏幕适配,缩放size
     * @param size
     * @returns {Number}
     * @constructor
     */
    static scaleSize(size: Number) {
        let scaleWidth = screenW / w2;
        let scaleHeight = screenH / h2;
        let scale = Math.min(scaleWidth, scaleHeight);
        size = Math.round((size * scale + 0.5));
        return size / DEFAULT_DENSITY;
    }


}
