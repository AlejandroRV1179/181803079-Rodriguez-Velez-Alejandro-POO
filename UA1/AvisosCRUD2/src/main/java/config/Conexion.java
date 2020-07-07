/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package config;

import java.sql.*;

public class Conexion {

    private Connection con = null;
    private final String BASE = "avisos";
    private final String URL = "jdbc:mysql://localhost:3306/" + BASE + "?serverTimezone=UTC";
    private final String USER = "root";
    private final String PASSWORD = "";

    public Connection getConexion() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            this.con = DriverManager.getConnection(this.URL, this.USER, this.PASSWORD);
        } catch (SQLException e) {

        } finally {
            return this.con;

        }
    }

}
