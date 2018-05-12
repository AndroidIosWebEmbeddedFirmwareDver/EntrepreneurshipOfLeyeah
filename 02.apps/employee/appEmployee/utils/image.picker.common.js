import ImagePicker from 'react-native-image-crop-picker'

const Permissions = require('react-native-permissions');

export default class ImagePickerCommonUtil {
    static state = {
        photoPermission: '',
        cameraPermission: '',
        imageCache: null,
    };

    static requestCameraPermission() {
        return Permissions.request('camera')
            .then(response => {
                //returns once the user has chosen to 'allow' or to 'not allow' access
                //response is one of: 'authorized', 'denied', 'restricted', or 'undetermined'
                this.state.cameraPermission = response;
            });
    }

    static requestPhotoPermission() {
        return Permissions.request('photo')
            .then(response => {
                //returns once the user has chosen to 'allow' or to 'not allow' access
                //response is one of: 'authorized', 'denied', 'restricted', or 'undetermined'
                this.state.photoPermission = response;
            });
    }


    static checkCameraAndPhotos() {
        Permissions.checkMultiple(['camera', 'photo'])
            .then(response => {
                //response is an object mapping type to permission
                this.state.cameraPermission = response.camera;
                this.state.photoPermission = response.photo;
            });
    }

    static gotoPhoto(cropping, width, height, includeBase64) {
        return ImagePicker.openPicker({
            width: width ? width : 300,
            height: height ? height : 400,
            cropping: cropping,
            includeBase64: includeBase64,
        }).then(image => {
            console.log(image);
            // this.state.imageCache = image;
            return image;
        });
    }

    static gotoCamera(cropping, width, height, includeBase64) {
        return ImagePicker.openCamera({
            width: width ? width : 300,
            height: height ? height : 400,
            cropping: cropping,
            includeBase64: includeBase64,
        }).then(image => {
            console.log(image);
            // this.state.imageCache = image;
            return image;
        });
    }

    static requestPhoto(cropping, width, height, includeBase64) {
        if (!this.state.photoPermission === 'authorized') {
            this.requestPhotoPermission().bind(this).then(response => {
                //returns once the user has chosen to 'allow' or to 'not allow' access
                //response is one of: 'authorized', 'denied', 'restricted', or 'undetermined'
                if (response === 'authorized') {
                    return this.gotoPhoto(cropping, width, height, includeBase64);
                }
            });
        } else {
            return this.gotoPhoto(cropping, width, height, includeBase64);
        }
    }

    static requestCamera(cropping, width, height, includeBase64) {
        if (!this.state.cameraPermission === 'authorized') {
            this.requestCameraPermission().bind(this).then(response => {
                //returns once the user has chosen to 'allow' or to 'not allow' access
                //response is one of: 'authorized', 'denied', 'restricted', or 'undetermined'
                if (response === 'authorized') {
                    return this.gotoCamera(cropping, width, height, includeBase64);
                }
            });
        } else {
            return this.gotoCamera(cropping, width, height, includeBase64);
        }
    }

}