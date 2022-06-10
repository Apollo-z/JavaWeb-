package com.ysw.web.entity;

/**
 * 评论实体类
 */
public class Comment {

    private Integer id;         //评论id
    private Integer proid;      //产品id
    private Double score;       //产品打分
    private Integer userid;     //用户id
    private String comments;    //评论内容
    private String time;        //评论时间
    private String name;        //用户名

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getProid() {
        return proid;
    }

    public void setProid(Integer proid) {
        this.proid = proid;
    }

    public Double getScore() {
        return score;
    }

    public void setScore(Double score) {
        this.score = score;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("Comment{");
        sb.append("id=").append(id);
        sb.append(", proid=").append(proid);
        sb.append(", score=").append(score);
        sb.append(", userid=").append(userid);
        sb.append(", comments='").append(comments).append('\'');
        sb.append(", time='").append(time).append('\'');
        sb.append(", name='").append(name).append('\'');
        sb.append('}');
        return sb.toString();
    }
}
