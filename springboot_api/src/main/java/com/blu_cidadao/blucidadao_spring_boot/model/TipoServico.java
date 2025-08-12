// Edited by: Gabrielli Danker
package com.blu_cidadao.blucidadao_spring_boot.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "tipo_servico")
public class TipoServico {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_tipo_servico")
    private Integer id_tipo_servico;

    @Column(name = "nome_tipo_servico")
    private String nome_tipo_servico;

    public TipoServico() {}

    public TipoServico(Integer id_tipo_servico, String nome_tipo_servico) {
        this.id_tipo_servico = id_tipo_servico;
        this.nome_tipo_servico = nome_tipo_servico;
    }

    public Integer getId_tipo_servico() {
        return id_tipo_servico;
    }

    public void setId_tipo_servico(Integer id_tipo_servico) {
        this.id_tipo_servico = id_tipo_servico;
    }

    public String getNome_tipo_servico() {
        return nome_tipo_servico;
    }

    public void setNome_tipo_servico(String nome_tipo_servico) {
        this.nome_tipo_servico = nome_tipo_servico;
    }
}
