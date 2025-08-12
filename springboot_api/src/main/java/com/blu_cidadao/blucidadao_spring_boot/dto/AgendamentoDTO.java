// Edited by: Gabrielli Danker
package com.blu_cidadao.blucidadao_spring_boot.dto;

public class AgendamentoDTO {
    private Integer id_servico;
    private String dia;
    private String hora;

    //Construtor padrão
    public AgendamentoDTO() {
    }

    //Construtor com parâmetros
    public AgendamentoDTO(Integer id_servico, String dia, String hora) {
        this.id_servico = id_servico;
        this.dia = dia;
        this.hora = hora;
    }

    // Getters e Setters
    public Integer getId_servico() {
        return id_servico;
    }
    public void setId_servico(Integer id_servico) {
        this.id_servico = id_servico;
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
}
