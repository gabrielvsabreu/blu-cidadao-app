//Editor: Gabrielli Danker
package com.blu_cidadao.blucidadao_spring_boot.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.blu_cidadao.blucidadao_spring_boot.model.Escola;

public interface EscolaRepo extends JpaRepository <Escola, Integer> {
    //Adicionar métodos
}
