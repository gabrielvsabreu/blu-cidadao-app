// Edited by: Lucas

package com.blu_cidadao.blucidadao_spring_boot.model;

import com.fasterxml.jackson.annotation.JsonProperty;

public class ViaCepResponse {

	private String cep;
    private String logradouro;
    private String complemento;
    private String bairro;
    private String localidade;
    private String uf;

    @JsonProperty("erro")
    private Boolean erro;

    // getters e setters
    public String getCep() { return cep; }
    
    public void setCep(String cep) { this.cep = cep; }
    
    public String getLogradouro() { return logradouro; }
    
    public void setLogradouro(String logradouro) { this.logradouro = logradouro; }
    
    public String getComplemento() { return complemento; }
    
    public void setComplemento(String complemento) { this.complemento = complemento; }
    
    public String getBairro() { return bairro; }
    
    public void setBairro(String bairro) { this.bairro = bairro; }
    
    public String getLocalidade() { return localidade; }
    
    public void setLocalidade(String localidade) { this.localidade = localidade; }
    
    public String getUf() { return uf; }
    
    public void setUf(String uf) { this.uf = uf; }
    
    public Boolean getErro() { return erro; }
    
    public void setErro(Boolean erro) { this.erro = erro; }
	
}
