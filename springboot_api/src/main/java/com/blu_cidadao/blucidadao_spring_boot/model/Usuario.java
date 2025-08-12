// Edited by: Gabrielli Danker
package com.blu_cidadao.blucidadao_spring_boot.model;

import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

import java.time.LocalDate;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

@Entity
@Table(name = "usuario")
public class Usuario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_usuario;

    @Column(name = "nome_completo", length = 50, nullable = false)
    private String nome_completo;

    @Column(name = "email", length = 100, nullable = false, unique = true)
    private String email;

    @Column(name = "senha", length = 100, nullable = false)
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    private String senha;

    @Column(name = "cpf", length = 14, nullable = false, unique = true)
    private String cpf;

    @Column(name = "telefone", length = 20, nullable = true)
    private String telefone;

    @Column(name = "data_nascimento", nullable = true)
    private LocalDate data_nascimento;

    // RELACIONAMENTO 1:N com Endereco
    @OneToMany(mappedBy = "usuario", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Endereco> enderecos;

    // Default constructor
    public Usuario() {
    }   

    // Parameterized constructor
    public Usuario(int id_usuario, String nome_completo, String email, String senha, String cpf, String telefone, LocalDate data_nascimento, List<Endereco> enderecos) {
        super();
        this.id_usuario = id_usuario;
        this.nome_completo = nome_completo;
        this.email = email;
        this.senha = senha;
        this.cpf = cpf;
        this.telefone = telefone;
        this.data_nascimento = data_nascimento;
        this.enderecos = enderecos;
    }

    // Getters and Setters
    public int getId_usuario() {
        return id_usuario;
    }
    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public List<Endereco> getEndereco() {
        return enderecos;
    }
    public void setEndereco(List<Endereco> enderecos) {
        this.enderecos = enderecos;
    }

    public String getNome_completo() {
        return nome_completo;
    }
    public void setNome_completo(String nome_completo) {
        this.nome_completo = nome_completo;
    }

    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }
    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getCpf() {
        return cpf;
    }
    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getTelefone() {
        return telefone;
    }
    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public LocalDate getData_nascimento() {
        return data_nascimento;
    }
    public void setData_nascimento(LocalDate data_nascimento) {
        this.data_nascimento = data_nascimento;
    }

}
