// Edited by: Gabrielli Danker

package com.blu_cidadao.blucidadao_spring_boot.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;


@Entity
@Table(name = "endereco")
public class Endereco {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id_endereco;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_usuario", nullable = false)
    private Usuario usuario;

    @Column(name = "cep", length = 10, nullable = false)
    private String cep;

    @Column(name = "rua", length = 100, nullable = false)
    private String rua;

    @Column(name = "bairro", length = 100, nullable = false)
    private String bairro;

    @Column(name = "numero", length = 10)
    private String numero;

    @Column(name = "complemento", length = 100)
    private String complemento;

    @Column(name = "cidade", length = 100, nullable = false)
    private String cidade;

    @Column(name = "estado", length = 50, nullable = false)
    private String estado;

    @Column(name = "pais", length = 100, nullable = false)
    private String pais;

    public Endereco() {}

    public Endereco(Integer id_endereco, Usuario usuario, String cep, String rua, String bairro, String numero, String complemento, String cidade, String estado, String pais) {
        this.id_endereco = id_endereco;
        this.usuario = usuario;
        this.cep = cep;
        this.rua = rua;
        this.bairro = bairro;
        this.numero = numero;
        this.complemento = complemento;
        this.cidade = cidade;
        this.estado = estado;
        this.pais = pais;
    }

    // getters e setters (incluindo getId / setId)
    public Integer getId_endereco() {
         return id_endereco; 
    }
    public void setId_endereco(Integer id_endereco) { 
        this.id_endereco = id_endereco; 
    }

    public Usuario getUsuario() {
         return usuario; 
    }
    public void setUsuario(Usuario usuario) {
         this.usuario = usuario; 
    }

    public String getCep() {
         return cep; 
    }
    public void setCep(String cep) {
         this.cep = cep;
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

    public String getNumero() {
         return numero;
    }
    public void setNumero(String numero) {
         this.numero = numero;
    }

    public String getComplemento() {
         return complemento;
    }
    public void setComplemento(String complemento) {
         this.complemento = complemento;
    }

    public String getCidade() {
         return cidade;
    }
    public void setCidade(String cidade) {
         this.cidade = cidade;
    }

    public String getEstado() {
         return estado;
    }
    public void setEstado(String estado) {
         this.estado = estado;
    }

    public String getPais() {
         return pais;
    }
    public void setPais(String pais) {
         this.pais = pais;
    }

}
