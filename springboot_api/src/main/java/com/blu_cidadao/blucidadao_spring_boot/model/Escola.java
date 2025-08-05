package com.blu_cidadao.blucidadao_spring_boot.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "escolas_blumenau")
public class Escola {

    @Id 
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id_escola;

    @Column(name = "codigo_inep", unique= true)
    private String codigo_inep;

    private String nome;
    private String rede;
    private String endereco;
    private String bairro;
    private String municipio;
    private String uf;

    // Construtores
    public Escola() {
    
    }

    public Escola(Long id_escola, String codigo_inep, String nome, String rede, 
    String endereco, String bairro, String municipio, String uf){
        this.id_escola = id_escola;
        this.codigo_inep = codigo_inep;
        this.nome = nome;
        this.rede = rede;
        this.endereco = endereco;
        this.bairro = bairro;
        this.municipio = municipio;
        this.uf = uf;
    }

    public Long getId_escola() {
        return id_escola;
    }
    public void setId_escola(Long id_escola) {
        this.id_escola = id_escola;
    }

    public String getCodigo_inep() {
        return codigo_inep;
    }
    public void setCodigo_inep(String codigo_inep) {
        this.codigo_inep = codigo_inep;
    }

    public String getNome() {
        return nome;
    }
    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getRede() {
        return rede;
    }
    public void setRede(String rede) {
        this.rede = rede;
    }

    public String getEndereco() {
        return endereco;
    }
    public void setEndereco(String endereco) {
        this.endereco = endereco;
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
