// Edited by: Gabrielli Danker
package com.blu_cidadao.blucidadao_spring_boot.model;

import jakarta.persistence.*;

@Entity
@Table(name = "servicos_prefeitura")
public class ServicosPrefeitura {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_servicos")  // plural para bater com o banco
    private Integer id_servicos;

    @Column(name = "nome_servicos", length = 100, nullable = false)  // plural
    private String nome_servicos;

    public ServicosPrefeitura() {}

    public ServicosPrefeitura(Integer id_servicos, String nome_servicos) {
        this.id_servicos = id_servicos;
        this.nome_servicos = nome_servicos;
    }

    public Integer getId_servicos() {
        return id_servicos;
    }

    public void setId_servicos(Integer id_servicos) {
        this.id_servicos = id_servicos;
    }

    public String getNome_servicos() {
        return nome_servicos;
    }

    public void setNome_servicos(String nome_servicos) {
        this.nome_servicos = nome_servicos;
    }
}

