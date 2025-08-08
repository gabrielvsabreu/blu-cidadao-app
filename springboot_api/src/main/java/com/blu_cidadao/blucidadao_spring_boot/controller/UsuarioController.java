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

import com.blu_cidadao.blucidadao_spring_boot.model.Usuario;
import com.blu_cidadao.blucidadao_spring_boot.service.UsuarioService;



@RestController
@RequestMapping("/usuario")
@CrossOrigin
public class UsuarioController {
	
private final UsuarioService servico;
	
	
	@Autowired
	public UsuarioController(UsuarioService servico) {
		this.servico = servico;
	}
	
	@PostMapping
	public void inserirUsuario(@RequestBody Usuario u) {
		servico.inserirUsuario(u);
	}

	@GetMapping
	public List<Usuario> listarUsuario() {
		return servico.listarUsuario();
	}

	@GetMapping("/{id}")
	public Optional<Usuario> obterUsuarioPorId(@PathVariable int id) {
		return servico.obterUsuarioPorId(id);
	}

	@PutMapping
	public void atualizarUsuario(@RequestBody Usuario u) {
		servico.atualizarUsuario(u);
	}

	@DeleteMapping("/{id}")
	public void deletarUsuario(@PathVariable int id) {
		servico.deletarUsuario(id);
	}

}
