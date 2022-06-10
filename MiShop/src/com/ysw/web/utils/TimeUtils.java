package com.ysw.web.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeUtils {

    //获取当前时间的方法
    public static String getTime(){
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String currentTime = sdf.format(date);
        return currentTime;
    }

    //生成一个订单号
    public static String getDingdanNumber(){
        String msg = "";
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("YYYYMMddHHmmssSSS");
        msg = msg + sdf.format(date);
        //生成一个订单号
        return msg;
    }

    public static void main(String[] args) {
        System.out.println(TimeUtils.getDingdanNumber());
    }

}

