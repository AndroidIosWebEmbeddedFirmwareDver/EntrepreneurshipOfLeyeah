import React from 'react';
import {
    AsyncStorage,
} from 'react-native';
import Storage from 'react-native-storage'


const storage = new Storage({
    // 最大容量，默认值1000条数据循环存储
    size: 1000,

    // 存储引擎：对于RN使用AsyncStorage，对于web使用window.localStorage
    // 如果不指定则数据只会保存在内存中，重启后即丢失
    storageBackend: AsyncStorage,

    // 数据过期时间，默认一整天（1000 * 3600 * 24 毫秒），设为null则永不过期
    defaultExpires: 1000 * 3600 * 24 * 15,//根据业务需求，这里设置为15天

    // 读写时在内存中缓存数据。默认启用。
    enableCache: true,

    // 如果storage中没有相应数据，或数据已过期，
    // 则会调用相应的sync方法，无缝返回最新数据。
    // sync方法的具体说明会在后文提到
    // 你可以在构造函数这里就写好sync的方法
    // 或是在任何时候，直接对storage.sync进行赋值修改
    // 或是写到另一个文件里，这里require引入
    // sync: require('你可以另外写一个文件专门处理sync')

});
// 最好在全局范围内创建一个（且只有一个）storage实例，方便直接调用

// 对于web
// window.storage = storage;

// 对于react native
global.storage = storage;

// 这样，在此**之后**的任意位置即可以直接调用storage
// 注意：全局变量一定是先声明，后使用
// 如果你在某处调用storage报错未定义
// 请检查global.storage = storage语句是否确实已经执行过了

export default class AsyncstorageStorageCommonUtil {
    /**
     * 保存
     * @param key
     * @param id
     * @param data
     * @DESC 使用方法 save(key, id, data);
     */
    static save(key, id, data) {
        return storage.save(
            {
                key: key,
                id: id,
                data: data,
                // expires: 1000 * 60 //这里不单独设置，使用全局的
            }
        ).then(saveToMap => {
            return saveToMap;
        });
    }

    /**
     * 读取
     * @param key
     * @param id
     * @DESC 使用方法load(key, id).then((ret:any)=>{});
     */
    static load(key, id) {
        return storage.load({
            key: key,
            id: id,
            // autoSync(默认为true)意味着在没有找到数据或数据过期时自动调用相应的sync方法
            autoSync: true,
            // syncInBackground(默认为true)意味着如果数据过期，
            // 在调用sync方法的同时先返回已经过期的数据。
            // 设置为false的话，则等待sync方法提供的最新数据(当然会需要更多时间)。
            syncInBackground: true,
            //
            // // 你还可以给sync方法传递额外的参数
            // syncParams: {
            //     extraFetchOptions: {
            //         // 各种参数
            //     },
            //     someFlag: true,
            // },
        }).then(ret => {
            // 如果找到数据，则在then方法中返回
            // 注意：这是异步返回的结果（不了解异步请自行搜索学习）
            // 你只能在then这个方法内继续处理ret数据
            // 而不能在then以外处理
            // 也没有办法“变成”同步返回
            // 你也可以使用“看似”同步的async/await语法
            console.log(ret);

            return ret;
        }).catch(err => {
            //如果没有找到数据且没有sync方法，
            //或者有其他异常，则在catch中返回
            //开发模式可以直接在IOS设备上显示出来
            // console.warn(err.message);
            switch (err.name) {
                case 'NotFoundError':
                    // TODO;
                    break;
                case 'ExpiredError':
                    // TODO
                    break;
            }
        });
    }

    /**
     * 获取某个key下的所有id(仅key-id数据)
     * @param key
     * @returns {Promise.<TResult>|Promise.<*>|*}
     * @DESC 使用方法 getIdsForKey(key).then((ids:any)=>{});
     */
    static getIdsForKey(key) {
        return storage.getIdsForKey(key).then(ids => {
            console.log(ids);
            return ids;
        });
    }

    /**
     * 获取某个key下的所有数据(仅key-id数据)
     * @param key
     * @returns {Promise.<TResult>|Promise.<*>|*}
     * @DESC 使用方法 getAllDataForKey(key).then((datas:any)=>{});
     */
    static getAllDataForKey(key) {
        return storage.getAllDataForKey(key).then(datas => {
            console.log(datas);
            return datas;
        });
    }

    /**
     * 读取批量数据
     * @param keys
     * @returns {Promise.<TResult>|Promise.<*>|*}
     * @DESC 使用方法 getBatchData(...keys).then((ids:any)=>{});
     */
    static getBatchData(...keys) {
        let params = [];
        for (let key in keys) {
            params.push({key: key});
        }
        // 使用和load方法一样的参数读取批量数据，但是参数是以数组的方式提供。
        // 会在需要时分别调用相应的sync方法，最后统一返回一个有序数组。
        return storage.getBatchData(params)
            .then(results => {
                results.forEach(result => {
                    console.log(result);
                })

                return results;
            });
    }

    /**
     *
     * @param key
     * @param ids
     * @returns {Promise.<TResult>|Promise.<*>|*}
     * @DESC 使用方法 getBatchDataWithIds(key, ...ids).then((results => {
        });
     */
    static getBatchDataWithIds(key, ...ids) {
        //根据key和一个id数组来读取批量数据
        return storage.getBatchDataWithIds({
            key: key,
            ids: ids
        }).then(results => {
            return results;
        });
    }

    /**
     *  !! 清除某个key下的所有数据(仅key-id数据)
     * @param key
     * @DESC 使用方法 clearMapForKey(key);
     */
    static clearMapForKey(key) {
        storage.clearMapForKey(key);

    }

    /**
     * 删除单个数据
     * @param key
     * @DESC 使用方法 removeForKey(key);
     */
    static removeForKey(key) {
        storage.remove({
            key: key,
        });
    }

    /**
     *  删除单个数据
     * @param key
     * @param id
     * @DESC 使用方法 removeForKeyAndId(key,id);
     */
    static removeForKeyAndId(key, id) {
        storage.remove({
            key: key,
            id: id,
        });
    }

    /**
     * sync方法
     * @param key
     * @param id
     * @param data
     * @param url
     */
    static syncHttpData(key, id, data, url: string) {
        storage.sync = {
            // sync方法的名字必须和所存数据的key完全相同
            // 方法接受的参数为一整个object，所有参数从object中解构取出
            // 这里可以使用promise。或是使用普通回调函数，但需要调用resolve或reject。
            key(params) {
                let {id, resolve, reject, syncParams: {extraFetchOptions, someFlag}} = params;
                fetch(url,
                    {
                        method: 'GET',
                        headers: {
                            'Content-Type': 'application/json',
                            'Access-Control-Allow-Origin': '*',
                            'Access-Control-Allow-Credentials': 'true',
                            'Access-Control-Allow-Headers': 'Content-Type, Accept, X-Requested-With,' +
                            ' remember-me',
                        },
                    }
                ).then(response => {
                    return response.json();
                }).then(json => {
                    //console.log(json);
                    if (json && json.data) {
                        storage.save({
                            key: key,
                            id,
                            data: json.data
                        });

                        if (someFlag) {
                            // 根据syncParams中的额外参数做对应处理
                        }

                        // 成功则调用resolve
                        resolve && resolve(json.data);
                    }
                    else {
                        // 失败则调用reject
                        reject && reject(new Error('data parse error'));
                    }
                }).catch(err => {
                    console.warn(err);
                    reject && reject(err);
                });
            }
        }
    }


}