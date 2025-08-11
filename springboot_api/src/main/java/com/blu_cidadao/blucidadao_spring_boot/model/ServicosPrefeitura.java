//Editor: Gabrielli Danker
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
    private Integer id_servico;

    @Column(name = "nome_servico", length = 100, nullable = false)
    private String nomeServico;

    public ServicosPrefeitura() {
    }

    public ServicosPrefeitura(Integer id_servico, String nomeServico) {
        this.id_servico = id_servico;
        this.nomeServico = nomeServico;
    }

    public Integer getId_servico() {
        return id_servico;
    }
    public void setId_servico(Integer id_servico) {
        this.id_servico = id_servico;
    }

    public String getNomeServico() {
        return nomeServico;
    }
    public void setNomeServico(String nomeServico) {
        this.nomeServico = nomeServico;
    }

}
