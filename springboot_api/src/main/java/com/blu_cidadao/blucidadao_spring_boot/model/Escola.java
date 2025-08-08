//Editor: Gabrielli Danker

package com.blu_cidadao.blucidadao_spring_boot.model;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name= "escolas")
public class Escola {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id_escola;

    @Column(name = "codigo_inep", unique= true)
    private String codigo_inep;

    private String nome;
    private String rede;
    

    @OneToOne(mappedBy = "escola", cascade = CascadeType.ALL)
    private EnderecoEscolas endereco;


    //Construtores
    public Escola(){

    }
    public Escola(Integer id_escola, String codigo_inep, String nome, String rede, EnderecoEscolas endereco){
        this.id_escola = id_escola;
        this.codigo_inep = codigo_inep;
        this.nome = nome;
        this.rede = rede;
        this.endereco = endereco;
    }

    //Getters e Setters
    public Integer getId_escola() {
        return id_escola;
    }
    public void setId_escola(Integer id_escola) {
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

    public EnderecoEscolas getEndereco() {
        return endereco;
    }
    public void setEndereco(EnderecoEscolas endereco) {
        this.endereco = endereco;
    }
    
}
