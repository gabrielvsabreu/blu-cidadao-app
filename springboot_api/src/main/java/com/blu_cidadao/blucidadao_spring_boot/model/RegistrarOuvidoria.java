//Editor: Gabrielli Danker
package com.blu_cidadao.blucidadao_spring_boot.model;

import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "registrar_ouvidoria")
public class RegistrarOuvidoria {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id_registrar;

    @ManyToOne
    @JoinColumn(name = "id_ouvidoria", nullable = false)
    private Ouvidoria ouvidoria;

    @ManyToOne
    @JoinColumn(name = "id_endereco", nullable = false)
    private Endereco endereco;

    @Column(name = "dia", nullable = false)
    private LocalDate dia;

    @Column(name = "comentario", length = 500)
    private String comentario;

    @Column(name = "status", length = 20)
    private String status = "Aberta";

    // Default constructor
    public RegistrarOuvidoria() {
    }
    
    // Parameterized constructor
    public RegistrarOuvidoria(Integer id_registrar, Ouvidoria ouvidoria, Endereco endereco, LocalDate dia, String comentario, String status) {
        this.id_registrar = id_registrar;
        this.ouvidoria = ouvidoria;
        this.endereco = endereco;
        this.dia = dia;
        this.comentario = comentario;
        this.status = status;
    }

    // Getters and Setters
    public Integer getId_registrar() {
        return id_registrar;
    }
    public void setId_registrar(Integer id_registrar) {
        this.id_registrar = id_registrar;
    }

    public Ouvidoria getOuvidoria() {
        return ouvidoria;
    }
    public void setOuvidoria(Ouvidoria ouvidoria) {
        this.ouvidoria = ouvidoria;
    }

    public Endereco getEndereco() {
        return endereco;
    }
    public void setEndereco(Endereco endereco) {
        this.endereco = endereco;
    }

    public LocalDate getDia() {
        return dia;
    }
    public void setDia(LocalDate dia) {
        this.dia = dia;
    }

    public String getComentario() {
        return comentario;
    }
    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }


}
