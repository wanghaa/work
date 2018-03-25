package com.work.model;

public class Diary {
    private long dia_id;
    private String create_date;
    private String user_name;
    private String content;

    public long getDia_id() {
        return dia_id;
    }

    public void setDia_id(long dia_id) {
        this.dia_id = dia_id;
    }

    public String getCreate_date() {
        return create_date;
    }

    public void setCreate_date(String create_date) {
        this.create_date = create_date;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
