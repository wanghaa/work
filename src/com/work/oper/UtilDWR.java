package com.work.oper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.work.db.DBConnection;
import com.work.model.Diary;
import com.work.model.Empolyess;
import com.work.tools.ArticlesDAO;
import com.work.tools.PageBean;


public class UtilDWR {
    // 登录
    public boolean login(String user_name, String user_pass) {
        boolean flag = false;
        String sql = "select * from t_employee where user_name=? and user_pass=?";
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            con = new DBConnection().getCon();
            pst = con.prepareStatement(sql);
            pst.setString(1, user_name);
            pst.setString(2, user_pass);
            rs = pst.executeQuery();
            if (rs.next()) {
                flag = true;
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            new DBConnection().closeColl(rs, pst, con);
        }
        return flag;
    }

    // 查重
    public boolean checkname(String name) {
        boolean flag = false;
        String sql = "select user_name from t_employee where user_name=? order by user_id";
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            con = new DBConnection().getCon();
            pst = con.prepareStatement(sql);
            pst.setString(1, name);
            rs = pst.executeQuery();
            if (rs.next()) {
                flag = true;
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            new DBConnection().closeColl(rs, pst, con);
        }
        return flag;
    }



    // 修改密码
    public List changePass(long userId, String userpass) {
        List all = new ArrayList();
        String flag = "no";
        String sql = "UPDATE t_employee SET user_pass=? WHERE (user_id=?) ";
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            con = new DBConnection().getCon();
            pst = con.prepareStatement(sql);
            pst.setString(1, userpass);
            pst.setLong(2, userId);
            if (pst.executeUpdate() > 0) {
                flag = "yes";
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            new DBConnection().closeColl(rs, pst, con);
        }
        all.add(flag);
        all.add(userpass);
        return all;

    }

    // 职工
    public String submitPage(String tablename, int currentPage, String where) {
        String div = "";
        List<Empolyess> oml = new ArrayList();
        List all = new ArrayList();
        ArticlesDAO dd = new ArticlesDAO();
        PageBean page = new PageBean();
        page.setPage(currentPage);
        page.setPageSize(10);


        page.setTotalCount(dd.count(tablename, ""));
        all = dd.chaSQL("select * from " + tablename + " ", tablename, page,
                where + " order by user_id ");

        div += orderTable(all);
        div += getPage_common2(tablename, page);
        return div;
    }

    // 职工列表
    public String orderTable(List data) {
        String div = "";
        div += "<table><thead><tr id='oneline' style='background-color: #EBF2F8;' >"
                + "<td class='td1 thead'>编号</td><td class='td2 thead'>姓名</td>"
                + "<td class='td3 thead'>性别</td><td class='td4 thead'>出生日期</td>"
                + "<td class='td5 thead'>联系电话</td><td class='td6 thead'>E-Mail</td><td class='td6 thead'>MSN</td>"
                + "<td class='td7 thead'>创建时间</td></tr></thead>";

        // 循环遍历表单
        Empolyess om = null;
        HashMap hm = null;
        for (int i = 0; i < data.size(); i++) {
            hm = (HashMap) data.get(i);
            div += "<tr class='orderList'>" + "<td class='td1'>" + (i + 1) + "</td>"
                    + "<td class='td2' onclick=\"find_userName('" + hm.get("user_name")
                    + "')\" title=\"点击查看" + hm.get("user_name") + "的日志\"><a href=\"javascript:;\">"
                    + hm.get("user_name") + "</a></td>" + "<td class='td3'>" + hm.get("gender")
                    + "</td>" + "<td class='td4'>" + hm.get("birthday") + "</td>"
                    + "<td class='td5'>" + hm.get("telphone") + "</td>" + "<td class='td6'>"
                    + hm.get("email") + "</td>" + "<td class='td6'>" + hm.get("msn") + "</td>"
                    + "<td class='td7'>" + hm.get("create_date") + "</td>" + "</tr>";
        }
        div += "</table>";
        return div;
    }

    // 日志
    public String messageOper_user(String userName, String dia_date, int currentPage) {
        String div = "";
        PageBean page1 = new PageBean();
        page1.setPage(currentPage);
        page1.setPageSize(10);
        DiaryOper mo = new DiaryOper();
        ArticlesDAO dd = new ArticlesDAO();

        String where1 = "";
        if (null != userName && !"".equals(userName)) {
            where1 += " user_name='" + userName + "' and ";
        }
        if (null != dia_date && !"".equals(dia_date)) {
            if (dia_date.indexOf(";") > 0) {
                String s[] = dia_date.split(";");
                where1 += " dia_date>'" + s[0] + "' and dia_date<'" + s[1] + "' and";
            } else {
                where1 += " dia_date='" + dia_date + "' and ";
            }
        }
        if (!"".equals(where1)) {
            where1 = where1.substring(0, where1.length() - 4);
        } else {
            where1 = " 1=1 ";
        }

        page1.setTotalCount(dd.count("t_diary", " where " + where1));
        List diaryall = new ArrayList();
        String tablename = "t_diary";
        diaryall = dd.chaSQL("select * from " + tablename + " ", tablename, page1,
                " where " + where1 + " order by dia_date desc");

        div += this.messageTable_user(diaryall);
        div += this.getPage_common("message", page1);

        return div;
    }

    // 日志
    public String messageTable_user(List data) {
        EmpolyessOper eo = new EmpolyessOper();
        HashMap m = null;
        String div = "<ul class='list_liu'>";
        String username = "";
        String date = "";
        for (int i = 0; i < data.size(); i++) {
            m = (HashMap) data.get(i);
            div += "<li id='li_" + m.get("dia_id")
                    + "'><b><a href='javascript:;' onclick=\"find_userName('" + m.get("user_name")
                    + "')\">" + m.get("user_name") + "：</a></b><div class='contet_div'>"
                    + m.get("content") + "<div/>" + "<span class='hui'>"
                    + "<a href='javascript:;' onclick=\"find_date('" + m.get("dia_date") + "')\">"
                    + m.get("dia_date") + "</a>&nbsp;&nbsp;"
                    + "<a href='javascript:void();' onclick=\"deleteDiaryById(" + m.get("dia_id")
                    + ")\">[ 删除]</a></span></li>";
        }

        div += "</ul>";

        return div;

    }

    // 分页
    /*
     * table 哪一个TABLE的翻页
     */
    public String getPage_common(String table, PageBean pg) {
        String div = "";
        div += "<div id='fenye'>" + "<div style='float:left' id='tag'>" + "共有 " + pg.getTotalCount()
                + " 条记录&nbsp;&nbsp;" + "共" + pg.getTotalPage() + "页&nbsp;&nbsp;" + "</div>";
        if (pg.getTotalPage() > 1) {
            if (pg.getPage() > 1) {
                div += "<a href='javascript:;' onclick=\"submitPage('" + table
                        + "',1,'first')\">返回首页</a>"
                        + "<a href='javascript:;' onclick=\"submitPage('" + table + "',"
                        + (pg.getPage() - 1) + ",'pro')\">上一页</a>";
            }
            if (pg.getPage() < pg.getTotalPage()) {
                div += "<a href='javascript:;' onclick=\"submitPage('" + table + "',"
                        + (pg.getPage() + 1) + ",'next')\">下一页</a>"
                        + "<a href='javascript:;' onclick=\"submitPage('" + table + "',"
                        + pg.getTotalPage() + ",'end')\">尾页</a>";
            }
        }
        div += "</div>" + "<div style='text-align:left;margin:5px 0pt 0pt 5px;'>" + "第"
                + pg.getPage() + "页&nbsp;&nbsp;" + "</div>";
        return div;
    }

    public String getPage_common2(String table, PageBean pg) {
        String div = "";
        div += "<div id='fenye'>" + "<div style='float:left' id='tag'>" + "共有 " + pg.getTotalCount()
                + " 条记录&nbsp;&nbsp;" + "共" + pg.getTotalPage() + "页&nbsp;&nbsp;" + "</div>";
        if (pg.getTotalPage() > 1) {
            if (pg.getPage() > 1) {
                div += "<a href='javascript:;' onclick=\"submitPage1('" + table
                        + "',1,'first')\">返回首页</a>"
                        + "<a href='javascript:;' onclick=\"submitPage1('" + table + "',"
                        + (pg.getPage() - 1) + ",'pro')\">上一页</a>";
            }
            if (pg.getPage() < pg.getTotalPage()) {
                div += "<a href='javascript:;' onclick=\"submitPage1('" + table + "',"
                        + (pg.getPage() + 1) + ",'next')\">下一页</a>"
                        + "<a href='javascript:;' onclick=\"submitPage1('" + table + "',"
                        + pg.getTotalPage() + ",'end')\">尾页</a>";
            }
        }
        div += "</div>" + "<div style='text-align:left;margin:5px 0pt 0pt 5px;'>" + "第"
                + pg.getPage() + "页&nbsp;&nbsp;" + "</div>";
        return div;
    }

    public boolean hidden_add_message(String userName, String content, String date) {
        boolean flag = false;
        Diary diary = new Diary();
        diary.setUser_name(userName);
        diary.setContent(content);
        diary.setCreate_date(date);
        DiaryOper doper = new DiaryOper();
        flag = doper.insert(diary);
        return flag;
    }

    // 改变图像
    public boolean updateHead(String src, long userId) {
        String sql = "update t_employee set head='" + src + "' where user_id=" + userId;
        EmpolyessOper eo = new EmpolyessOper();
        return eo.updateEmp(sql);

    }

    public boolean deleteDiaryById(long id) {
        DiaryOper diaoper = new DiaryOper();
        return diaoper.deleteById(id + "");
    }
}
