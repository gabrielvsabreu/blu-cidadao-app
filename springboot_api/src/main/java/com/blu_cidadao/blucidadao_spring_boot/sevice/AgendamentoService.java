package com.blu_cidadao.blucidadao_spring_boot.sevice;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blu_cidadao.blucidadao_spring_boot.model.Agendamento;
import com.blu_cidadao.blucidadao_spring_boot.repo.AgendamentoRepo;

import com.blu_cidadao.blucidadao_spring_boot.util.ProtocoloGenerator;


@Service
public class AgendamentoService {

	public void criarAgendamento(Agendamento agendamento) {
		String protocolo = ProtocoloGenerator.gerarProtocolo(10);         
		agendamento.setProtocolo(protocolo);      

}

	private final AgendamentoRepo repo;
	
	@Autowired
	
	public AgendamentoService(AgendamentoRepo repo) {
		this.repo = repo;
	}
	
	// Create

		public void inserirProduto (Agendamento a) {
			repo.save(a);
		}
		
		// Read
		
		public List<Agendamento> listarProdutos() {
			return repo.findAll();
		}
		
		//Update
		
		public void atualizarProduto (Agendamento a) {
			repo.save(a);
		}
		
		// Delete
		
		public void deletarProduto(int id) {
			repo.deleteById(id);
		}
		
		public Optional<Agendamento> obterAgendamentoPorId(int id) {
			return repo.findById(id);
		}
	
}
