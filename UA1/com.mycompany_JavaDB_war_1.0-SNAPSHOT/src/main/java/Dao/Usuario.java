/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

/**
 *
 * @author aleja
 */
public class Usuario {
    
    private int id_usuario;
    private String usuario;
    private String password;
    private int edad;

    public Usuario(){
    }
    
    public Usuario(int id_usuario, String usuario, String password, int edad){
        this.id_usuario=id_usuario;
        this.usuario=usuario;
        this.password=password;
        this.edad=edad;
    }
    
    public Usuario(String usuario, String password, int edad){
        this.usuario=usuario;
        this.password=password;
        this.edad=edad;
    }
    
    public Usuario(String usuario, int edad, int id_usuario){
        this.usuario=usuario;
        this.edad=edad;
        this.id_usuario=id_usuario;
    }
    
    public Usuario(String password, int id_usuario){
        this.password=password;
        this.id_usuario=id_usuario;
    }
    
    public Usuario(int id_usuario){
        this.id_usuario=id_usuario;
    }

    public int getId_usuario(){
        return this.id_usuario;
    }

    public void setId_usuario(int id_usuario){
        this.id_usuario=id_usuario;
    }

    public String getUsuario(){
        return this.usuario;
    }

    public void setUsuario(String usuario){
        this.usuario=usuario;
    }   

    public String getPassword(){
        return this.password;
    }

    public void setPassword(String password){
        this.password=password;
    }
    
    public int getEdad(){
        return this.edad;
    }

    public void setEdad(int edad){
        this.edad=edad;
    }

}

