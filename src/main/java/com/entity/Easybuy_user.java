package com.entity;

public class Easybuy_user {
    private int id; //用户名
    private String username; //用户真实姓名
    private String loginname; //用户登陆用户名
    private String password; //密码
    private int sex; //性别0：女：男
    private String identitycode; //身份证好
    private String email; //电子邮箱
    private String mobile; //手机
    private int type; //用户类型0为前台1为后台

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getLoginname() {
        return loginname;
    }

    public void setLoginname(String loginname) {
        this.loginname = loginname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public String getIdentitycode() {
        return identitycode;
    }

    public void setIdentitycode(String identitycode) {
        this.identitycode = identitycode;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "Easybuy_user{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", loginname='" + loginname + '\'' +
                ", password='" + password + '\'' +
                ", sex=" + sex +
                ", identitycode='" + identitycode + '\'' +
                ", email='" + email + '\'' +
                ", mobile='" + mobile + '\'' +
                ", type=" + type +
                '}';
    }

    public Easybuy_user() {
    }

    public Easybuy_user(int id, String username, String loginname, String password, int sex, String identitycode, String email, String mobile, int type) {

        this.id = id;
        this.username = username;
        this.loginname = loginname;
        this.password = password;
        this.sex = sex;
        this.identitycode = identitycode;
        this.email = email;
        this.mobile = mobile;
        this.type = type;
    }
}