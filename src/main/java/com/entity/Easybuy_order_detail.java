package com.entity;

public class Easybuy_order_detail {
    private int id; // 编号
    private int orderid; // 订单id
    private int productid; // 商品id
    private int quantiy; // 数量
    private float cost; // 金额
    private String filename; // 上传文件名
    private String name; // 商品名字

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrderid() {
        return orderid;
    }

    public void setOrderid(int orderid) {
        this.orderid = orderid;
    }

    public int getProductid() {
        return productid;
    }

    public void setProductid(int productid) {
        this.productid = productid;
    }

    public int getQuantiy() {
        return quantiy;
    }

    public void setQuantiy(int quantiy) {
        this.quantiy = quantiy;
    }

    public float getCost() {
        return cost;
    }

    public void setCost(float cost) {
        this.cost = cost;
    }

    public Easybuy_order_detail() {
    }

    @Override
    public String toString() {
        return "Easybuy_order_detail{" +
                "id=" + id +
                ", orderid=" + orderid +
                ", productid=" + productid +
                ", quantiy=" + quantiy +
                ", cost=" + cost +
                ", filename='" + filename + '\'' +
                ", name='" + name + '\'' +
                '}';
    }

    public Easybuy_order_detail(int id, int orderid, int productid, int quantiy, float cost, String filename, String name) {

        this.id = id;
        this.orderid = orderid;
        this.productid = productid;
        this.quantiy = quantiy;
        this.cost = cost;
        this.filename = filename;
        this.name = name;
    }
}