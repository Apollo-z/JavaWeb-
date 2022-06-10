package com.ysw.web.entity;

/**
 * 管理员实体类
 */
public class Admin {

    private Integer adminid;
    private String adminname;
    private String adminpassword;

    public Integer getAdminid() {
        return adminid;
    }

    public void setAdminid(Integer adminid) {
        this.adminid = adminid;
    }

    public String getAdminname() {
        return adminname;
    }

    public void setAdminname(String adminname) {
        this.adminname = adminname;
    }

    public String getAdminpassword() {
        return adminpassword;
    }

    public void setAdminpassword(String adminpassword) {
        this.adminpassword = adminpassword;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("Admin{");
        sb.append("adminid=").append(adminid);
        sb.append(", adminname='").append(adminname).append('\'');
        sb.append(", adminpassword='").append(adminpassword).append('\'');
        sb.append('}');
        return sb.toString();
    }
}
