package com.ysw.web.entity;

import java.util.List;

/**
 *  分页实体类
 */
public class PageBeanUser {

    private Integer currentPage;        //当前页码数
    private Integer pageSize;           //每页记录数
    private Integer count;              //总记录数
    private Integer totalPage;          //总页数
    private List<User> users;             //当前页的数据集合，这个是用于保存当前分页的数据的

    public Integer getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(Integer currentPage) {
        this.currentPage = currentPage;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Integer getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(Integer totalPage) {
        this.totalPage = totalPage;
    }

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("PageBeanUser{");
        sb.append("currentPage=").append(currentPage);
        sb.append(", pageSize=").append(pageSize);
        sb.append(", count=").append(count);
        sb.append(", totalPage=").append(totalPage);
        sb.append(", users=").append(users);
        sb.append('}');
        return sb.toString();
    }
}
