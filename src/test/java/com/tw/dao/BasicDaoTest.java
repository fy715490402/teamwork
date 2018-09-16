package com.tw.dao;

import org.dbunit.DBTestCase;
import org.dbunit.JdbcDatabaseTester;
import org.dbunit.PropertiesBasedJdbcDatabaseTester;
import org.dbunit.database.DatabaseConfig;
import org.dbunit.database.DatabaseConnection;
import org.dbunit.database.IDatabaseConnection;
import org.dbunit.dataset.IDataSet;
import org.dbunit.dataset.xml.FlatXmlDataSet;
import org.dbunit.ext.mysql.MySqlDataTypeFactory;
import org.junit.After;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.sql.Connection;
import java.sql.DriverManager;

import static org.junit.Assert.*;

public class BasicDaoTest {

    private static final String driverClassName="com.mysql.cj.jdbc.Driver";
    private static final String url="jdbc:mysql://localhost:3306/teamwork";
    private static final String username="root";
    private static final String password="root_123";

    private static JdbcDatabaseTester jdbcDatabaseTester;
    private static IDataSet iDataSet;

    /*@Before
    public void setUp() throws Exception {
        jdbcDatabaseTester = new JdbcDatabaseTester(driverClassName,url,username,password,"teamwork");
        iDataSet = jdbcDatabaseTester.getConnection().createDataSet();
        FlatXmlDataSet.write(iDataSet,new FileOutputStream(new File("team.xml")));
        //iDataSet = new FlatXmlDataSet(new FileInputStream(new File("teamwork-init.xml")));
        //jdbcDatabaseTester.setDataSet(iDataSet);
    }*/

    @BeforeClass
    public static void init() throws Exception{
        Class.forName(driverClassName);
        Connection connection = DriverManager.getConnection(url,username,password);
        IDatabaseConnection iDatabaseConnection = new DatabaseConnection(connection);
        iDatabaseConnection.getConfig().setProperty(DatabaseConfig.PROPERTY_DATATYPE_FACTORY, new MySqlDataTypeFactory());
        iDataSet = iDatabaseConnection.createDataSet();
        System.out.println(iDatabaseConnection.getSchema());
        FlatXmlDataSet.write(iDataSet,new FileOutputStream(new File("team.xml")));
       /* jdbcDatabaseTester = new JdbcDatabaseTester(driverClassName,url,username,password,"teamwork");
        System.out.println(jdbcDatabaseTester.getConnection().getSchema());
        iDataSet = jdbcDatabaseTester.getConnection().createDataSet();
        FlatXmlDataSet.write(iDataSet,new FileOutputStream(new File("team.xml")));*/
    }

    @After
    public void tearDown() throws Exception {

    }

    @Test
    public void save() {
    }

    @Test
    public void remove() {
    }

    @Test
    public void update() {
    }

    @Test
    public void get() throws Exception{

    }

    @Test
    public void load() {
    }

    @Test
    public void count() {
    }
}