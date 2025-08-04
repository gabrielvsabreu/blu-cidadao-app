package com.blu_cidadao.blucidadao_spring_boot.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "ouvidoria")
public class Ouvidoria {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id_ouvidoria;

    @Column(name = "nome_ouvidoria", length = 100, nullable = false)
    private String nome_ouvidoria;

    public Ouvidoria() {
    }

    public Ouvidoria(Integer id_ouvidoria, String nome_ouvidoria) {
        this.id_ouvidoria = id_ouvidoria;
        this.nome_ouvidoria = nome_ouvidoria;
    }

    public Integer getId_ouvidoria() {
        return id_ouvidoria;
    }
    public void setId_ouvidoria(Integer id_ouvidoria) {
        this.id_ouvidoria = id_ouvidoria;
    }

    public String getNome_ouvidoria() {
        return nome_ouvidoria;
    }
    public void setNome_ouvidoria(String nome_ouvidoria) {
        this.nome_ouvidoria = nome_ouvidoria;
    }

}
