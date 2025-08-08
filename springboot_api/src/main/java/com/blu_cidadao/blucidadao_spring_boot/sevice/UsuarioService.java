//Editor: Lucas
package com.blu_cidadao.blucidadao_spring_boot.sevice;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blu_cidadao.blucidadao_spring_boot.model.Usuario;
import com.blu_cidadao.blucidadao_spring_boot.repo.UsuarioRepo;


@Service
public class UsuarioService {

	private final UsuarioRepo repo;
	
	@Autowired
	
	public UsuarioService(UsuarioRepo repo) {
		this.repo = repo;
	}
	
	// Create

		public void inserirProduto (Usuario u) {
			repo.save(u);
		}
		
		// Read
		
		public List<Usuario> listarProdutos() {
			return repo.findAll();
		}
		
		//Update
		
		public void atualizarProduto (Usuario u) {
			repo.save(u);
		}
		
		// Delete
		
		public void deletarProduto(int id) {
			repo.deleteById(id);
		}
		
		public Optional<Usuario> obterUsuarioPorId(int id) {
			return repo.findById(id);
		}
	
}
