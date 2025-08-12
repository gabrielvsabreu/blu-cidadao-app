// Edited by: Gabrielli Danker
package com.blu_cidadao.blucidadao_spring_boot.model;

import jakarta.persistence.*;

@Entity
@Table(name = "ouvidoria")
public class Ouvidoria {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id_ouvidoria;

    @ManyToOne(fetch = FetchType.LAZY)  // Muitos ouvidorias para um tipo_ouvidoria
    @JoinColumn(name = "id_tipo_ouvidoria", nullable = false)
    private TipoOuvidoria tipoOuvidoria;

    @Column(name = "nome_ouvidoria", length = 100, nullable = false)
    private String nome_ouvidoria;

    public Ouvidoria() {}

    public Ouvidoria(TipoOuvidoria tipoOuvidoria, String nome_ouvidoria) {
        this.tipoOuvidoria = tipoOuvidoria;
        this.nome_ouvidoria = nome_ouvidoria;
    }

    public Integer getId_ouvidoria() {
        return id_ouvidoria;
    }
    public void setId_ouvidoria(Integer id_ouvidoria) {
        this.id_ouvidoria = id_ouvidoria;
    }

    public TipoOuvidoria getTipoOuvidoria() {
        return tipoOuvidoria;
    }
    public void setTipoOuvidoria(TipoOuvidoria tipoOuvidoria) {
        this.tipoOuvidoria = tipoOuvidoria;
    }

    public String getNome_ouvidoria() {
        return nome_ouvidoria;
    }
    public void setNome_ouvidoria(String nome_ouvidoria) {
        this.nome_ouvidoria = nome_ouvidoria;
    }
}

