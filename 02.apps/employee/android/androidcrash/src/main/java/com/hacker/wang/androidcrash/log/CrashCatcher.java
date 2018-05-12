package com.hacker.wang.androidcrash.log;

import android.os.Looper;
import android.util.Log;

import com.hacker.wang.androidcrash.util.AssertUtil;

import java.io.File;

/**
 * C
 * Created by wangxiaolong on 2017/11/28.
 */

public class CrashCatcher implements Thread.UncaughtExceptionHandler {
    private static final String LOG_TAG = CrashCatcher.class.getSimpleName();

    private static final CrashCatcher sHandler = new CrashCatcher();

    private CrashListener mListener;
    private File mLogFile;

    public static CrashCatcher getInstance() {
        return sHandler;
    }

    @Override
    public void uncaughtException(final Thread thread, final Throwable ex) {
        try {
            LogWriter.writeLog(mLogFile, "CrashHandler", ex.getMessage(), ex);
        } catch (Exception e) {
            Log.w(LOG_TAG, e);
        }

        mListener.sendFile(mLogFile);
        new Thread(new Runnable() {
            @Override
            public void run() {
                Looper.prepare();
                try {
                    mListener.closeApp(thread, ex);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                Looper.loop();
            }
        }).start();
    }

    /**
     * 初始化日志文件及CrashListener对象
     *
     * @param logFile  保存日志的文件
     * @param listener 回调接口
     */
    public void init(File logFile, CrashListener listener) {
        AssertUtil.assertNotNull("logFile", logFile);
        AssertUtil.assertNotNull("crashListener", listener);
        mLogFile = logFile;
        mListener = listener;
    }
}