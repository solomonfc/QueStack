package org.BruceGallery.QueStack;

import org.apache.commons.dbcp.BasicDataSource;
import org.apache.commons.dbcp.BasicDataSourceFactory;

import javax.naming.*;
import javax.sql.DataSource;
import java.io.InputStream;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.Statement;
import java.util.Properties;

public class ConnectionSource {
    private static BasicDataSource dataSource = null;

//    private static InputStream inStream;
//    private static Properties pro;
    private static DataSource datasource;

    static{


        Context initContext = null;

        try {
            initContext = new InitialContext();
            Context envContext  = (Context)initContext.lookup("java:/comp/env");

            datasource = (DataSource)envContext.lookup("jdbc/QAHUB");

        }
        catch (NamingException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }


//        Connection conn = ds.getConnection();
//
//        inStream=ConnectionSource.class.getClass().getResourceAsStream("/dbcpConfig.properties");
//        pro=new Properties();
//
//        try {
//            pro.load(inStream);
//            datasource=BasicDataSourceFactory.createDataSource(pro);
//        } catch (Exception e) {
//            e.printStackTrace();
//            throw new RuntimeException("DataSource Initialization Exception");
//        }
    }

    public static DataSource getDataSource(){
        return datasource;
    }

    public static Connection getConnection(){

        try {
            return datasource.getConnection();
        }
        catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Database Connection Exception");
        }
    }

    public static void closeConnection(ResultSet rs,Statement stmt, Connection conn){
        try {

            if(rs!=null){rs.close();}

        }
        catch (Exception e) {

            e.printStackTrace();

        }
        finally {

            try {

                if(stmt!=null){stmt.close();}

            }
            catch (Exception e) {

                e.printStackTrace();

            }finally{

                if(conn!=null){
                    try {

                        conn.close();
                    }
                    catch (SQLException e) {

                        e.printStackTrace();
                    }
                }
            }
        }
    }

//    public ConnectionSource() {
//    }
//
//    public static void init() {
//
//        if (dataSource != null) {
//            try {
//                dataSource.close();
//            } catch (Exception e) {
//                //
//            }
//            dataSource = null;
//        }
//
//        try {
//            Properties p = new Properties();
//            p.setProperty("driverClassName", "oracle.jdbc.driver.OracleDriver");
//            p.setProperty("url", "jdbc:oracle:thin:@localhost:1521:xe");
//            p.setProperty("username", "QAHUB");
//            p.setProperty("password", "naima88712");
//            p.setProperty("maxActive", "30");
//            p.setProperty("maxIdle", "10");
//            p.setProperty("maxWait", "1000");
//            p.setProperty("removeAbandoned", "false");
//            p.setProperty("removeAbandonedTimeout", "120");
//            p.setProperty("testOnBorrow", "true");
//            p.setProperty("logAbandoned", "true");
//
//            dataSource = (BasicDataSource) BasicDataSourceFactory.createDataSource(p);
//
//        } catch (Exception e) {
//            e.printStackTrace();
//            throw new RuntimeException("初始化错误！");
//        }
//    }
//
//    public static synchronized Connection getConnection() throws  SQLException {
//        if (dataSource == null) {
//            init();
//        }
//
//        Connection conn = null;
//        if (dataSource != null) {
//            conn = dataSource.getConnection();
//        }
//        return conn;
//    }
}