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

import com.blu_cidadao.blucidadao_spring_boot.model.Ouvidoria;
import com.blu_cidadao.blucidadao_spring_boot.service.OuvidoriaService;

@RestController
@RequestMapping("/ouvidoria")
@CrossOrigin
public class OuvidoriaController {

private final OuvidoriaService servico;
	
	
	@Autowired
	public OuvidoriaController(OuvidoriaService servico) {
		this.servico = servico;
	}
	
	@PostMapping
	public void inserirOuvidoria(@RequestBody Ouvidoria o) {
		servico.inserirOuvidoria(o);
	}

	@GetMapping
	public List<Ouvidoria> listarOuvidoria() {
		return servico.listarOuvidoria();
	}

	@GetMapping("/{id}")
	public Optional<Ouvidoria> obterOuvidoriaPorId(@PathVariable int id) {
		return servico.obterOuvidoriaPorId(id);
	}

	@PutMapping
	public void atualizarOuvidoria(@RequestBody Ouvidoria o) {
		servico.atualizarOuvidoria(o);
	}

	@DeleteMapping("/{id}")
	public void deletarOuvidoria(@PathVariable int id) {
		servico.deletarOuvidoria(id);
	}
	
}
