import React, {PureComponent, Component, PropTypes} from 'react';
import {
    StyleSheet,
    TouchableOpacity,
    View,
    Text,
    TextInput,
    Button,
    ScrollView,
    Dimensions,
    Alert,
    Modal,
    Image,
} from 'react-native';

const {
    width,
    height
} = Dimensions.get('window');

export default class TableBar extends PureComponent {

    static propTypes = {
        //items
        items: PropTypes.instanceOf(Array),
        tableBarHeight: PropTypes.number,
        tableBarIndactorHeight: PropTypes.number,
        displayOptions: PropTypes.object
    };

    static defaultProps = {
        items: null,
        tableBarHeight: 64,
        tableBarIndactorHeight: 4,
    };

    //1.
    constructor(props) {
        super(props);
        this.state = {
            items: [],
            selectIndex: 0,
        };
    }

    //2.
    componentWillMount() {
        if (this.props.items) {
            this.setState({
                items: this.props.items,
            });
        }
    }

    //3.
    componentDidMount() {

    }

    //4.
    componentWillUnMount() {

    }

    _table_bar_items_view_onSelected = (index) => {
        this.setState({
            selectIndex: index,
        });
        if (this.props.onTableBarItemSelected) {
            this.props.onTableBarItemSelected(index);
        }
    };

    _render_table_bar_items_view = () => {
        let itemViews = [];
        if (this.state.items) {
            for (let index = 0; index < this.state.items.length; index++) {
                itemViews.push(
                    <TouchableOpacity
                        key={index}
                        style={TableBarStyles.item_view}
                        onPress={() => this._table_bar_items_view_onSelected(index)}
                    >
                        <View style={TableBarStyles.item_view_function_view}>
                            <Text
                                style={TableBarStyles.normal_text}>{this.state.items[index].show}</Text>
                        </View>
                        <View
                            style={[TableBarStyles.item_view_cut_line_view
                                , {height: TableBar.defaultProps.tableBarIndactorHeight}
                                , this.state.selectIndex === index ? {backgroundColor: '#FFFFFF'} : {backgroundColor: '#FFCC33'}]}/>

                    </TouchableOpacity>
                );
            }
        }
        return itemViews;
    };

    render() {
        return (
            <View
                style={[TableBarStyles.container, {height: TableBar.defaultProps.tableBarHeight}]}>
                <View
                    // style={[TableBarStyles.container, {height: TableBar.defaultProps.tableBarHeight}, this.props.showBgShadow ? TableBarStyles.bg_shoaow : {}]}>
                    style={[TableBarStyles.container_container]}>
                    {this.state.items ?
                        this._render_table_bar_items_view().map((itemView, index) => {
                            return itemView;
                        })
                        : <View/>
                    }
                </View>
                {
                    this.props.showBgShadow ?
                        <View style={[TableBarStyles.container_bg_shoaow]}/>
                        : <View/>
                }
            </View>
        );
    };
}

TableBarStyles = StyleSheet.create({
    //基于flex-box布局
    container: {
        width: width,
        height: 56,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FFCC33',
    },
    container_container: {
        width: width,
        flex: 1,
        flexDirection: 'row',//row ,row-reverse ,column ('default') column-reverse
        backgroundColor: '#FFCC33',
    },
    container_bg_shoaow: {
        shadowColor: '#000',
        height: 2,
        shadowOffset: {
            width: 5,
            height: 5,
        },
        shadowOpacity: 0.8,
        shadowRadius: 9.6,
        elevation: 10,
    },
    item_view: {
        flex: 1,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
    },
    item_view_function_view: {
        flex: 1,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
        alignItems: 'center',
        justifyContent: 'center',
    },
    item_view_cut_line_view: {
        height: 20,
        flexDirection: 'column',//row ,row-reverse ,column ('default') column-reverse
    },
    normal_text: {
        fontSize: 16,
    }
});
