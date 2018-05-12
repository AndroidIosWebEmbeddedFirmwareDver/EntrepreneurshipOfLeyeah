import React, {
    PureComponent
} from 'react';
import {
    View
} from 'react-native';

import ProgressBarDialog from './dialog.progress.bar.dialog';

class CommonProgressBarDialogComponent extends PureComponent {
    constructor(props) {
        super(props);
        this.state = {
            progress: 0,
            progressModalVisible: false
        };
    }

    //1.Component即将加载
    componentWillMount() {
        if (this.props.progress) {
            this.state.progress = this.props.progress;
            this.setState({
                progress: this.state.progress,
            });
        }
        if (this.props.progressModalVisible) {
            this.state.progressModalVisible = this.props.progressModalVisible;
            this.setState({
                progressModalVisible: this.state.progressModalVisible,
            });
        }
    }

    //2.Component加载完毕
    componentDidMount() {

    }

    refProgressBar = (view) => {
        this.progressBar = view;
    }

    showProgressBar = () => {
        this.setState({
            progressModalVisible: true
        });
    }

    dismissProgressBar = () => {
        this.setState({
            progress: 0,
            progressModalVisible: false
        });
    }

    setProgressValue = (progress) => {
        this.setState({
            progress
        });
    }

    onProgressRequestClose = () => {
        this.dismissProgressBar();
    }

    canclePress = () => {
        this.dismissProgressBar();
    }

    render() {
        return (
            <View>
                <ProgressBarDialog
                    ref={this.refProgressBar}
                    progress={this.state.progress}
                    progressModalVisible={this.state.progressModalVisible}
                    onRequestClose={this.onProgressRequestClose}
                    canclePress={this.canclePress}
                    needCancle={true}
                />
            </View>
        )
    }
}

export default CommonProgressBarDialogComponent;
