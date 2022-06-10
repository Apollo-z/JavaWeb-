package com.ysw.web.dao;

import com.ysw.web.entity.Comment;
import com.ysw.web.utils.JDBCUtils;
import com.ysw.web.utils.TimeUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 评论的dao层
 */
public class CommentDao extends JDBCUtils {

    //根据产品id进行评论的展示
    public List<Comment> findByProid(Integer proid){

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        List<Comment> comments = new ArrayList<>();

        try {
            //创建资源连接对象
            conn = getConnection();
            //定义sql
            String sql = "SELECT * FROM COMMENT LEFT OUTER JOIN USER ON comment.userid = user.id WHERE proid = ? ORDER BY comment.id";
            //创建sql执行对象
            pstmt = conn.prepareStatement(sql);
            //给参数进行赋值
            pstmt.setInt(1,proid);
            //执行sql
            rs = pstmt.executeQuery();
            while (rs.next()){
                Comment comment = new Comment();

                comment.setId(rs.getInt("id"));
                comment.setProid(rs.getInt("proid"));
                comment.setScore(rs.getDouble("score"));
                comment.setUserid(rs.getInt("userid"));
                comment.setComments(rs.getString("comments"));
                comment.setTime(rs.getString("time"));
                comment.setName(rs.getString("name"));

                comments.add(comment);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs,pstmt,conn);
        }
        return comments;
    }

    /**
     * 插入评论信息到数据库
     *
     * @param proid
     * @param score
     * @param userid
     * @param comments
     * @return
     */
    public Integer addComment(Integer proid,Double score,Integer userid,String comments){
        String sql = "insert into comment(proid,score,userid,comments,time) values(?,?,?,?,?)";
        Object[] params = {proid,score,userid,comments, TimeUtils.getTime()};
        return myExecuteUpdate(sql,params);
    }

}
