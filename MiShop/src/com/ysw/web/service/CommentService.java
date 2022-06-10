package com.ysw.web.service;

import com.ysw.web.dao.CommentDao;
import com.ysw.web.entity.Comment;

import java.util.List;

/**
 *
 */
public class CommentService {

    CommentDao commentDao = new CommentDao();

    /**
     * 根据产品的id返回一个集合
     *
     * @param proid
     * @return
     */
    public List<Comment> findByProid(Integer proid){
        return commentDao.findByProid(proid);
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
        return commentDao.addComment(proid,score,userid,comments);
    }
}
