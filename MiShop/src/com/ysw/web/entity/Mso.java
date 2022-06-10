package com.ysw.web.entity;

import java.util.ArrayList;
import java.util.List;

//订单实体类
public class Mso {

    private Integer id;         //订单编号
    private String msoid;       //订单号码
    private String msoname;     //订单人姓名
    private String telephone;   //订单人电话
    private String address;     //收货地址
    private String msoTime;     //订单时间
    private String msostate;    //订单收发货状态,默认的是发货
    private Double subtotal;    //订单总金额
    private String payState;    //订单付款状态
    private Integer userid;     //购买的用户的id

    //这个用于存储订单项的
    private List<Msoxq> msoxqs= new ArrayList<>();

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMsoid() {
        return msoid;
    }

    public void setMsoid(String msoid) {
        this.msoid = msoid;
    }

    public String getMsoname() {
        return msoname;
    }

    public void setMsoname(String msoname) {
        this.msoname = msoname;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getMsoTime() {
        return msoTime;
    }

    public void setMsoTime(String msoTime) {
        this.msoTime = msoTime;
    }

    public String getMsostate() {
        return msostate;
    }

    public void setMsostate(String msostate) {
        this.msostate = msostate;
    }

    public Double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(Double subtotal) {
        this.subtotal = subtotal;
    }

    public String getPayState() {
        return payState;
    }

    public void setPayState(String payState) {
        this.payState = payState;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public List<Msoxq> getMsoxqs() {
        return msoxqs;
    }

    public void setMsoxqs(List<Msoxq> msoxqs) {
        this.msoxqs = msoxqs;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("Mso{");
        sb.append("id=").append(id);
        sb.append(", msoid='").append(msoid).append('\'');
        sb.append(", msoname='").append(msoname).append('\'');
        sb.append(", telephone='").append(telephone).append('\'');
        sb.append(", address='").append(address).append('\'');
        sb.append(", msoTime='").append(msoTime).append('\'');
        sb.append(", msostate='").append(msostate).append('\'');
        sb.append(", subtotal=").append(subtotal);
        sb.append(", payState='").append(payState).append('\'');
        sb.append(", userid=").append(userid);
        sb.append(", msoxqs=").append(msoxqs);
        sb.append('}');
        return sb.toString();
    }
}
