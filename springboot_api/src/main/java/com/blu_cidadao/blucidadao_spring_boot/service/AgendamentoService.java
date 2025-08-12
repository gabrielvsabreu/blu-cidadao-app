// Edited by: Lucas e Gabrielli Danker
package com.blu_cidadao.blucidadao_spring_boot.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blu_cidadao.blucidadao_spring_boot.model.Agendamento;
import com.blu_cidadao.blucidadao_spring_boot.repo.AgendamentoRepo;
import com.blu_cidadao.blucidadao_spring_boot.util.ProtocoloGenerator;

@Service
public class AgendamentoService {

	private final AgendamentoRepo repo;
	
	@Autowired
	public AgendamentoService(AgendamentoRepo repo) {
		this.repo = repo;
	}
	
	// Create

	public void inserirAgendamento (Agendamento a) {
		String protocolo = ProtocoloGenerator.gerarProtocolo(10);
		a.setProtocolo(protocolo);
		repo.save(a);
		}
		
		// Read
		
		public List<Agendamento> listarAgendamento() {
			return repo.findAll();
		}
		
		//Update
		
		public void atualizarAgendamento (Agendamento a) {
			repo.save(a);
		}
		
		// Delete
		
		public void deletarAgendamento(int id) {
			repo.deleteById(id);
		}
		
		public Optional<Agendamento> obterAgendamentoPorId(int id) {
			return repo.findById(id);
		}
	
}
