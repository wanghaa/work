package com.work.oper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import com.work.db.DBConnection;
import com.work.model.Diary;
import com.work.tools.ArticlesDAO;
import com.work.tools.PageBean;

public class DiaryOper {
    // 添加
    public boolean insert(Diary diary) {
        boolean flag = false;
        String sql = "replace into t_diary(user_name,content,dia_date) values(?,?,?)";
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            con = new DBConnection().getCon();
            pst = con.prepareStatement(sql);
            pst.setString(1, diary.getUser_name());
            pst.setString(2, diary.getContent());

            if (diary.getCreate_date() == null || "".equals(diary.getCreate_date())) {
                String time = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
                diary.setCreate_date(time);
            }
            pst.setString(3, diary.getCreate_date());
            int n = pst.executeUpdate();
            if (n > 0) {
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

    // 删除--批量
    public boolean deleteById(String ids) {
        boolean flag = false;
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        con = new DBConnection().getCon();
        String sql = "delete from t_diary where dia_id in (" + ids + ")";
        try {
            pst = con.prepareStatement(sql);
            int n = pst.executeUpdate();
            if (n > 0) {
                flag = true;
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            new DBConnection().closeColl(rs, pst, con);
        }
        return false;
    }

    // 修改
    public boolean updateById(long id) {
        boolean flag = false;

        return false;
    }

    // 查询
    public Diary findById(long id) {
        Diary member = new Diary();
        String sql = "select * from t_diary where dia_id=" + id;
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            con = new DBConnection().getCon();
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                member.setDia_id(rs.getLong("dia_id"));
                member.setUser_name(rs.getString("user_name"));
                member.setContent(rs.getString("content"));
                member.setCreate_date(rs.getString("create_date"));
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            new DBConnection().closeColl(rs, pst, con);
        }
        return member;
    }

    // 查找所有
    public List<Diary> selectDiary(String where1, String order1, PageBean page) {
        List<Diary> mm_list = null;
        if ("".equals(order1))
            order1 = " order by dia_id ";
        String sql = "select * from t_diary  where " + where1 + order1;
        ArticlesDAO dd = new ArticlesDAO();
        mm_list = dd.chaSQL("select * from t_diary ", "t_diary", page,
                " where " + where1 + " " + order1);

        return mm_list;
    }
}
