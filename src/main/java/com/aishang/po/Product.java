package com.aishang.po;

import java.util.Date;

/**
 * 商品实体
 * @author yc950710
 */
public class Product {
    private Integer pid;
    private String pName;
    private Double marketPrice;
    private Double shopPrice;
    private String image;
    private String pDesc;
    private Integer isHot;
    private Date pDate;
    private Integer csid;

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public Double getMarketPrice() {
        return marketPrice;
    }

    public void setMarketPrice(Double marketPrice) {
        this.marketPrice = marketPrice;
    }

    public Double getShopPrice() {
        return shopPrice;
    }

    public void setShopPrice(Double shopPrice) {
        this.shopPrice = shopPrice;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getpDesc() {
        return pDesc;
    }

    public void setpDesc(String pDesc) {
        this.pDesc = pDesc;
    }

    public Integer getIsHot() {
        return isHot;
    }

    public void setIsHot(Integer isHot) {
        this.isHot = isHot;
    }

    public Date getpDate() {
        return pDate;
    }

    public void setpDate(Date pDate) {
        this.pDate = pDate;
    }

    public Integer getCsid() {
        return csid;
    }

    public void setCsid(Integer csid) {
        this.csid = csid;
    }

    @Override
    public String toString() {
        return "Product{" +
                "pid=" + pid +
                ", pName='" + pName + '\'' +
                ", marketPrice=" + marketPrice +
                ", shopPrice=" + shopPrice +
                ", image='" + image + '\'' +
                ", pDesc='" + pDesc + '\'' +
                ", isHot=" + isHot +
                ", pDate=" + pDate +
                ", csid=" + csid +
                '}';
    }
}
