package utilities;

import jakarta.servlet.ServletContext;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectDB {
    private String hostName;
    private String instance;
    private String port;
    private String dbName;
    private String user;
    private String pass;

    public ConnectDB() {
        this.hostName = "127.0.0.1";
        this.instance = ""; // Instance mặc định
        this.port = "1433";
        this.dbName = "ProductIntro"; // Khớp với SQL
        this.user = "sa"; // Thay bằng user thật nếu cần
        this.pass = "12345"; // Thử pass, nếu sai, dùng pass của tài khoản cụ thể
    }

    public ConnectDB(ServletContext sc) {
        this.hostName = sc.getInitParameter("hostAddress");
        this.instance = sc.getInitParameter("instance");
        this.dbName = sc.getInitParameter("dbName");
        this.port = sc.getInitParameter("dbPort");
        this.user = sc.getInitParameter("username");
        this.pass = sc.getInitParameter("password");
    }

    public String getURLString() {
        return String.format("jdbc:sqlserver://%s:%s;databaseName=%s;encrypt=false",
                hostName, port, dbName);
    }

    public Connection getConnection() throws ClassNotFoundException, SQLException {
        System.out.println("Thử kết nối tới: " + getURLString());
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        Connection conn = DriverManager.getConnection(getURLString(), user, pass);
        System.out.println("Kết nối thành công!");
        return conn;
    }
}