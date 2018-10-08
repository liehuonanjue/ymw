package com.entity;

public class Easybuy_product_categoy {
    private int id; //编号
    private String name; //名字
    private int parenid; //父分类
    private int type; //类型

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getParenid() {
        return parenid;
    }

    public void setParenid(int parenid) {
        this.parenid = parenid;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }
}