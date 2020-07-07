/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import config.*;

public class Aviso {
    
    private int id_aviso;
    private String encabezado;
    private String subtitulo;
    private String cuerpo;
    private int id_autor;
    private String nombreAutor;

    public Aviso(){}
    
    public Aviso(int id_aviso, String encabezado, String subtitulo, String cuerpo, int id_autor) {
        this.id_aviso = id_aviso;
        this.encabezado = encabezado;
        this.subtitulo = subtitulo;
        this.cuerpo = cuerpo;
        this.id_autor = id_autor;
    }
    
    public Aviso(String encabezado, String subtitulo, String cuerpo, int id_autor) {
        this.id_aviso = id_aviso;
        this.encabezado = encabezado;
        this.subtitulo = subtitulo;
        this.cuerpo = cuerpo;
        this.id_autor = id_autor;
    }
    
    public Aviso( int id_aviso, String encabezado, String subtitulo, String cuerpo) {
        this.id_aviso = id_aviso;
        this.encabezado = encabezado;
        this.subtitulo = subtitulo;
        this.cuerpo = cuerpo;
    }
    
    public Aviso(int id_aviso, String encabezado, String subtitulo, String cuerpo, String nombreAutor) {
        this.id_aviso = id_aviso;
        this.encabezado = encabezado;
        this.subtitulo = subtitulo;
        this.cuerpo = cuerpo;
        this.nombreAutor = nombreAutor;
    }
    
    public Aviso(int id_aviso) {
        this.id_aviso = id_aviso;
    }
    
    public Aviso(int id_autor, int id_aviso) {
        this.id_autor = id_autor;
        this.id_aviso = id_aviso;
    }
    

    public int getId_aviso() {
        return id_aviso;
    }

    public void setId_aviso(int id_aviso) {
        this.id_aviso = id_aviso;
    }

    public String getEncabezado() {
        return encabezado;
    }

    public void setEncabezado(String encabezado) {
        this.encabezado = encabezado;
    }

    public String getSubtitulo() {
        return subtitulo;
    }

    public void setSubtitulo(String subtitulo) {
        this.subtitulo = subtitulo;
    }

    public String getCuerpo() {
        return cuerpo;
    }

    public void setCuerpo(String cuerpo) {
        this.cuerpo = cuerpo;
    }

    public int getId_autor() {
        return id_autor;
    }

    public void setId_autor(int id_autor) {
        this.id_autor = id_autor;
    }

    public String getNombreAutor() {
        return nombreAutor;
    }

    public void setNombreAutor(String nombreAutor) {
        this.nombreAutor = nombreAutor;
    }
    
    
    
}
