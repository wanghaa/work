package com.work.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBConnection {
    private Connection con = null;

    public DBConnection() {

        String driver = "com.mysql.jdbc.Driver";

        String url = "jdbc:mysql://127.0.0.1:3306/worklog?characterEncoding=UTF-8";

        String user = "root";

        String password = "aishangyxl";
        try {

            Class.forName(driver);

            con = DriverManager.getConnection(url, user, password);
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public Connection getCon() {
        return con;
    }

    public void setCon(Connection con) {
        this.con = con;
    }

    public void closeColl(ResultSet rs, PreparedStatement pst, Connection con) {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        if (pst != null) {
            try {
                pst.close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }
}
