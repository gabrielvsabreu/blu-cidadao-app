//Editor: Gabrielli Danker

package com.blu_cidadao.blucidadao_spring_boot.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "agendamento")
public class Agendamento {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id_agendamento;

    @ManyToOne
    @JoinColumn(name = "id_usuario", nullable = false)
    private Usuario usuario;

    @ManyToOne
    @JoinColumn(name = "id_servico", nullable = false)
    private ServicosPrefeitura servico;

    @Column(name= "dia", nullable = false)
    private String dia;

    @Column(name= "hora", nullable = false)
    private String hora;

    @Column(name = "protocolo", length = 10, nullable = false)
    private String protocolo;

    // Default constructor
    public Agendamento() {
    }

    // Parameterized constructor
    public Agendamento(Integer id_agendamento, Usuario usuario, ServicosPrefeitura servico, String dia, String hora, String protocolo) {
        this.id_agendamento = id_agendamento;
        this.usuario = usuario;
        this.servico = servico;
        this.dia = dia;
        this.hora = hora;
        this.protocolo = protocolo;
    }

    // Getters and Setters
    public Integer getId_agendamento() {
        return id_agendamento;
    }
    public void setId_agendamento(Integer id_agendamento) {
        this.id_agendamento = id_agendamento;
    }

    public Usuario getUsuario() {
        return usuario;
    }
    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public ServicosPrefeitura getServico() {
        return servico;
    }
    public void setServico(ServicosPrefeitura servico) {
        this.servico = servico;
    }

    public String getDia() {
        return dia;
    }
    public void setDia(String dia) {
        this.dia = dia;
    }

    public String getHora() {
        return hora;
    }
    public void setHora(String hora) {
        this.hora = hora;
    }

    public String getProtocolo() {
        return protocolo;
    }
    public void setProtocolo(String protocolo) {
        this.protocolo = protocolo;     
    }

}
