/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import java.sql.*;
import config.*;
import static java.lang.System.out;
import java.util.ArrayList;
import java.util.List;

public class AutorBD {
 
    private static final String listarSQL = "SELECT * FROM autores";

    private Connection con = new Conexion().getConexion();
    private PreparedStatement ps;
    private ResultSet rs;

    public List<Autor> listarAutores() throws SQLException{

        List<Autor> autores = new ArrayList<>();
        this.ps = this.con.prepareStatement(this.listarSQL);
        this.rs = this.ps.executeQuery();

        while (this.rs.next()) {
            autores.add(new Autor(this.rs.getInt("id_autor"), this.rs.getString("nombre")));
        }
        return autores;
    }
    
    public List<Autor> listarCambiarAutor(Autor autor) throws SQLException{

        String sql = "SELECT * FROM autores WHERE nombre <> '"+autor.getNombre()+"' ";
        List<Autor> autores = new ArrayList<>();
        this.ps = this.con.prepareStatement(sql);
        this.rs = this.ps.executeQuery();

        while (this.rs.next()) {
            autores.add(new Autor(this.rs.getInt("id_autor"), this.rs.getString("nombre")));
        }
        return autores;
    }
    

    public boolean agregarAutor(Autor autor) throws SQLException {

        String sql = "INSERT INTO autores SET nombre=?";
        boolean agregado = false;

        this.ps = this.con.prepareStatement(sql);
        this.ps.setString(1, autor.getNombre());

        if (this.ps.executeUpdate() == 1) {
            agregado = true;
        }
        return agregado;
    }

    public boolean editarAutor(Autor autor) throws SQLException {

        String sql = "UPDATE autores SET nombre=? WHERE id_autor=?";
        boolean editado = false;
        this.ps = this.con.prepareStatement(sql);

        this.ps.setString(1, autor.getNombre());
        this.ps.setInt(2, autor.getId_autor());

        if (this.ps.executeUpdate() == 1) {
            editado = true;
        }
        return editado;
    }


    public boolean eliminarAutor(Autor autor) throws SQLException {
        String sql = "DELETE FROM autores WHERE id_autor=?";
        boolean eliminado = false;
        this.ps = this.con.prepareStatement(sql);
        this.ps.setInt(1, autor.getId_autor());
        
        if(ps.executeUpdate()==1){
            eliminado = true;
        }
        
        return eliminado;
    }
    
    public boolean tieneAvisosAutor(Autor autor) throws SQLException{
        boolean tieneAvisos = false;
        String sql = "SELECT COUNT(*) FROM avisos WHERE id_autor=" + autor.getId_autor();
        int numeroAvisos = -1;
        this.ps = this.con.prepareStatement(sql);
        this.rs = this.ps.executeQuery();
        if (rs.next()){
            numeroAvisos = this.rs.getInt(1);
        }
        if (numeroAvisos>0){
            tieneAvisos=true;
        }
        
        return tieneAvisos;
    }
    
    
}
