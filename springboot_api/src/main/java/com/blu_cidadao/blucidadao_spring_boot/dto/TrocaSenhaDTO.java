// Edited by: Lucas
package com.blu_cidadao.blucidadao_spring_boot.dto;

public class TrocaSenhaDTO {
    private String senhaAtual;
    private String novaSenha;

    public String getSenhaAtual() { return senhaAtual; }
    public void setSenhaAtual(String senhaAtual) { this.senhaAtual = senhaAtual; }

    public String getNovaSenha() { return novaSenha; }
    public void setNovaSenha(String novaSenha) { this.novaSenha = novaSenha; }
}
