package com.work.tools;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Logger;

import com.work.db.DBConnection;

public class ArticlesDAO {

    private static final Map HashMap = null;

    private PreparedStatement pstmt;

    private ResultSet rs;

    private Connection con;

    // private DBConnection conn;



    // 查询SQL
    public ArrayList chaSQL(String sql) {
        ArrayList list = new ArrayList();
        try {

            pstmt = new DBConnection().getCon().prepareStatement(sql);
            rs = pstmt.executeQuery();
            ResultSetMetaData rsmd = rs.getMetaData();
            int count = rsmd.getColumnCount();
            while (rs.next()) {
                // System.out.println("������-->"+rsmd.getColumnName(i)+"\t
                // �õ���object��-->"+rs.getObject(i)+" "+i);
                HashMap map = new HashMap();
                for (int i = 0; i < count; i++) {
                    map.put(rsmd.getColumnName(i + 1), rs.getObject(i + 1));
                }
                list.add(map);

            }


        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeColl(rs, pstmt, con);
        }
        return list;

    }

    // 查询总条数
    public int count(String tableName, String where1) {
        String sql = "select count(*) as aa from " + tableName + " " + where1;
        int i = 0;
        try {
            pstmt = new DBConnection().getCon().prepareStatement(sql);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                i = rs.getInt("aa");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeColl(rs, pstmt, con);
        }
        return i;
    }



    public ArrayList chaSQL(String sql, String tableName, PageBean page, String where1) {
        ArrayList list = new ArrayList();
        if (page != null) {
            page.setTotalCount(this.count(tableName, where1));
            sql = sql + " " + where1 + " limit " + page.getStart() + "," + page.getPageSize();

        }
        Logger.getGlobal().info("查询SQL:" + sql);
        try {

            pstmt = new DBConnection().getCon().prepareStatement(sql);
            rs = pstmt.executeQuery();
            ResultSetMetaData rsmd = rs.getMetaData();

            int count = rsmd.getColumnCount();
            while (rs.next()) {
                // System.out.println("������-->"+rsmd.getColumnName(i)+"\t
                // �õ���object��-->"+rs.getObject(i)+" "+i);
                HashMap map = new HashMap();
                for (int i = 0; i < count; i++) {
                    map.put(rsmd.getColumnName(i + 1), rs.getObject(i + 1));// ���ֺ�ֵ
                }
                list.add(map);

            }


        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeColl(rs, pstmt, con);
        }
        return list;
    }

    // con ,pst, rs �ر�
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

    /*
     * //��Map�ֳ�List public List<OrderModel> findOrders(List list){ List<OrderModel> oml = new
     * ArrayList(); OrderModel om=null; for(int i=0;i<list.size();i++){ HashMap
     * map=(HashMap)list.get(i);
     * 
     * 
     * om=new OrderModel(); om.setOrderId(Long.parseLong(map.get("order_id").toString()));
     * om.setUserId(Long.parseLong(map.get("user_id").toString()));
     * om.setTaobaoCrad(map.get("taobao_crad").toString());
     * om.setScore(Integer.parseInt(map.get("score").toString()));
     * om.setCreateDate(map.get("creatdate").toString());
     * om.setOperDate(map.get("oper_date")==null?"":map.get("oper_date").toString());
     * om.setOperName(map.get("oper_name")==null?"":map.get("oper_name").toString());
     * om.setStatue(map.get("statue")==null?"δ����":map.get("statue").toString());
     * om.setBeizhu(map.get("beizhu")==null?"":map.get("beizhu").toString());
     * om.setUserName(map.get("user_name")==null?"":map.get("user_name").toString()); oml.add(om); }
     * return oml; }
     */
    /**
     * MD5 ����
     */
    private String getMD5Str(String str) {
        MessageDigest messageDigest = null;

        try {
            messageDigest = MessageDigest.getInstance("MD5");

            messageDigest.reset();

            messageDigest.update(str.getBytes("UTF-8"));
        } catch (NoSuchAlgorithmException e) {
            System.out.println("NoSuchAlgorithmException caught!");
            System.exit(-1);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        byte[] byteArray = messageDigest.digest();

        StringBuffer md5StrBuff = new StringBuffer();

        for (int i = 0; i < byteArray.length; i++) {
            if (Integer.toHexString(0xFF & byteArray[i]).length() == 1)
                md5StrBuff.append("0").append(Integer.toHexString(0xFF & byteArray[i]));
            else
                md5StrBuff.append(Integer.toHexString(0xFF & byteArray[i]));
        }

        return md5StrBuff.toString();
    }

}
