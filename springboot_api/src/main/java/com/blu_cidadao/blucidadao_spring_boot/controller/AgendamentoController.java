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

import com.blu_cidadao.blucidadao_spring_boot.dto.AgendamentoDTO;
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
        public ResponseEntity<?> criarAgendamento(@RequestBody AgendamentoDTO dto, Principal principal) {
        // 'principal' representa o usuário logado (Spring Security)

        String emailUsuario = principal.getName(); // supondo que o username seja o email
        Usuario usuario = usuarioRepo.findAllByEmail(emailUsuario)
            .orElseThrow(() -> new RuntimeException("Usuário não encontrado"));

        ServicosPrefeitura servico = servicosPrefeituraRepo.findById(dto.getId_servico())
            .orElseThrow(() -> new RuntimeException("Serviço não encontrado"));

        LocalDate dia = LocalDate.parse(dto.getDia());
        LocalTime horas = LocalTime.parse(dto.getHora());

        Agendamento agendamento = new Agendamento();
        agendamento.setUsuario(usuario);
        agendamento.setServico(servico);
        agendamento.setDia(dia);
        agendamento.setHora(horas);

        String protocolo = UUID.randomUUID().toString().substring(0, 10).toUpperCase();
        agendamento.setProtocolo(protocolo);

        agendamentoRepo.save(agendamento);

        return ResponseEntity.ok(Map.of(
            "protocolo", protocolo,
            "servico", servico.getNome_servico(),
            "data", dia.toString(),
            "hora", horas.toString()
        ));
    }

    @GetMapping("/listar")
    public ResponseEntity<List<Agendamento>> listarAgendamentos() {
        List<Agendamento> lista = agendamentoRepo.findAll();
        return ResponseEntity.ok(lista);
    }

}
