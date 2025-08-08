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

import com.blu_cidadao.blucidadao_spring_boot.model.RegistrarOuvidoria;
import com.blu_cidadao.blucidadao_spring_boot.service.RegistrarOuvidoriaService;

@RestController
@RequestMapping("/registrar_ouvidoria")
@CrossOrigin
public class RegistrarOuvidoriaController {

private final RegistrarOuvidoriaService servico;
	
	
	@Autowired
	public RegistrarOuvidoriaController(RegistrarOuvidoriaService servico) {
		this.servico = servico;
	}
	
	@PostMapping
	public void inserirRegistrarOuvidoria(@RequestBody RegistrarOuvidoria r) {
		servico.inserirRegistrarOuvidoria(r);
	}

	@GetMapping
	public List<RegistrarOuvidoria> listarRegistrarOuvidoria() {
		return servico.listarRegistrarOuvidoria();
	}

	@GetMapping("/{id}")
	public Optional<RegistrarOuvidoria> obterRegistrarOuvidoriaPorId(@PathVariable int id) {
		return servico.obterRegistrarOuvidoriaPorId(id);
	}

	@PutMapping
	public void atualizarRegistrarOuvidoria(@RequestBody RegistrarOuvidoria r) {
		servico.atualizarRegistrarOuvidoria(r);
	}

	@DeleteMapping("/{id}")
	public void deletarRegistrarOuvidoria(@PathVariable int id) {
		servico.deletarRegistrarOuvidoria(id);
	}
	
}
