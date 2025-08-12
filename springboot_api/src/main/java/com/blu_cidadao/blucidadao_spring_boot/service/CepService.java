// Edited by: Lucas

package com.blu_cidadao.blucidadao_spring_boot.service;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.blu_cidadao.blucidadao_spring_boot.model.Endereco;
import com.blu_cidadao.blucidadao_spring_boot.model.ViaCepResponse;
import com.blu_cidadao.blucidadao_spring_boot.exception.InvalidCepException;
import com.blu_cidadao.blucidadao_spring_boot.exception.CepNotFoundException;

@Service
public class CepService {

    private final RestTemplate restTemplate;
    private static final String VIACEP_URL = "https://viacep.com.br/ws/{cep}/json/";

    public CepService(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    public Endereco buscarEnderecoPorCep(String rawCep) {
        String cep = rawCep.replaceAll("\\D", "");
        if (cep.length() != 8) {
            throw new InvalidCepException("CEP deve conter 8 dígitos.");
        }

        ViaCepResponse resp = restTemplate.getForObject(VIACEP_URL, ViaCepResponse.class, cep);

        if (resp == null || Boolean.TRUE.equals(resp.getErro())) {
            throw new CepNotFoundException("CEP não encontrado.");
        }

        Endereco e = new Endereco();
        e.setCep(resp.getCep());
        e.setRua(resp.getLogradouro() != null ? resp.getLogradouro() : "");
        e.setBairro(resp.getBairro() != null ? resp.getBairro() : "");
        e.setCidade(resp.getLocalidade() != null ? resp.getLocalidade() : "");
        e.setEstado(resp.getUf() != null ? resp.getUf() : "");
        e.setNumero(""); // numero normalmente preenchido pelo usuário
        return e;
    }
}