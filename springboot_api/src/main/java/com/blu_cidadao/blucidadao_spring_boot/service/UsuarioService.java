package com.blu_cidadao.blucidadao_spring_boot.service;

import java.util.List;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blu_cidadao.blucidadao_spring_boot.model.Usuario;
import com.blu_cidadao.blucidadao_spring_boot.repo.UsuarioRepo;

import com.blu_cidadao.blucidadao_spring_boot.util.CpfValidator;
import com.blu_cidadao.blucidadao_spring_boot.exception.InvalidCpfException;

@Service
public class UsuarioService {

    private final UsuarioRepo repo;

    @Autowired
    public UsuarioService(UsuarioRepo repo) {
        this.repo = repo;
    }

    public void inserirUsuario(Usuario u) {
        if (!CpfValidator.isValidCPF(u.getCpf())) {
            throw new InvalidCpfException("CPF inválido.");
        }
        repo.save(u);
    }

    public void atualizarUsuario(Usuario u) {
        if (!CpfValidator.isValidCPF(u.getCpf())) {
            throw new InvalidCpfException("CPF inválido.");
        }
        repo.save(u);
    }

    public List<Usuario> listarUsuario() {
        return repo.findAll();
    }

    public void deletarUsuario(int id) {
        repo.deleteById(id);
    }

    public Optional<Usuario> obterUsuarioPorId(int id) {
        return repo.findById(id);
    }
}
