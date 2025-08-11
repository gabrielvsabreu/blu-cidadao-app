package com.blu_cidadao.blucidadao_spring_boot.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.blu_cidadao.blucidadao_spring_boot.model.EnderecoEscolas;
import com.blu_cidadao.blucidadao_spring_boot.repo.EnderecoEscolaRepo;

@Service
public class EnderecoEscolaService {
    private final EnderecoEscolaRepo enderecoEscolaRepo;

    public EnderecoEscolaService(EnderecoEscolaRepo enderecoEscolaRepo){
        this.enderecoEscolaRepo = enderecoEscolaRepo;
    }

    public List<EnderecoEscolas> listarTodos(){
        return enderecoEscolaRepo.findAll();
    }
    
    public Optional<EnderecoEscolas> buscarPorId(int id){
        return enderecoEscolaRepo.findById(id);
    }

    public EnderecoEscolas salvar(EnderecoEscolas endereco){
        return enderecoEscolaRepo.save(endereco);
    }

    public void deletar(int id){
        enderecoEscolaRepo.deleteById(id);
    }

}
