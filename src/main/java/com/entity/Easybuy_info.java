package com.entity;

public class Easybuy_info {
    private int infoid; // id
    private String name; // 用户名
    private String pwd; // 密码
    private int tbit; // 管理员
    private String head; // 用户名

    public String getHead() {
        return head;
    }

    public void setHead(String head) {
        this.head = head;
    }

    public int getInfoid() {
        return infoid;
    }

    public void setInfoid(int infoid) {
        this.infoid = infoid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public int getTbit() {
        return tbit;
    }

    public void setTbit(int tbit) {
        this.tbit = tbit;
    }

    @Override
    public String toString() {
        return "Easybuy_info{" +
                "infoid=" + infoid +
                ", name='" + name + '\'' +
                ", pwd='" + pwd + '\'' +
                ", tbit=" + tbit +
                ", head='" + head + '\'' +
                '}';
    }

    public Easybuy_info() {
    }

    public Easybuy_info(int infoid, String name, String pwd, int tbit, String head) {

        this.infoid = infoid;
        this.name = name;
        this.pwd = pwd;
        this.tbit = tbit;
        this.head = head;
    }
}