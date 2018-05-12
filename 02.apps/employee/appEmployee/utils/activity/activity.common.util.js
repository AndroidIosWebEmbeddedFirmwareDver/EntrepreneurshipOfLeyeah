import React, {PureComponent, Component} from 'react';
import UserDataManager from "../storage/user.data.manager.common.util";


export default class ActivityCommonUtil {

    showWhatComponent: Component;

    static singInstance: ActivityCommonUtil;

    static getInstance() {
        if (!ActivityCommonUtil.singInstance) {
            ActivityCommonUtil.singInstance = new ActivityCommonUtil();
        }
        return ActivityCommonUtil.singInstance;
    }

    isMeShowAtFont(checkComponent: Component): boolean {
        return checkComponent === this.showWhatComponent;

    }


    setMeShowAtFont(showComponent: Component): void {
        this.showWhatComponent = showComponent;
    }


}