
package com.emergentes.modelo;

public class Libro {
    private int id;
    private String Titulo;
    private String Autor;
    private String Resumen;
    private String Medio;

    public Libro() {
        this.id = 0;
        this.Titulo = "";
        this.Autor = "";
        this.Resumen = "";
        this.Medio = "";
    }

    public Libro(int id, String Titulo, String Autor, String Resumen, String Medio) {
        this.id = id;
        this.Titulo = Titulo;
        this.Autor = Autor;
        this.Resumen = Resumen;
        this.Medio = Medio;
    }
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitulo() {
        return Titulo;
    }

    public void setTitulo(String Titulo) {
        this.Titulo = Titulo;
    }

    public String getAutor() {
        return Autor;
    }

    public void setAutor(String Autor) {
        this.Autor = Autor;
    }

    public String getResumen() {
        return Resumen;
    }

    public void setResumen(String Resumen) {
        this.Resumen = Resumen;
    }

    public String getMedio() {
        return Medio;
    }

    public void setMedio(String Medio) {
        this.Medio = Medio;
    }
}
