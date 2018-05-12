import React, {PureComponent, Component} from 'react';


import RootSiblings from '../../../utils/rootSiblings/SiblingsManager';
import NormalChoiceDialogContainer from './normalChoice/normal.choice.dialog';
import NormalLoadingDialogContainer from './normalLoading/normal.loading.dialog';

export default class DialogManagerUtil {

    static _showManager = null;

    //{item:0,itemShow:'a',itemOnpressCllback:_xxxx}
    /**
     * normal choice
     * @param title
     * @param items
     */
    static showNormalChoiceDialog = (title, items) => {
        this._showManager = new RootSiblings(<NormalChoiceDialogContainer
            title={title}
            items={items}
            visible={true}
            hide={() => DialogManagerUtil.hide()}
        >
        </NormalChoiceDialogContainer>);
    };

    /**
     * normal loading
     */
    static showNormalLoadingDialog = () => {
        this._showManager = new RootSiblings(<NormalLoadingDialogContainer
            visible={true}
            hide={() => DialogManagerUtil.hide()}
        >
        </NormalLoadingDialogContainer>);
    };


    static hide = () => {
        if (this._showManager instanceof RootSiblings) {
            this._showManager.destroy();
        } else {
            console.warn(`Toast.hide expected a \`RootSiblings\` instance as argument.\nBut got \`${typeof toast}\` instead.`);
        }
    };
}
