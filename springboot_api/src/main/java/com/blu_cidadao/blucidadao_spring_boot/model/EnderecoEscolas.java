//Editor: Gabrielli Danker
package com.blu_cidadao.blucidadao_spring_boot.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "endereco_escolas")
public class EnderecoEscolas {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id_endereco;

    @OneToOne
    @JoinColumn(name = "id_escola", referencedColumnName = "id_escola")
    private Escola escola;

    private String rua;
    private String bairro;
    private String municipio;
    private String uf;

    //Contrutores
    public EnderecoEscolas(){

    }

    public EnderecoEscolas(Integer id_endereco, Escola escola, String rua, String bairro, String municipio, String uf){
        this.id_endereco = id_endereco;
        this.escola = escola;
        this.rua = rua;
        this.bairro = bairro;
        this.municipio = municipio;
    }

    //Getters e Setters
    public Integer getId_endereco() {
        return id_endereco;
    }
    public void setId_endereco(Integer id_endereco) {
        this.id_endereco = id_endereco;
    }

    public Escola getEscola() {
        return escola;
    }
    public void setEscola(Escola escola) {
        this.escola = escola;
    }

    public String getRua() {
        return rua;
    }
    public void setRua(String rua) {
        this.rua = rua;
    }

    public String getBairro() {
        return bairro;
    }
    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getMunicipio() {
        return municipio;
    }
    public void setMunicipio(String municipio) {
        this.municipio = municipio;
    }

    public String getUf() {
        return uf;
    }
    public void setUf(String uf) {
        this.uf = uf;
    }

}
