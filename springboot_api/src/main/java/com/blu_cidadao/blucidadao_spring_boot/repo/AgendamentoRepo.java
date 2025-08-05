package com.blu_cidadao.blucidadao_spring_boot.repo;



import org.springframework.data.jpa.repository.JpaRepository;

import com.blu_cidadao.blucidadao_spring_boot.model.Agendamento;


public interface AgendamentoRepo extends JpaRepository<Agendamento, Integer> {
	
}
