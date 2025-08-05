package com.blu_cidadao.blucidadao_spring_boot.repo;



import org.springframework.data.jpa.repository.JpaRepository;

import com.blu_cidadao.blucidadao_spring_boot.model.Usuario;


public interface UsuarioRepo extends JpaRepository<Usuario, Integer> {
	
}
