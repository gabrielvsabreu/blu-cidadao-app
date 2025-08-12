// Edited by: Lucas
package com.blu_cidadao.blucidadao_spring_boot.controller;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.blu_cidadao.blucidadao_spring_boot.model.Endereco;
import com.blu_cidadao.blucidadao_spring_boot.service.EnderecoService;
import com.blu_cidadao.blucidadao_spring_boot.service.CepService;

@RestController
@RequestMapping("/endereco")
@CrossOrigin
public class EnderecoController {

    private final EnderecoService servico;
    private final CepService cepService;

    @Autowired
    public EnderecoController(EnderecoService servico, CepService cepService) {
        this.servico = servico;
        this.cepService = cepService;
    }

    @PostMapping
    public Endereco inserirEndereco(@RequestBody Endereco e) {
        return servico.inserirEndereco(e);
    }

    @GetMapping
    public List<Endereco> listarEndereco() {
        return servico.listarEndereco();
    }

    @GetMapping("/{id}")
    public Optional<Endereco> obterEnderecoPorId(@PathVariable int id) {
        return servico.obterEnderecoPorId(id);
    }

    @PutMapping
    public Endereco atualizarEndereco(@RequestBody Endereco e) {
        return servico.atualizarEndereco(e);
    }

    @DeleteMapping("/{id}")
    public void deletarEndereco(@PathVariable int id) {
        servico.deletarEndereco(id);
    }

    // --- NOVOS ENDPOINTS PARA CEP ---

    // apenas busca dados do ViaCEP e retorna um Endereco (não salva)
    @GetMapping("/cep/{cep}")
    public Endereco buscarPorCep(@PathVariable String cep) {
        return cepService.buscarEnderecoPorCep(cep);
    }

    // busca via CEP, permite passar "numero" no body, e salva no banco
    @PostMapping("/cep/{cep}")
    public Endereco buscarPorCepESalvar(@PathVariable String cep,
                                       @RequestBody(required = false) Map<String, String> body) {
        Endereco e = cepService.buscarEnderecoPorCep(cep);
        if (body != null && body.get("numero") != null) {
            e.setNumero(body.get("numero"));
        } else {
            e.setNumero("0");
        }
        return servico.inserirEndereco(e);
    }
}