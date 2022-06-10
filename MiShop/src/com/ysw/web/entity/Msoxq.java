package com.ysw.web.entity;

/**
 * 订单详情实体类
 */
public class Msoxq {

    private String msoid;      //订单项id
    private Integer count;      //订单项内商品购买的数量
    private Double subtotal;    //总价
    private Pro pro;            //订单内购买的商品
    private Mso mso;            //该商品项目所属的订单对象
    private String pImg;        //图片地址
    private String pSn;         //商品名称

    public String getMsoid() {
        return msoid;
    }

    public void setMsoid(String msoid) {
        this.msoid = msoid;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(Double subtotal) {
        this.subtotal = subtotal;
    }

    public Pro getPro() {
        return pro;
    }

    public void setPro(Pro pro) {
        this.pro = pro;
    }

    public Mso getMso() {
        return mso;
    }

    public void setMso(Mso mso) {
        this.mso = mso;
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
        final StringBuffer sb = new StringBuffer("Msoxq{");
        sb.append("msoid='").append(msoid).append('\'');
        sb.append(", count=").append(count);
        sb.append(", subtotal=").append(subtotal);
        sb.append(", pro=").append(pro);
        sb.append(", mso=").append(mso);
        sb.append(", pImg='").append(pImg).append('\'');
        sb.append(", pSn='").append(pSn).append('\'');
        sb.append('}');
        return sb.toString();
    }
}
