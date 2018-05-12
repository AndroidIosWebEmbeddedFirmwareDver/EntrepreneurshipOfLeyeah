package com.leyeah;

import android.app.Activity;
import android.content.Context;
import android.graphics.Color;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.support.v4.content.FileProvider;
import android.view.WindowManager;

import com.facebook.react.ReactInstanceManager;
import com.facebook.react.bridge.ReactContext;
import com.facebook.react.ReactActivity;

import com.mehcode.reactnative.splashscreen.SplashScreen;

import java.io.File;

public class MainActivity extends ReactActivity {

    /**
     * Returns the name of the main component registered from JavaScript.
     * This is used to schedule rendering of the component.
     */
    @Override
    protected String getMainComponentName() {
        return "leyeah";
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        // Show the js-controlled splash screen
        SplashScreen.show(this, getReactInstanceManager());
        super.onCreate(savedInstanceState);
//
//        if(Build.VERSION.SDK_INT >= Build.VERSION_CODES.KITKAT) {
//            //透明状态栏
//            getWindow().addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);
//            //透明导航栏
//            getWindow().addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_NAVIGATION);
//        }
    }

    private void openAFile(Context context, String filePath) {
        Uri uri = null;
        if (Build.VERSION.SDK_INT >= 24) {
            uri = FileProvider.getUriForFile(context.getApplicationContext(), "com.leyeah.provider", new File(filePath));
        } else {
            uri = Uri.fromFile(new File(filePath));
        }

//        Intent intent = new Intent(Intent.ACTION_VIEW);
//        Uri uri = null;
//        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
//            uri = FileProvider.getUriForFile(context,
//                    "app的包名.fileprovider",file);
//            intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
//        } else {
//            uri = Uri.fromFile(tempFile);
//        }
//        addUiIntentFlags(intent);
//        intent.setDataAndType(uri, mimeType);
//        startActivity(intent);
    }

}

