package com.blu_cidadao.blucidadao_spring_boot.sevice;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blu_cidadao.blucidadao_spring_boot.model.Ouvidoria;
import com.blu_cidadao.blucidadao_spring_boot.repo.OuvidoriaRepo;

@Service
public class OuvidoriaService {

	private final OuvidoriaRepo repo;
	
	@Autowired
	
	public OuvidoriaService(OuvidoriaRepo repo) {
		this.repo = repo;
	}
	
	// Create

		public void inserirProduto (Ouvidoria o) {
			repo.save(o);
		}
		
		// Read
		
		public List<Ouvidoria> listarProdutos() {
			return repo.findAll();
		}
		
		//Update
		
		public void atualizarProduto (Ouvidoria o) {
			repo.save(o);
		}
		
		// Delete
		
		public void deletarProduto(int id) {
			repo.deleteById(id);
		}
		
		public Optional<Ouvidoria> obterOuvidoriaPorId(int id) {
			return repo.findById(id);
		}
	
}
