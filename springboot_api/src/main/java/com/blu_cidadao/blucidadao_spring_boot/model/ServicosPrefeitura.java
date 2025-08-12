// Edited by: Gabrielli Danker
package com.blu_cidadao.blucidadao_spring_boot.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "servicos_prefeitura")

public class ServicosPrefeitura {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_servico")
    private Integer id_servico;

    @Column(name = "nome_servico", length = 100, nullable = false)
    private String nome_servico;

    public ServicosPrefeitura() {
    }

    public ServicosPrefeitura(Integer id_servico, String nome_servico) {
        this.id_servico = id_servico;
        this.nome_servico = nome_servico;
    }

    public Integer getId_servico() {
        return id_servico;
    }
    public void setId_servico(Integer id_servico) {
        this.id_servico = id_servico;
    }

    public String getNome_servico() {
        return nome_servico;
    }
    public void setNome_servico(String nome_servico) {
        this.nome_servico = nome_servico;
    }

}
