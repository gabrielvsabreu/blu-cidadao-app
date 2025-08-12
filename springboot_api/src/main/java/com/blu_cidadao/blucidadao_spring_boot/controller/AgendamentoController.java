// Edited by: Lucas e Gabrielli Danker
package com.blu_cidadao.blucidadao_spring_boot.controller;

import java.security.Principal;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.blu_cidadao.blucidadao_spring_boot.model.Agendamento;
import com.blu_cidadao.blucidadao_spring_boot.model.ServicosPrefeitura;
import com.blu_cidadao.blucidadao_spring_boot.model.Usuario;
import com.blu_cidadao.blucidadao_spring_boot.repo.AgendamentoRepo;
import com.blu_cidadao.blucidadao_spring_boot.repo.ServicosPrefeituraRepo;
import com.blu_cidadao.blucidadao_spring_boot.repo.UsuarioRepo;

@RestController
@RequestMapping("/agendamento")
@CrossOrigin
public class AgendamentoController {

	@Autowired
	private UsuarioRepo usuarioRepo;

	@Autowired
	private AgendamentoRepo agendamentoRepo;

	@Autowired
	private ServicosPrefeituraRepo servicosPrefeituraRepo;

	@PostMapping("/novo")
        public ResponseEntity<Agendamento> criarAgendamento( Agendamento agendamento) {

        agendamentoRepo.save(agendamento);
        return ResponseEntity.ok(agendamento);
    }

    @GetMapping("/listar")
    public ResponseEntity<List<Agendamento>> listarAgendamentos() {
        List<Agendamento> lista = agendamentoRepo.findAll();
        return ResponseEntity.ok(lista);
    }

}
