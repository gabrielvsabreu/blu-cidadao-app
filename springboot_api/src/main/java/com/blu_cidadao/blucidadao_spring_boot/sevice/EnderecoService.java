package com.blu_cidadao.blucidadao_spring_boot.sevice;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blu_cidadao.blucidadao_spring_boot.model.Endereco;
import com.blu_cidadao.blucidadao_spring_boot.repo.EnderecoRepo;

@Service
public class EnderecoService {

	private final EnderecoRepo repo;
	
	@Autowired
	
	public EnderecoService(EnderecoRepo repo) {
		this.repo = repo;
	}
	
	// Create

		public void inserirEndereco (Endereco e) {
			repo.save(e);
		}
		
		// Read
		
		public List<Endereco> listarEndereco() {
			return repo.findAll();
		}
		
		//Update
		
		public void atualizarEndereco (Endereco e) {
			repo.save(e);
		}
		
		// Delete
		
		public void deletarEndereco(int id) {
			repo.deleteById(id);
		}
	
		public Optional<Endereco> obterEnderecoPorId(int id) {
			return repo.findById(id);
		}
}
