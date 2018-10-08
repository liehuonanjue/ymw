package com.entity;

public class Easybuy_product {
    private int id; //商编号品
    private String name; //商品名字
    private String description; //商品描述
    private float price; //商品价格
    private int stock; //商品库存
    private int categorylevel1; //所属分类id
    private int categorylevel2; //所属分类二级id
    private int categorylevel3; //所属分类三级id
    private String filename; //上传文件名
    private int isdelete; //是否删除

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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getCategorylevel1() {
        return categorylevel1;
    }

    public void setCategorylevel1(int categorylevel1) {
        this.categorylevel1 = categorylevel1;
    }

    public int getCategorylevel2() {
        return categorylevel2;
    }

    public void setCategorylevel2(int categorylevel2) {
        this.categorylevel2 = categorylevel2;
    }

    public int getCategorylevel3() {
        return categorylevel3;
    }

    public void setCategorylevel3(int categorylevel3) {
        this.categorylevel3 = categorylevel3;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public int getIsdelete() {
        return isdelete;
    }

    public void setIsdelete(int isdelete) {
        this.isdelete = isdelete;
    }

}