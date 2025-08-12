//Editor: Gabrielli Danker

package com.blu_cidadao.blucidadao_spring_boot.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;


@Entity
@Table(name = "endereco")
public class Endereco {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "logradouro", length = 100, nullable = false)
    private String logradouro;

    @Column(name = "numero", length = 10, nullable = false)
    private String numero;

    @Column(name = "bairro", length = 50, nullable = false)
    private String bairro;

    @Column(name = "cidade", length = 50, nullable = false)
    private String cidade;

    @Column(name = "estado", length = 2, nullable = false)
    private String estado;

    @Column(name = "cep", length = 10, nullable = false)
    private String cep;

    public Endereco() {}

    public Endereco(String logradouro, String numero, String bairro, String cidade, String estado, String cep) {
        this.logradouro = logradouro;
        this.numero = numero;
        this.bairro = bairro;
        this.cidade = cidade;
        this.estado = estado;
        this.cep = cep;
    }

    // getters e setters (incluindo getId / setId)
    public Integer getId() { return id; }
    
    public void setId(Integer id) { this.id = id; }
    
    public String getLogradouro() { return logradouro; }
    
    public void setLogradouro(String logradouro) { this.logradouro = logradouro; }
    
    public String getNumero() { return numero; }
    
    public void setNumero(String numero) { this.numero = numero; }
    
    public String getBairro() { return bairro; }
    
    public void setBairro(String bairro) { this.bairro = bairro; }
    
    public String getCidade() { return cidade; }
    
    public void setCidade(String cidade) { this.cidade = cidade; }
    
    public String getEstado() { return estado; }
    
    public void setEstado(String estado) { this.estado = estado; }
    
    public String getCep() { return cep; }
    
    public void setCep(String cep) { this.cep = cep; }
    
}
