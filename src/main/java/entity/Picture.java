package entity;

import java.io.Serializable;

public class Picture implements Serializable{
    private Integer id;
    private Integer bolong;
    private String picname;
    private String url;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getBolong() {
        return bolong;
    }

    public void setBolong(Integer bolong) {
        this.bolong = bolong;
    }

    public String getPicname() {
        return picname;
    }

    public void setPicname(String picname) {
        this.picname = picname;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public String toString() {
        return "Picture{" +
                "id=" + id +
                ", bolong=" + bolong +
                ", picname='" + picname + '\'' +
                ", url='" + url + '\'' +
                '}';
    }
}
