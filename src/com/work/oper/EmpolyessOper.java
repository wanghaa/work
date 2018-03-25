package com.work.oper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.work.db.DBConnection;
import com.work.model.Empolyess;
import com.work.tools.ArticlesDAO;
import com.work.tools.PageBean;



public class EmpolyessOper {
    // 登录
    public Empolyess login(Empolyess member) {
        boolean flag = false;
        String sql = "select * from t_employee where user_name=? and user_pass=?";
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        Empolyess emp = null;
        try {
            con = new DBConnection().getCon();
            pst = con.prepareStatement(sql);
            pst.setString(1, member.getUser_name());
            pst.setString(2, member.getUser_pass());
            rs = pst.executeQuery();
            if (rs.next()) {
                emp = new Empolyess();
                emp.setUser_id(rs.getLong("user_id"));
                emp.setUser_name(rs.getString("user_name"));
                emp.setUser_pass(rs.getString("user_pass"));
                emp.setBirthday(rs.getString("birthday"));
                emp.setTelphone(rs.getString("telphone"));
                emp.setGender(rs.getString("gender"));
                emp.setEmail(rs.getString("email"));
                emp.setMsn(rs.getString("msn"));
                emp.setCreate_date(rs.getString("create_date"));
                emp.setLimits(rs.getInt("limits"));
                emp.setHead(rs.getString("head"));
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            new DBConnection().closeColl(rs, pst, con);
        }
        return emp;
    }

    // 注册
    public boolean register(Empolyess m) {
        boolean flag = false;
        String sql =
                "insert into t_employee(user_name,user_pass,birthday,telphone,gender,email,msn,create_date,limits,head) values(?,?,?,?,?,?,?,?,?,?)";
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        Date date = new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        String time = df.format(date);

        try {
            con = new DBConnection().getCon();
            pst = con.prepareStatement(sql);
            pst.setString(1, m.getUser_name());
            pst.setString(2, m.getUser_pass());
            pst.setString(3, m.getBirthday());
            pst.setString(4, m.getTelphone());
            pst.setString(5, m.getGender());
            pst.setString(6, m.getEmail());
            pst.setString(7, m.getMsn());
            if (m.getCreate_date() == null || "".equals(m.getCreate_date())) {
                m.setCreate_date(time);
            }
            pst.setString(8, m.getCreate_date());
            pst.setInt(9, m.getLimits());
            pst.setString(10, "emp_image/pic_106.jpg");
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
        String sql = "delete from Empolyess where user_id in (" + ids + ")";
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        con = new DBConnection().getCon();
        try {
            pst = con.prepareStatement(sql);
            int n = pst.executeUpdate();
            if (n > 0) {
                flag = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            new DBConnection().closeColl(rs, pst, con);
        }
        return flag;
    }

    // 根据ID查找
    public Empolyess findById(long userId) {
        Empolyess member = new Empolyess();
        String sql = "select * from t_employee where user_id=" + userId;
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            con = new DBConnection().getCon();
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                member.setUser_id(rs.getLong("user_id"));
                member.setUser_name(rs.getString("user_name"));
                member.setUser_pass(rs.getString("user_pass"));
                member.setBirthday(rs.getString("birthday"));
                member.setTelphone(rs.getString("telphone"));
                member.setGender(rs.getString("gender"));
                member.setEmail(rs.getString("email"));
                member.setMsn(rs.getString("msn"));
                member.setCreate_date(rs.getString("create_date"));
                member.setLimits(rs.getInt("limits"));
                member.setHead(rs.getString("head"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            new DBConnection().closeColl(rs, pst, con);
        }
        return member;
    }

    // 查找所有
    public List<Empolyess> selectMember(String where1, String order1, PageBean page) {
        List<Empolyess> mm_list = null;
        if ("".equals(order1))
            order1 = " order by user_id ";
        ArticlesDAO dd = new ArticlesDAO();
        mm_list = dd.chaSQL("select * from t_employee ", "t_employee", page,
                " where " + where1 + " " + order1);

        return mm_list;
    }

    // 根据姓名查找
    public Empolyess findUserIdByUserName(String username) {
        Empolyess member = null;
        String sql = "select * from t_employee where user_name=?";
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            con = new DBConnection().getCon();
            pst = con.prepareStatement(sql);
            pst.setString(1, username);
            rs = pst.executeQuery();
            if (rs.next()) {
                member = new Empolyess();
                member.setUser_id(rs.getLong("user_id"));
                member.setUser_name(rs.getString("user_name"));
                member.setUser_pass(rs.getString("user_pass"));
                member.setBirthday(rs.getString("birthday"));
                member.setTelphone(rs.getString("telphone"));
                member.setGender(rs.getString("gender"));
                member.setEmail(rs.getString("email"));
                member.setMsn(rs.getString("msn"));
                member.setCreate_date(rs.getString("create_date"));
                member.setLimits(rs.getInt("limits"));
                member.setHead(rs.getString("head"));
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            new DBConnection().closeColl(rs, pst, con);
        }
        return member;
    }

    // 修改
    public boolean updateEmp(String sql) {
        boolean flag = false;
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        con = new DBConnection().getCon();
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
        return flag;
    }

}
