##fix log of enviroment



#### fix 'Error: Cannot find module '../lib/cli'' When create a new project by webstorm!
~~~
http://www.jianshu.com/p/e21023c536aa
------
rm -rf ./node_modules/
cnpm install
~~~



#### fix 'Unable to load script from assets 'index.android.bundle'. Make sure your bundle is packaged correctly or you're running a packager server.
~~~
http://blog.csdn.net/u013179982/article/details/73741958
http://blog.csdn.net/u014175342/article/details/73823904
------
解决方案：

第一步：在  android/app/src/main 目录下创建一个  assets空文件夹

第二步：执行 下面这段命令
react-native bundle --platform android --dev false --entry-file index.android.js --bundle-output android/app/src/main/assets/index.android.bundle --assets-dest android/app/src/main/res/ 
会发现 assets文件夹下多出两个文件
第三步：重新run程序。



总结：

这个index.android.bundle毫无疑问就是用来调用原生控件的js脚本，每次当你改变了 index.android.js，
你都需要使用上面的代码片段，来及时的更新index.android.bundle，然后打包才可以把新的index.android.js应用上，所以当没有index.android.bundle文件时，RN是无法运行的.
~~~



##fix log of project



