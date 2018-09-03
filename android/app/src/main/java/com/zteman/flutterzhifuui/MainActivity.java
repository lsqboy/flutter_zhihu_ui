package com.zteman.flutterzhifuui;

import android.Manifest;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.ConnectivityManager;
import android.net.Uri;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.text.TextUtils;
import android.widget.Toast;

import java.text.SimpleDateFormat;
import java.util.List;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;
import pub.devrel.easypermissions.AfterPermissionGranted;
import pub.devrel.easypermissions.EasyPermissions;

public class MainActivity extends FlutterActivity implements EasyPermissions.PermissionCallbacks {
    private static final String CHANNEL = "com.zteman.test/android";
    private static final String NET_CHANGE_CHANNEL = "com.zteman.test/netChanged";
    private String mPhoneNumber;
    private static final int RC_CALL_PHONE = 1001;
    private BroadcastReceiver netStateChangeReceiver;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);
        new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(
                (call, result) -> {
                    System.out.println(call.method);
                    if (call.method.equals("showToast")) {
                        if (call.hasArgument("msg") && !TextUtils.isEmpty(call.argument("msg").toString())) {
                            Toast.makeText(MainActivity.this, call.argument("msg").toString(), Toast.LENGTH_SHORT).show();
                        } else {
                            Toast.makeText(MainActivity.this, "toast text must not null", Toast.LENGTH_SHORT).show();
                        }
                    } else if (call.method.equals("callPhone")) {
                        mPhoneNumber = call.argument("msg").toString();
                        if (call.hasArgument("msg") && !TextUtils.isEmpty(mPhoneNumber)) {
                            methodRequiresCallPhone();
                        } else {
                            Toast.makeText(MainActivity.this, "call phone text must not null", Toast.LENGTH_SHORT).show();
                        }
                    } else if (call.method.equals("getAndroidTime")) {
                        result.success(getCurrentTime());
                    }else if (call.method.equals("netConnection")) {
                        boolean networkConnected = NetUtils.isNetworkAvailable(getApplicationContext());
                        result.success(networkConnected);
                    }
                });

        new EventChannel(getFlutterView(),NET_CHANGE_CHANNEL).setStreamHandler(new EventChannel.StreamHandler() {
            @Override
            public void onListen(Object o, EventChannel.EventSink events) {
                netStateChangeReceiver = createNetStateChangeReceiver(events);
                registerReceiver(netStateChangeReceiver, new IntentFilter(ConnectivityManager.CONNECTIVITY_ACTION));

            }

            @Override
            public void onCancel(Object o) {
                unregisterReceiver(netStateChangeReceiver);
                netStateChangeReceiver = null;
            }
        });
    }
    private BroadcastReceiver createNetStateChangeReceiver(final EventChannel.EventSink events) {
        return new BroadcastReceiver() {
            @Override
            public void onReceive(Context context, Intent intent) {
                boolean networkConnected = NetUtils.isNetworkAvailable(context);
                events.success(networkConnected?"网络可用":"网络不可用");
            }
        };
    }
    private String getCurrentTime() {
        return new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(System.currentTimeMillis());
    }

    @AfterPermissionGranted(RC_CALL_PHONE)
    private void methodRequiresCallPhone() {
        if (EasyPermissions.hasPermissions(this, android.Manifest.permission.CALL_PHONE)) {
            // Already have permission, do the thing
            Intent intent = new Intent(Intent.ACTION_DIAL, Uri.parse("tel:" + mPhoneNumber));
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            startActivity(intent);
        } else {
            // Do not have permissions, request them now
            EasyPermissions.requestPermissions(this, "拨打电话",
                    RC_CALL_PHONE, Manifest.permission.CALL_PHONE);
        }
    }

    @Override
    public void onPermissionsGranted(int requestCode, @NonNull List<String> perms) {

    }

    @Override
    public void onPermissionsDenied(int requestCode, @NonNull List<String> perms) {

    }
}
