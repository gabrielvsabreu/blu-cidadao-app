package com.blu_cidadao.blucidadao_spring_boot.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blu_cidadao.blucidadao_spring_boot.model.ServicosPrefeitura;
import com.blu_cidadao.blucidadao_spring_boot.repo.ServicosPrefeituraRepo;

@Service
public class ServicosPrefeituraService {

	private final ServicosPrefeituraRepo repo;
	
	@Autowired
	
	public ServicosPrefeituraService(ServicosPrefeituraRepo repo) {
		this.repo = repo;
	}
	
	// Create

		public void inserirServicosPrefeitura (ServicosPrefeitura s) {
			repo.save(s);
		}
		
		// Read
		
		public List<ServicosPrefeitura> listarServicosPrefeitura() {
			return repo.findAll();
		}
		
		//Update
		
		public void atualizarServicosPrefeitura (ServicosPrefeitura s) {
			repo.save(s);
		}
		
		// Delete
		
		public void deletarServicosPrefeitura(int id) {
			repo.deleteById(id);
		}	
		
		public Optional<ServicosPrefeitura> obterServicosPrefeituraPorId(int id) {
			return repo.findById(id);
		}
	
}
