/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import java.sql.*;
import config.*;
import java.util.ArrayList;
import java.util.List;

public class AvisoBD {
    
    private static final String listarSQL = "SELECT id_aviso, encabezado, subtitulo, cuerpo, nombre FROM avisos JOIN autores ON avisos.id_autor=autores.id_autor ORDER BY id_aviso";

    private Connection con = new Conexion().getConexion();
    private PreparedStatement ps;
    private ResultSet rs;

    public List<Aviso> listarAvisosIndex() throws SQLException{

        List<Aviso> avisos = new ArrayList<>();
        this.ps = this.con.prepareStatement(this.listarSQL);
        this.rs = this.ps.executeQuery();

        while (this.rs.next()) {
            avisos.add(new Aviso(this.rs.getInt("id_aviso"), this.rs.getString("encabezado"),
                    this.rs.getString("subtitulo"),this.rs.getString("cuerpo"), this.rs.getString("nombre")));
        }
        return avisos;
    }
    
    
    public boolean agregarAviso(Aviso aviso) throws SQLException {

        String sql = "INSERT INTO avisos SET encabezado=?, subtitulo=?, cuerpo=?, id_autor=?";
        boolean agregado = false;

        this.ps = this.con.prepareStatement(sql);
        this.ps.setString(1, aviso.getEncabezado());
        this.ps.setString(2, aviso.getSubtitulo());
        this.ps.setString(3, aviso.getCuerpo());
        this.ps.setInt(4, aviso.getId_autor());

        if (this.ps.executeUpdate() == 1) {
            agregado = true;
        }
        return agregado;
    }

    public boolean editarAviso(Aviso aviso) throws SQLException {

        String sql = "UPDATE avisos SET encabezado=?, subtitulo=?, cuerpo=? WHERE id_aviso=?";
        boolean editado = false;
        this.ps = this.con.prepareStatement(sql);

        this.ps.setString(1, aviso.getEncabezado());
        this.ps.setString(2, aviso.getSubtitulo());
        this.ps.setString(3, aviso.getCuerpo());
        this.ps.setInt(4, aviso.getId_aviso());

        if (this.ps.executeUpdate() == 1) {
            editado = true;
        }
        return editado;
    }
    
    public boolean editarAvisoAutor(Aviso aviso) throws SQLException {

        String sql = "UPDATE avisos SET id_autor=? WHERE id_aviso=?";
        boolean editado = false;
        this.ps = this.con.prepareStatement(sql);

        this.ps.setInt(1, aviso.getId_autor());
        this.ps.setInt(2, aviso.getId_aviso());

        if (this.ps.executeUpdate() == 1) {
            editado = true;
        }
        return editado;
    }


    public boolean eliminarAviso(Aviso aviso) throws SQLException {
        String sql = "DELETE FROM avisos WHERE id_aviso=?";
        boolean eliminado = false;
        this.ps = this.con.prepareStatement(sql);
        this.ps.setInt(1, aviso.getId_aviso());
        
        if(ps.executeUpdate()==1){
            eliminado = true;
        }
        
        return eliminado;
    }
    
}
