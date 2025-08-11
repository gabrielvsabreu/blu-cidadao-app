package com.blu_cidadao.blucidadao_spring_boot.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.blu_cidadao.blucidadao_spring_boot.model.ServicosPrefeitura;
import com.blu_cidadao.blucidadao_spring_boot.service.ServicosPrefeituraService;

@RestController
@RequestMapping("/servicos_prefeitura")
@CrossOrigin
public class ServicosPrefeituraController {

private final ServicosPrefeituraService servico;
	
	
	@Autowired
	public ServicosPrefeituraController(ServicosPrefeituraService servico) {
		this.servico = servico;
	}
	
	@PostMapping
	public void inserirServicosPrefeitura(@RequestBody ServicosPrefeitura s) {
		servico.inserirServicosPrefeitura(s);
	}

	@GetMapping
	public List<ServicosPrefeitura> listarServicosPrefeitura() {
		return servico.listarServicosPrefeitura();
	}

	@GetMapping("/{id}")
	public Optional<ServicosPrefeitura> obterServicosPrefeituraPorId(@PathVariable int id) {
		return servico.obterServicosPrefeituraPorId(id);
	}

	@PutMapping
	public void atualizarServicosPrefeitura(@RequestBody ServicosPrefeitura s) {
		servico.atualizarServicosPrefeitura(s);
	}

	@DeleteMapping("/{id}")
	public void deletarServicosPrefeitura(@PathVariable int id) {
		servico.deletarServicosPrefeitura(id);
	}
	
}
