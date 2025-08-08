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

import com.blu_cidadao.blucidadao_spring_boot.model.Agendamento;
import com.blu_cidadao.blucidadao_spring_boot.service.AgendamentoService;

@RestController
@RequestMapping("/agendamento")
@CrossOrigin
public class AgendamentoController {

	private final AgendamentoService servico;
	
	
	@Autowired
	public AgendamentoController(AgendamentoService servico) {
		this.servico = servico;
	}
	
	@PostMapping
	public void inserirAgendamento(@RequestBody Agendamento a) {
		servico.inserirAgendamento(a);
	}

	@GetMapping
	public List<Agendamento> listarAgendamento() {
		return servico.listarAgendamento();
	}

	@GetMapping("/{id}")
	public Optional<Agendamento> obterAgendamentoPorId(@PathVariable int id) {
		return servico.obterAgendamentoPorId(id);
	}

	@PutMapping
	public void atualizarAgendamento(@RequestBody Agendamento a) {
		servico.atualizarAgendamento(a);
	}

	@DeleteMapping("/{id}")
	public void deletarAgendamento(@PathVariable int id) {
		servico.deletarAgendamento(id);
	}
	
}
