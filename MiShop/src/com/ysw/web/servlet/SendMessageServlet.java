package com.ysw.web.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

//发送短信的servlet
@WebServlet("/send")
public class SendMessageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //这里去“短信包申请一个账号即可，5块钱50条短信”
        String testUsername = "";   //这里输入账号
        String testPassword = "";   //这里输入密码
        String testPhone = request.getParameter("telephone");
        System.out.println(testPhone);
        int number = (int)((Math.random() * 9.0D + 1.0D) * 100000.0D);
        HttpSession session = request.getSession();
        session.setAttribute("num", String.valueOf(number));
        String testContent = "【宇宙世界】您所订阅的开普勒行星即将抵达地球，本次您的验收暗号是" + number + ",５分钟内有效。若非本人操作请忽略此消息。祝您生活愉快！";
        String httpUrl = "http://api.smsbao.com/sms";
        StringBuffer httpArg = new StringBuffer();
        httpArg.append("u=").append(testUsername).append("&");
        httpArg.append("p=").append(md5(testPassword)).append("&");
        httpArg.append("m=").append(testPhone).append("&");
        httpArg.append("c=").append(encodeUrlString(testContent, "UTF-8"));
        String result = request(httpUrl, httpArg.toString());
        response.getWriter().print(result);
    }

    public static String request(String httpUrl, String httpArg) {
        BufferedReader reader = null;
        String result = null;
        StringBuffer sbf = new StringBuffer();
        httpUrl = httpUrl + "?" + httpArg;

        try {
            URL url = new URL(httpUrl);
            HttpURLConnection connection = (HttpURLConnection)url.openConnection();
            connection.setRequestMethod("GET");
            connection.connect();
            InputStream is = connection.getInputStream();
            reader = new BufferedReader(new InputStreamReader(is, "UTF-8"));
            String strRead = reader.readLine();
            if (strRead != null) {
                sbf.append(strRead);

                while((strRead = reader.readLine()) != null) {
                    sbf.append("\n");
                    sbf.append(strRead);
                }
            }

            reader.close();
            result = sbf.toString();
        } catch (Exception var9) {
            var9.printStackTrace();
        }

        return result;
    }

    public static String md5(String plainText) {
        StringBuffer buf = null;

        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(plainText.getBytes());
            byte[] b = md.digest();
            buf = new StringBuffer("");

            for(int offset = 0; offset < b.length; ++offset) {
                int i = b[offset];
                if (i < 0) {
                    i += 256;
                }

                if (i < 16) {
                    buf.append("0");
                }

                buf.append(Integer.toHexString(i));
            }
        } catch (NoSuchAlgorithmException var6) {
            var6.printStackTrace();
        }

        return buf.toString();
    }

    public static String encodeUrlString(String str, String charset) {
        String strret = null;
        if (str == null) {
            return str;
        } else {
            try {
                strret = URLEncoder.encode(str, charset);
                return strret;
            } catch (Exception var4) {
                var4.printStackTrace();
                return null;
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
