package com.cydeo.jdbctests.liveclass;

import org.junit.jupiter.api.Test;

import java.sql.*;

public class P01_JDBCPractice {

    String dbURL ="jdbc:oracle:thin:@44.201.221.73:1521:xe";
    String dbUsername = "hr";
    String dbPassword = "hr";


    @Test
    public void test1() throws SQLException {
        /*
        HOW TO INIT VARIABLE ?
        -> MAC --> OPT+ENTER
        -> WIN --> ALT+ENTER

         */
        // Driver manager will help us to create connection
        Connection conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

        // Statement help us to execute any query
        Statement stmnt = conn.createStatement();

        // Resultset will store data after query execution
        ResultSet rs = stmnt.executeQuery("SELECT COUNTRY_ID,COUNTRY_NAME FROM COUNTRIES");


        /*

        RETRIVE DATA

         */

        rs.close();

        stmnt.close();

        conn.close();


    }
}
