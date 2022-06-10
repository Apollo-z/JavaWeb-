package com.ysw.web.entity;

/**
 * 用于展示订单详情给用户和管理员的实体类
 */
public class UserMso {

    private Integer id;         //订单id
    private String msoid;       //订单号
    private String msoname;     //用户名
    private String telephone;   //电话
    private String msoTime;     //购买时间
    private String paystate;    //是否付款
    private Double subtotal;    //用户付款的总价
    private String address;     //地址
    private String userid;      //用户id
    private String deliveryState;   //是否发货
    private Integer count;      //订单中单个商品的数量
    private Integer proid;      //产品的id
    private Double singleprototal;  //单个商品交易的总价
    private String pImg;        //产品图片
    private String pSn;         //产品简介

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

    public String getMsoTime() {
        return msoTime;
    }

    public void setMsoTime(String msoTime) {
        this.msoTime = msoTime;
    }

    public String getPaystate() {
        return paystate;
    }

    public void setPaystate(String paystate) {
        this.paystate = paystate;
    }

    public Double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(Double subtotal) {
        this.subtotal = subtotal;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getDeliveryState() {
        return deliveryState;
    }

    public void setDeliveryState(String deliveryState) {
        this.deliveryState = deliveryState;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Integer getProid() {
        return proid;
    }

    public void setProid(Integer proid) {
        this.proid = proid;
    }

    public Double getSingleprototal() {
        return singleprototal;
    }

    public void setSingleprototal(Double singleprototal) {
        this.singleprototal = singleprototal;
    }

    public String getpImg() {
        return pImg;
    }

    public void setpImg(String pImg) {
        this.pImg = pImg;
    }

    public String getpSn() {
        return pSn;
    }

    public void setpSn(String pSn) {
        this.pSn = pSn;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("UserMso{");
        sb.append("id=").append(id);
        sb.append(", msoid='").append(msoid).append('\'');
        sb.append(", msoname='").append(msoname).append('\'');
        sb.append(", telephone='").append(telephone).append('\'');
        sb.append(", msoTime='").append(msoTime).append('\'');
        sb.append(", paystate='").append(paystate).append('\'');
        sb.append(", subtotal=").append(subtotal);
        sb.append(", address='").append(address).append('\'');
        sb.append(", userid='").append(userid).append('\'');
        sb.append(", deliveryState='").append(deliveryState).append('\'');
        sb.append(", count=").append(count);
        sb.append(", proid=").append(proid);
        sb.append(", singleprototal=").append(singleprototal);
        sb.append(", pImg='").append(pImg).append('\'');
        sb.append(", pSn='").append(pSn).append('\'');
        sb.append('}');
        return sb.toString();
    }
}
