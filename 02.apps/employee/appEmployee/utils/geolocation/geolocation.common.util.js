import ToastManager from '../../utils/toast/Toast.util'


export default class GeolocationCommonUtil {

    //获取经纬度的方法  Longitude  Latitude
    static  getLongitudeAndLatitude = (geolocation) => {
        if (!geolocation) {
            ToastManager.alertWithSure('获取位置失败', 'geolocation===null', () => {
            });
            return null;
        }
        //获取位置再得到城市先后顺序，通过Promise完成
        return new Promise((resolve, reject) => {
            geolocation.getCurrentPosition(
                location => {

                    //可以获取到的数据
                    let result = "速度：" + location.coords.speed +
                        "\n经度：" + location.coords.longitude +
                        "\n纬度：" + location.coords.latitude +
                        "\n准确度：" + location.coords.accuracy +
                        "\n行进方向：" + location.coords.heading +
                        "\n海拔：" + location.coords.altitude +
                        "\n海拔准确度：" + location.coords.altitudeAccuracy +
                        "\n时间戳：" + location.timestamp;

                    // ToastAndroid.show("UTIl" + location.coords.longitude, ToastAndroid.SHORT);
                    ToastManager.alertWithSure('获取位置成功', '' + result, () => {
                    });
                    resolve([location.coords.longitude, location.coords.latitude]);
                },
                error => {
                    ToastManager.alertWithSure('获取位置失败', '' + error, () => {
                    });
                    reject(error);
                }
            );
        })
    }
}