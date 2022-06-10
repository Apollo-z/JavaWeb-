package com.ysw.web.servlet.Admin;

import com.ysw.web.entity.Pro;
import com.ysw.web.service.ProService;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/adminAddPro")
public class AdminAddProServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        //判断表单是否支持文件上传,如:enctype = "multipart/form-data"
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        //如果不是的话,isMultipart为false,取反为true
        if (!isMultipart) {
            throw new RuntimeException("表单必须设置为multipart/form-data类型");
        }

        try {
            //创建DiskFileItemfactory工厂类，用于创建ServletFileUpload对象
            DiskFileItemFactory factory = new DiskFileItemFactory();
            // 创建ServletFileUpload对象
            ServletFileUpload sfu = new ServletFileUpload(factory);
            //解决上传表单项中乱码的问题
            sfu.setHeaderEncoding("UTF-8");

            //可以在此处限制上传文件的大小
            sfu.setFileSizeMax(1020*1024);   //表示单个文件最大不能超过1M
            sfu.setSizeMax(1024*1024*2);    //表示多个上传文件合计最大不能超过2M

            //解析request对象得到一个表单项FileItem的集合
            List<FileItem> fileItems = sfu.parseRequest(request);

            //初始化一个pro对象
            Pro pro = new Pro();

            //遍历表单项数据
            for (FileItem fileItem : fileItems){
                //处理上传文件表单项
                if(!fileItem.isFormField()){

                    //获取存储上传文件的目录的绝对路径，这里我们图片都保存到proimages目录下
                    String uploadPath = this.getServletContext().getRealPath("/proimages");
                    //获取上传文件的名称  "/proimages"
                    String fileName = fileItem.getName();   //文件名称(可能带客户端的路径)
                    fileName = FilenameUtils.getName(fileName);     //文件名称(不带路径)

                    //根据目录路径和文件创建一个file对象
                    File uploadFile = new File(uploadPath,fileName);

                    //上传文件，删除临时文件
                    fileItem.write(uploadFile);
                    //将filename存入request域
                    //request.setAttribute("filename",fileName);
                    pro.setpImg(fileName);
                } else {

                    //处理普通表单项

                    String fileName = fileItem.getFieldName();  //字段名:username
                    String fileValue = fileItem.getString("UTF-8"); //字段值:张三

                    //如果表单的name是pName的话就设置pro的pName，产品名
                    if ("pName".equals(fileName)) {
                        pro.setpName(fileValue);
                    }

                    //如果表单项的name是pSn的话就设置pro的pSn，产品简介
                    if ("pSn".equals(fileName)) {
                        pro.setpSn(fileValue);
                    }

                    //如果表单项的name是pNum的话就设置pro的pNum，库存
                    if ("pNum".equals(fileName)) {
                        pro.setpNum(Integer.parseInt(fileValue));
                    }

                    //市场价
                    if ("mPrice".equals(fileName)) {
                        pro.setmPrice(Double.parseDouble(fileValue));
                    }

                    //官网价
                    if ("iPrice".equals(fileName)) {
                        pro.setiPrice(Double.parseDouble(fileValue));
                    }

                    //类别
                    if ("cid".equals(fileName)) {
                        pro.setCid(Integer.parseInt(fileValue));
                    }
                }
            }

            //调用service层存入数据库
            ProService proService = new ProService();
            proService.addPro(pro);
//            request.getRequestDispatcher("success.jsp").forward(request,response);
            response.sendRedirect("admin/index.jsp");
        } catch (FileUploadException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
