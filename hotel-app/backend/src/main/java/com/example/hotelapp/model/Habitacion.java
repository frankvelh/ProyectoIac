package com.example.hotelapp.model;

import jakarta.persistence.*;

@Entity
@Table(name = "habitaciones") // Opcional pero recomendable para nombrar la tabla
public class Habitacion {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String numero;

    private String tipo;

    private boolean disponible;

    // Constructores (uno vacío obligatorio para JPA)
    public Habitacion() {
    }

    public Habitacion(String numero, String tipo, boolean disponible) {
        this.numero = numero;
        this.tipo = tipo;
        this.disponible = disponible;
    }

    // Getters y Setters
    public Long getId() { return id; }

    public void setId(Long id) { this.id = id; }

    public String getNumero() { return numero; }

    public void setNumero(String numero) { this.numero = numero; }

    public String getTipo() { return tipo; }

    public void setTipo(String tipo) { this.tipo = tipo; }

    public boolean isDisponible() { return disponible; }
    
    public boolean getDisponible() { return disponible; }

    public void setDisponible(boolean disponible) { this.disponible = disponible; }
}
