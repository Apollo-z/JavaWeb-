<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>My JSP starting page</title>
</head>

<body>
<h1>
    <%
        try {
            //��������
            Class.forName("com.mysql.jdbc.Driver");
            //��������
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root","mysql");
            //����״̬
            Statement state=con.createStatement();
            //����
            String sql="insert into student values('Gosling','java'),('002','zxy')";
            state.executeUpdate(sql);
            //����
            String sql1="update student set stuID='001' where stuName='java'";
            state.executeUpdate(sql1);
            //�޸�
            String sql3="update student set stuName='html' where stuID='002'";
            state.executeUpdate(sql3);
            //��ѯ
            String sql2="select stuID,stuName from student where stuID='001'";


            ResultSet rs=state.executeQuery(sql2);
            while(rs.next()){
                String uID=rs.getString("StuID");
                String uName=rs.getString("stuName");

                out.println("stuID:"+uID+"  "+"stuName:"+uName+"");
            }
            out.println("Operator success..."+"");
            state.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
</h1>
</body>
</html>
