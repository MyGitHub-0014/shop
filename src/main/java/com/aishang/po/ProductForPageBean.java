package com.aishang.po;

/**
 * 商品分页实体类
 * 查询条件： csid，cid
 * @author yc950710
 */
public class ProductForPageBean extends PageBean<Product> {
    private Integer csid;
    private Integer cid;
    private String pName;
    private Integer isHot;

    public Integer getIsHot() {
        return isHot;
    }

    public void setIsHot(Integer isHot) {
        this.isHot = isHot;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public Integer getCsid() {
        return csid;
    }

    public void setCsid(Integer csid) {
        this.csid = csid;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    @Override
    public String toString() {
        return "ProductForPageBean{" +
                "csid=" + csid +
                ", cid=" + cid +
                ", pName='" + pName + '\'' +
                ", isHot=" + isHot +
                '}';
    }
}
