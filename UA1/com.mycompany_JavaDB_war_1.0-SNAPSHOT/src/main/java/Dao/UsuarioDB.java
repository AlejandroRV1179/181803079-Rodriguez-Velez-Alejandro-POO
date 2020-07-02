/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import java.sql.*;
import config.*;
import java.util.*;

public class UsuarioDB {

    private static final String listado = "SELECT * FROM usuarios";

    private Connection con = new Conexion().getConexion();
    private PreparedStatement ps;
    private ResultSet rs;

    public List<Usuario> listarUsuarios() throws SQLException {

        List<Usuario> usuarios = new ArrayList<>();
        this.ps = this.con.prepareStatement(this.listado);
        this.rs = this.ps.executeQuery();

        while (this.rs.next()) {
            usuarios.add(new Usuario(this.rs.getInt("id_usuario"), this.rs.getString("nombre"),
                    this.rs.getString("password"), this.rs.getInt("edad")));
        }
        return usuarios;
    }

    public boolean agregarUsuario(Usuario usuario) throws SQLException {

        String sql = "INSERT INTO usuarios SET nombre=?, password=MD5(?), edad=?";
        boolean agregado = false;

        this.ps = this.con.prepareStatement(sql);
        this.ps.setString(1, usuario.getUsuario());
        this.ps.setString(2, usuario.getPassword());
        this.ps.setInt(3, usuario.getEdad());

        if (this.ps.executeUpdate() == 1) {
            agregado = true;
        }
        return agregado;
    }

    public boolean editarUsuario(Usuario usuario) throws SQLException {

        String sql = "UPDATE usuarios SET nombre=?, edad=? WHERE id_usuario=?";
        boolean editado = false;
        this.ps = this.con.prepareStatement(sql);

        this.ps.setString(1, usuario.getUsuario());
        this.ps.setInt(2, usuario.getEdad());
        this.ps.setInt(3, usuario.getId_usuario());

        if (this.ps.executeUpdate() == 1) {
            editado = true;
        }
        return editado;
    }

    //Metodos para actualizar contraseña
    public boolean compareActualPasswords(Usuario usuario) throws SQLException { //Usuario (string pass, int id)

        String sql = "SELECT id_usuario from usuarios WHERE MD5(?)=password AND id_usuario=?";
        boolean coincideActual = false;
        this.ps = this.con.prepareStatement(sql);
        this.ps.setString(1, usuario.getPassword());
        this.ps.setInt(2, usuario.getId_usuario());
        this.rs = this.ps.executeQuery();
        while (this.rs.next()) {
            coincideActual = true;
        }
        return coincideActual;
    }

    public boolean comparaNueva(String a, String b) {
        boolean coincidenNuevas = false;
        if (a.equals(b)) {
            coincidenNuevas = true;
        }
        return coincidenNuevas;
    }

    public boolean actualizarContra(Usuario usuario) throws SQLException { //Usuario (pass, id)

        String sql = "UPDATE usuarios SET password=MD5(?) WHERE id_usuario=?";
        boolean actualizada = false;

        this.ps = this.con.prepareStatement(sql);
        this.ps.setString(1, usuario.getPassword());
        this.ps.setInt(2, usuario.getId_usuario());

        if (this.ps.executeUpdate() == 1) {
            actualizada = true;
        }
        return actualizada;

    }

    public boolean eliminarUsuario(Usuario usuario) throws SQLException {
        String sql = "DELETE FROM usuarios WHERE id_usuario=?";
        boolean eliminado = false;
        this.ps = this.con.prepareStatement(sql);
        this.ps.setInt(1, usuario.getId_usuario());
        
        if(ps.executeUpdate()==1){
            eliminado = true;
        }
        
        return eliminado;
    }

}
