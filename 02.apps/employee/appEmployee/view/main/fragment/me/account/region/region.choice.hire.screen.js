import React, {Component} from 'react';
import {
    Text,
    ScrollView,
    Image,
    Button,
    View,
    Platform,
    PixelRatio,
    Alert,
    TextInput,
    FlatList,
    CheckBox,
    Dimensions,
    ActivityIndicator,
    TouchableOpacity,
    InteractionManager,
} from 'react-native';

import regionChoiceStyles from './region.choice.hire.style'
import BaseActivity from "../../../../../views/base.activity"
import ToastManager from '../../../../../../utils/toast/Toast.util'
import NetworkCommonUtil from '../../../../../../utils/network.common.util'
import HeaderCommonView from '../../../../../views/header/header.common.view'

class ResgionChoiceHireScreenListItem extends Component {
    constructor(props) {
        super(props);
    }


    _showProps = () => {
        this.props.onSelectPress();
        this.setState({
            isSelected: !this.state.isSelected,
        });
    };

    render() {
        return (
            <TouchableOpacity
                style={[regionChoiceStyles.itemContainer, {backgroundColor: this.props.isItemSelected ? '#FBFBFB' : '#FFFFFF'}]}
                onPress={this.props.onSelectPress}
            >
                <View style={regionChoiceStyles.itemHeadContainer}>
                    <Text
                        style={regionChoiceStyles.itemHeadContainerLeft}>{this.props.showTitle}</Text>
                </View>
                <View style={regionChoiceStyles.itemBottomContainer}/>
            </TouchableOpacity>
        );
    }
}


export default class ResgionChoiceHireScreen extends BaseActivity {
    constructor(props) {
        super(props);
        this.state = {
            responProvinceValue: '',
            responCityValue: '',
            responAreaAndCountyValue: '',
            selectedProvince: '',
            selectedCity: '',
            selectedAreaAndCounty: '',
        };
    }

    //2.
    componentWillMount() {
        super.componentWillMount();
    }

    //3.
    componentDidMount() {
        super.componentDidMount();
        // InteractionManager.runAfterInteractions(() => {
        //     //处理消耗时间和性能的任务，把主线程让出来加载UI
        //     this.initQueryProvinceData();
        // });
        this.initQueryProvinceData();
    }

    //4.
    componentWillUnmount() {
        super.componentWillUnmount();
    }


    //keyExtractor tells the list to use the ids for the react keys instead of the default key property.
    _keyExtractorProvince = (item, index) => index;
    _keyExtractorCity = (item, index) => index;
    _keyExtractorAreaAndCounty = (item, index) => index;

    initQueryProvinceData = () => {
        //默认为中国
        NetworkCommonUtil.httpGetRequest(NetworkCommonUtil.SERVERURL_SYS_REGION_PROVINCE.concat('?countryId=1')).then((val: any) => {
            // alert(JSON.stringify(val));
            if (val && val.code === 1001) {
                this.setState({responProvinceValue: val});
            }
        });
    };

    _renderProvinceFlatListItem = (item, index) => {
        return (
            <ResgionChoiceHireScreenListItem
                id={item.id}
                showTitle={this.state.responProvinceValue.data[index].regionName}
                isItemSelected={this.state.responProvinceValue.data[index].selected}
                onSelectPress={() => this._onProvinceFlatListItemPress(item, index)}
            />
        );
    };

    _onProvinceFlatListItemPress = (item, index) => {
        for (let i of this.state.responProvinceValue.data) {
            i.selected = false;
        }
        this.state.responProvinceValue.data[index].selected = true;
        this.state.selectedProvince = this.state.responProvinceValue.data[index];
        this.setState({
            responProvinceValue: this.state.responProvinceValue,
            selectedProvince: this.state.selectedProvince,
            responCityValue: '',
            selectedCity: '',
            responAreaAndCountyValue: '',
            selectedAreaAndCounty: '',
        });
        this.initQueryCityData(this.state.selectedProvince);

    };


    initQueryCityData = (province) => {
        NetworkCommonUtil.httpGetRequest(NetworkCommonUtil.SERVERURL_SYS_REGION_CITY.concat('?provinceId=').concat(province.pkId)).then((val: any) => {
            // alert(JSON.stringify(val));
            if (val && val.code === 1001) {
                this.setState({responCityValue: val});
            }
        });
    };
    _renderCityFlatListItem = (item, index) => {
        return (
            <ResgionChoiceHireScreenListItem
                id={item.id}
                showTitle={this.state.responCityValue.data[index].regionName}
                isItemSelected={this.state.responCityValue.data[index].selected}
                onSelectPress={() => this._onCityFlatListItemPress(index)}
            />
        );
    };
    _onCityFlatListItemPress = (index) => {
        for (let i of this.state.responCityValue.data) {
            i.selected = false;
        }
        this.state.responCityValue.data[index].selected = true;
        this.state.selectedCity = this.state.responCityValue.data[index];
        this.setState({
            responCityValue: this.state.responCityValue,
            selectedCity: this.state.responCityValue.data[index],
            responAreaAndCountyValue: '',
            selectedAreaAndCounty: '',
        });
        this.initQueryAreaAndCountyData(this.state.selectedCity);
    };


    initQueryAreaAndCountyData = (city) => {
        NetworkCommonUtil.httpGetRequest(NetworkCommonUtil.SERVERURL_SYS_REGION_AREAANDCOUNTY.concat('?parentId=').concat(city.pkId)).then((val: any) => {
            // alert(JSON.stringify(val));
            this.setState({responAreaAndCountyValue: val});
        });
    };
    _renderAreaAndCountyFlatListItem = (item, index) => {
        return (
            <ResgionChoiceHireScreenListItem
                id={item.id}
                showTitle={this.state.responAreaAndCountyValue.data[index].regionName}
                isItemSelected={this.state.responAreaAndCountyValue.data[index].selected}
                onSelectPress={() => this._onAreaAndCountyFlatListItemPress(index)}
            />
        );
    };
    _onAreaAndCountyFlatListItemPress = (index) => {
        for (let i of this.state.responAreaAndCountyValue.data) {
            i.selected = false;
        }
        this.state.responAreaAndCountyValue.data[index].selected = true;
        this.state.selectedAreaAndCounty = this.state.responAreaAndCountyValue.data[index];
        this.setState({
            responAreaAndCountyValue: this.state.responAreaAndCountyValue,
            selectedAreaAndCounty: this.state.responAreaAndCountyValue.data[index],
        });
    };


    _renderCompontDownPress() {
        if (!this.state.selectedProvince) {
            ToastManager.show('你还没有选择省份', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
        } else if (!this.state.selectedCity) {
            ToastManager.show('你还没有选择城市', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
        } else if (!this.state.selectedAreaAndCounty) {
            ToastManager.show('你还没有选择区县', ToastManager.DURATION.SHORT, ToastManager.POSITION.BOTTOM);
        } else {
            // alert(JSON.stringify(this.state.responValue));
            if (this.props.cllbackSetSelectedAddress) {
                this.props.cllbackSetSelectedAddress(this.state.selectedProvince, this.state.selectedCity, this.state.selectedAreaAndCounty);
            }
            this.props.navigator.pop();

        }
    }

    render() {
        const {navigator} = this.props.navigator;
        return (
            <View style={regionChoiceStyles.container}>
                <HeaderCommonView navigator={this.props.navigator}
                                  bgColor={'#FFCC33'}
                                  headerLeftShow={true}
                                  headerCenterShow={true}
                                  headerRightShow={true}
                                  showCenterAfterLeft={true}
                                  headerRightButtonTitle={'完成'}
                                  headerRightButtonOnpress={() => this._renderCompontDownPress()}
                                  headerCenterTitle={'选择位置'}/>
                <View style={regionChoiceStyles.listHeaderContainer}>
                    <View style={[regionChoiceStyles.listHeaderContainerView, {
                        justifyContent: 'center',
                        alignItems: 'flex-end',
                    }]}>
                        <Text style={{
                            color: '#000000',
                            alignItems: 'center',
                            fontSize: 16,
                            paddingLeft: 9.6,
                            paddingRight: 9.6,
                        }}>
                            {this.state.selectedProvince && this.state.selectedProvince.regionName ? this.state.selectedProvince.regionName : '省份'}
                            /
                            {this.state.selectedCity && this.state.selectedCity.regionName ? this.state.selectedCity.regionName : '城市'}
                            /
                            {this.state.selectedAreaAndCounty && this.state.selectedAreaAndCounty.regionName ? this.state.selectedAreaAndCounty.regionName : '区县'}
                        </Text>
                    </View>
                </View>
                <View style={regionChoiceStyles.listContainer}>
                    <FlatList
                        style={regionChoiceStyles.listContainerView}
                        ref={(flatList) => this._flatListProvince = flatList}
                        data={this.state.responProvinceValue.data}
                        extraData={this.state}//额外的能引更新的数据，如果不设置，可能导致不会刷新
                        keyExtractor={this._keyExtractorProvince}
                        renderItem={({item, index}) => this._renderProvinceFlatListItem(item, index)}
                    />
                    <View style={{
                        width: 4.8,
                        backgroundColor: '#FBFBFB',
                    }}/>
                    <FlatList
                        style={regionChoiceStyles.listContainerView}
                        ref={(flatList) => this._flatListCity = flatList}
                        data={this.state.responCityValue.data}
                        extraData={this.state}//额外的能引更新的数据，如果不设置，可能导致不会刷新
                        keyExtractor={this._keyExtractorCity}
                        renderItem={({item, index}) => this._renderCityFlatListItem(item, index)}
                    />
                    <View style={{
                        width: 4.8,
                        backgroundColor: '#FBFBFB',
                    }}/>
                    <FlatList
                        style={regionChoiceStyles.listContainerView}
                        ref={(flatList) => this._flatListAreaAndCounty = flatList}
                        data={this.state.responAreaAndCountyValue.data}
                        extraData={this.state}//额外的能引更新的数据，如果不设置，可能导致不会刷新
                        keyExtractor={this._keyExtractorAreaAndCounty}
                        renderItem={({item, index}) => this._renderAreaAndCountyFlatListItem(item, index)}
                    />

                </View>


            </View>
        );
    };
}





