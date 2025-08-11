// Edited by: Gabrielli Danker

package com.blu_cidadao.blucidadao_spring_boot.dto;

public class RegistrarOuvidoriaDTO {
    private Integer id_ouvidoria;
    private Integer id_endereco;
    private String comentarios;

    //Contrutor padrão
    public RegistrarOuvidoriaDTO() {
    }

    //Construtor com parâmetros
    public RegistrarOuvidoriaDTO(Integer id_ouvidoria, Integer id_endereco, String comentarios) {
        this.id_ouvidoria = id_ouvidoria;
        this.id_endereco = id_endereco;
        this.comentarios = comentarios;
    }

    // Getters e Setters
    public Integer getId_ouvidoria() {
        return id_ouvidoria;
    }
    public void setId_ouvidoria(Integer id_ouvidoria) {
        this.id_ouvidoria = id_ouvidoria;
    }

    public Integer getId_endereco() {
        return id_endereco;
    }
    public void setId_endereco(Integer id_endereco) {
        this.id_endereco = id_endereco;
    }

    public String getComentarios() {
        return comentarios;
    }
    public void setComentarios(String comentarios) {
        this.comentarios = comentarios;
    }

}
