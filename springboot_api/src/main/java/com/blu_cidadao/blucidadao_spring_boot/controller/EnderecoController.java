// Edited by: Lucas
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

import com.blu_cidadao.blucidadao_spring_boot.model.Endereco;
import com.blu_cidadao.blucidadao_spring_boot.service.EnderecoService;

@RestController
@RequestMapping("/endereco")
@CrossOrigin
public class EnderecoController {

private final EnderecoService servico;
	
	
	@Autowired
	public EnderecoController(EnderecoService servico) {
		this.servico = servico;
	}
	
	@PostMapping
	public void inserirEndereco(@RequestBody Endereco e) {
		servico.inserirEndereco(e);
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
	public void atualizarEndereco(@RequestBody Endereco e) {
		servico.atualizarEndereco(e);
	}

	@DeleteMapping("/{id}")
	public void deletarEndereco(@PathVariable int id) {
		servico.deletarEndereco(id);
	}
	
}
