//Editor: Lucas

package com.blu_cidadao.blucidadao_spring_boot.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.blu_cidadao.blucidadao_spring_boot.model.ServicosPrefeitura;


public interface ServicosPrefeituraRepo extends JpaRepository<ServicosPrefeitura, Integer> {
	
}
