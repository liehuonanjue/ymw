package com.entity;

import java.util.Date;

public class Easybuy_order {
    private int id; // 编号
    private String userid; // 用户id
    private String loginname; // 登陆用户名
    private String useraddress; // 用户地址
    private String createtime; // 创建时间
    private float cost; // 金额
    private int status; // 状态
    private int type; // 类型
    private String seriainumber; // 订单号

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getLoginname() {
        return loginname;
    }

    public void setLoginname(String loginname) {
        this.loginname = loginname;
    }

    public String getUseraddress() {
        return useraddress;
    }

    public void setUseraddress(String useraddress) {
        this.useraddress = useraddress;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public float getCost() {
        return cost;
    }

    public void setCost(float cost) {
        this.cost = cost;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getType() {
        return type;
    }

    @Override
    public String toString() {
        return "Easybuy_order{" +
                "id=" + id +
                ", userid='" + userid + '\'' +
                ", loginname='" + loginname + '\'' +
                ", useraddress='" + useraddress + '\'' +
                ", createtime='" + createtime + '\'' +
                ", cost=" + cost +
                ", status=" + status +
                ", type=" + type +
                ", seriainumber='" + seriainumber + '\'' +
                '}';
    }

    public Easybuy_order() {
    }

    public Easybuy_order(int id, String userid, String loginname, String useraddress, String createtime, float cost, int status, int type, String seriainumber) {

        this.id = id;
        this.userid = userid;
        this.loginname = loginname;
        this.useraddress = useraddress;
        this.createtime = createtime;
        this.cost = cost;
        this.status = status;
        this.type = type;
        this.seriainumber = seriainumber;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getSeriainumber() {
        return seriainumber;
    }

    public void setSeriainumber(String seriainumber) {
        this.seriainumber = seriainumber;
    }

}