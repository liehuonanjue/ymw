package com.entity;

import java.util.Date;

public class Easybuy_user_address {
    private int id; //id 主键
    private String address; //地址
    private Date createtime; //创建时间
    private int userid; //用户主键
    private int iddefault; //是否是默认地址
    private String remark; //备注0否1是

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public int getIddefault() {
        return iddefault;
    }

    public void setIddefault(int iddefault) {
        this.iddefault = iddefault;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

}