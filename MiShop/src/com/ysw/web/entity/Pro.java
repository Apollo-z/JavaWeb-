package com.ysw.web.entity;

import java.util.Objects;

/**
 * 商品实体类
 */
public class Pro {

    private Integer id;         //编号
    private String pName;       //商品名称
    private String pSn;         //商品货号
    private Integer pNum;       //商品数量
    private Double mPrice;      //市场价
    private Double iPrice;      //网站价
    private String pDesc;       //商品简介
    private String pImg;        //商品图片
    private String pubTime;     //商品上架时间
    private Integer isShow;     //商品是否上架
    private Integer isHot;      //商品销量
    private Integer cid;        //商品类型
    private String xqImg;       //商品详情地址

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public String getpSn() {
        return pSn;
    }

    public void setpSn(String pSn) {
        this.pSn = pSn;
    }

    public Integer getpNum() {
        return pNum;
    }

    public void setpNum(Integer pNum) {
        this.pNum = pNum;
    }

    public Double getmPrice() {
        return mPrice;
    }

    public void setmPrice(Double mPrice) {
        this.mPrice = mPrice;
    }

    public Double getiPrice() {
        return iPrice;
    }

    public void setiPrice(Double iPrice) {
        this.iPrice = iPrice;
    }

    public String getpDesc() {
        return pDesc;
    }

    public void setpDesc(String pDesc) {
        this.pDesc = pDesc;
    }

    public String getpImg() {
        return pImg;
    }

    public void setpImg(String pImg) {
        this.pImg = pImg;
    }

    public String getPubTime() {
        return pubTime;
    }

    public void setPubTime(String pubTime) {
        this.pubTime = pubTime;
    }

    public Integer getIsShow() {
        return isShow;
    }

    public void setIsShow(Integer isShow) {
        this.isShow = isShow;
    }

    public Integer getIsHot() {
        return isHot;
    }

    public void setIsHot(Integer isHot) {
        this.isHot = isHot;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getXqImg() {
        return xqImg;
    }

    public void setXqImg(String xqImg) {
        this.xqImg = xqImg;
    }

    //重写hashCode和equals方法
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Pro pro = (Pro) o;
        return id.equals(pro.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("Pro{");
        sb.append("id=").append(id);
        sb.append(", pName='").append(pName).append('\'');
        sb.append(", pSn='").append(pSn).append('\'');
        sb.append(", pNum=").append(pNum);
        sb.append(", mPrice=").append(mPrice);
        sb.append(", iPrice=").append(iPrice);
        sb.append(", pDesc='").append(pDesc).append('\'');
        sb.append(", pImg='").append(pImg).append('\'');
        sb.append(", pubTime='").append(pubTime).append('\'');
        sb.append(", isShow=").append(isShow);
        sb.append(", isHot=").append(isHot);
        sb.append(", cid=").append(cid);
        sb.append(", xqImg='").append(xqImg).append('\'');
        sb.append('}');
        return sb.toString();
    }
}