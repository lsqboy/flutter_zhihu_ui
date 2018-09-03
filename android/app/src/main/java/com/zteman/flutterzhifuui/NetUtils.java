package com.zteman.flutterzhifuui;

import android.app.Activity;
import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Build;
import android.text.TextUtils;
import android.util.Log;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

/**
 * Created by Administrator on 2017/4/14.
 */
public class NetUtils {
    //private static LoadingDialog dialog;
    /**
     * 检测网络是否连接
     *
     * @return
     */
    public static boolean isNetworkAvailable(Context context) {
        // 得到网络连接信息
        ConnectivityManager manager = (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
        // 去进行判断网络是否连接
        if (manager.getActiveNetworkInfo() != null) {
            return manager.getActiveNetworkInfo().isAvailable();
        }
        return false;
    }


    /* @category 判断是否有外网连接（普通方法不能判断外网的网络是否连接，比如连接上局域网）
            * @return
            */
    public static final boolean ping() {

        String result = null;
        try {
            String ip = "www.baidu.com";// ping 的地址，可以换成任何一种可靠的外网
            Process p = Runtime.getRuntime().exec("ping -c 3 -w 100 " + ip);// ping网址3次
            // 读取ping的内容，可以不加
            InputStream input = p.getInputStream();
            BufferedReader in = new BufferedReader(new InputStreamReader(input));
            StringBuffer stringBuffer = new StringBuffer();
            String content = "";
            while ((content = in.readLine()) != null) {
                stringBuffer.append(content);
            }
            Log.d("------ping-----", "result content : " + stringBuffer.toString());
            // ping的状态
            int status = p.waitFor();
            if (status == 0) {
                result = "success";
                return true;
            } else {
                result = "failed";
            }
        } catch (IOException e) {
            result = "IOException";
        } catch (InterruptedException e) {
            result = "InterruptedException";
        } finally {
            Log.d("----result---", "result = " + result);
        }
        return false;
    }


    /**
     * 没有连接网络
     */
    private static final int NETWORK_NONE = -1;
    /**
     * 移动网络
     */
    private static final int NETWORK_MOBILE = 0;
    /**
     * 无线网络
     */
    private static final int NETWORK_WIFI = 1;
    /**
     * 以太网
     */
    private static final int NETWORK_ETHERNET = 9;


    public static int getNetWorkState(Context context) {
        // 得到连接管理器对象
        ConnectivityManager connectivityManager = (ConnectivityManager) context
                .getSystemService(Context.CONNECTIVITY_SERVICE);

        NetworkInfo activeNetworkInfo = connectivityManager
                .getActiveNetworkInfo();
        if (activeNetworkInfo != null && activeNetworkInfo.isConnected()) {

            if (activeNetworkInfo.getType() == (ConnectivityManager.TYPE_WIFI)) {
                return NETWORK_WIFI;
            } else if (activeNetworkInfo.getType() == (ConnectivityManager.TYPE_MOBILE)) {
                return NETWORK_MOBILE;
            }else if(activeNetworkInfo.getType() == (ConnectivityManager.TYPE_ETHERNET)){
                return NETWORK_ETHERNET;
            }
        } else {
            return NETWORK_NONE;
        }
        return NETWORK_NONE;
    }

    public static void  errorMsg(Activity activity, String errorMessage)
    {
        String message = "";
        if(!TextUtils.isEmpty(errorMessage)){
            if(errorMessage.contains("500")){
                message = "服务器无响应[500]";
            }else if(errorMessage.contains("404")){
                message = "访问的数据不存在[404]";
            }else if(errorMessage.contains("403")){
                message = "无访问权限[403]";
            }else if(errorMessage.contains("400")){
                message = "请求出错[400]";
            }else if(errorMessage.contains("502")){
                message = "请求失败：错误的网关[502]";
            }else if(errorMessage.contains("408")) {
                message = "网络请求超时[408]";
            } else if(errorMessage.contains("timeout")) {
                message = "网络请求超时";
            }else if(errorMessage.contains("504")) {
                message = "网关超时[504]";
            }else if(errorMessage.contains("No address associated with hostname")){
                message = "请检查网络是否正常";
            }
        }

//        else {
//            message = "网络请求失败，请检查您的网络设置！";
//        }


    }

}
