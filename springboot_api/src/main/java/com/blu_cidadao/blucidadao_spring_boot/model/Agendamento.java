// Edited by: Gabrielli Danker

package com.blu_cidadao.blucidadao_spring_boot.model;

import java.time.LocalDate;
import java.time.LocalTime;

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
    @Column(name = "id_agendamento")
    private Integer id_agendamento;

    @ManyToOne
    @JoinColumn(name = "id_usuario", nullable = false)
    private Usuario usuario;

    @ManyToOne
    @JoinColumn(name = "id_servico", nullable = false)
    private ServicosPrefeitura servico;

    @Column(name= "dia", nullable = false)
    private LocalDate dia;

    @Column(name= "hora", nullable = false)
    private LocalTime hora;

    @Column(name = "protocolo", length = 10, unique = true)
    private String protocolo;

    // Default constructor
    public Agendamento() {
    }

    // Parameterized constructor
    public Agendamento(Usuario usuario, ServicosPrefeitura servico, LocalDate dia, LocalTime hora, String protocolo) {
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

    public LocalDate getDia() {
        return dia;
    }
    public void setDia(LocalDate dia) {
        this.dia = dia;
    }

    public LocalTime getHora() {
        return hora;
    }
    public void setHora(LocalTime hora) {
        this.hora = hora;
    }

    public String getProtocolo() {
        return protocolo;
    }
    public void setProtocolo(String protocolo) {
        this.protocolo = protocolo;     
    }


}
