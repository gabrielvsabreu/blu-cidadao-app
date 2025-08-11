package com.blu_cidadao.blucidadao_spring_boot.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.blu_cidadao.blucidadao_spring_boot.model.Escola;
import com.blu_cidadao.blucidadao_spring_boot.repo.EscolaRepo;

@Service
public class EscolaService {
    private final EscolaRepo escolaRepo;

    public EscolaService(EscolaRepo escolaRepo){
        this.escolaRepo = escolaRepo;
    }

    public List<Escola> listarTodas(){
        return escolaRepo.findAll();
    }
    
    public Optional<Escola> buscarPorId(int id){
        return escolaRepo.findById(id);
    }

    public Escola salvar(Escola escola){
        return escolaRepo.save(escola);
    }

    public void deletar(int id){
        escolaRepo.deleteById(id);
    }
    
}
