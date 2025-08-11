//Editor: Lucas e Gabrielli Danker

package com.blu_cidadao.blucidadao_spring_boot.repo;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.blu_cidadao.blucidadao_spring_boot.model.Usuario;


public interface UsuarioRepo extends JpaRepository<Usuario, Integer> {

    Optional<Usuario> findAllByEmail(String emailUsuario);
	
}
