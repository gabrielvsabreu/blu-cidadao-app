package com.blu_cidadao.blucidadao_spring_boot.sevice;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blu_cidadao.blucidadao_spring_boot.model.RegistrarOuvidoria;
import com.blu_cidadao.blucidadao_spring_boot.repo.RegistrarOuvidoriaRepo;

@Service
public class RegistrarOuvidoriaService {

	private final RegistrarOuvidoriaRepo repo;
	
	@Autowired
	
	public RegistrarOuvidoriaService(RegistrarOuvidoriaRepo repo) {
		this.repo = repo;
	}
	
	// Create

		public void inserirRegistrarOuvidoria (RegistrarOuvidoria r) {
			repo.save(r);
		}
		
		// Read
		
		public List<RegistrarOuvidoria> listarRegistrarOuvidoria() {
			return repo.findAll();
		}
		
		//Update
		
		public void atualizarRegistrarOuvidoria (RegistrarOuvidoria r) {
			repo.save(r);
		}
		
		// Delete
		
		public void deletarRegistrarOuvidoria(int id) {
			repo.deleteById(id);
		}	
		
		public Optional<RegistrarOuvidoria> obterRegistrarOuvidoriaPorId(int id) {
			return repo.findById(id);
		}
	
}
