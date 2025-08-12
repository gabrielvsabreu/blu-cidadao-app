// Edited by: Gabrielli Danker
package com.blu_cidadao.blucidadao_spring_boot.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "tipo_ouvidoria")
public class TipoOuvidoria {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_tipo_ouvidoria")
    private Integer id_tipo_ouvidoria;

    @Column(name = "nome_tipo_ouvidoria")
    private String nome_tipo_ouvidoria;

    public TipoOuvidoria() {}

    public TipoOuvidoria(Integer id_tipo_ouvidoria, String nome_tipo_ouvidoria) {
        this.id_tipo_ouvidoria = id_tipo_ouvidoria;
        this.nome_tipo_ouvidoria = nome_tipo_ouvidoria;
    }

    public Integer getId_tipo_ouvidoria() {
        return id_tipo_ouvidoria;
    }

    public void setId_tipo_ouvidoria(Integer id_tipo_ouvidoria) {
        this.id_tipo_ouvidoria = id_tipo_ouvidoria;
    }

    public String getNome_tipo_ouvidoria() {
        return nome_tipo_ouvidoria;
    }

    public void setNome_tipo_ouvidoria(String nome_tipo_ouvidoria) {
        this.nome_tipo_ouvidoria = nome_tipo_ouvidoria;
    }
}
