package com.blu_cidadao.blucidadao_spring_boot.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.blu_cidadao.blucidadao_spring_boot.model.Usuario;
import com.blu_cidadao.blucidadao_spring_boot.repo.UsuarioRepo;

@Service
public class UsuarioService {

    private final UsuarioRepo repo;
    private final PasswordEncoder passwordEncoder;

    @Autowired
    public UsuarioService(UsuarioRepo repo, PasswordEncoder passwordEncoder) {
        this.repo = repo;
        this.passwordEncoder = passwordEncoder;
    }
    
    public void trocarSenha(Integer idUsuario, String senhaAtual, String novaSenha) {
    	Usuario usuario = repo.findById(idUsuario)
    			.orElseThrow(() -> new RuntimeException("Usuário não encontrado"));

        // Verificar senha atual
        if (!passwordEncoder.matches(senhaAtual, usuario.getSenha())) {
            throw new RuntimeException("Senha atual incorreta");
        }

        // Codificar e salvar nova senha
        usuario.setSenha(passwordEncoder.encode(novaSenha));
        repo.save(usuario);
    }

    // Create
    public Usuario inserirUsuario(Usuario u) {
        // validar CPF/email etc (já tens validação de CPF)
        //  -> supondo que CpfValidator já esteja sendo usado antes
        // encode da senha
        if (u.getSenha() == null || u.getSenha().isBlank()) {
            throw new IllegalArgumentException("Senha é obrigatória.");
        }
        u.setSenha(passwordEncoder.encode(u.getSenha()));
        return repo.save(u);
    }

    // Read
    public List<Usuario> listarUsuario() {
        return repo.findAll();
    }

    // Update - preserva senha se não for enviada
    public Usuario atualizarUsuario(Usuario u) {
        if (u.getId_usuario() == 0) {
            throw new IllegalArgumentException("Id do usuário é necessário para atualizar.");
        }

        Optional<Usuario> opt = repo.findById(u.getId_usuario());
        if (opt.isEmpty()) {
            throw new IllegalArgumentException("Usuário não encontrado.");
        }

        Usuario existente = opt.get();

        // atualiza campos simples
        existente.setNome_completo(u.getNome_completo());
        existente.setEmail(u.getEmail());
        existente.setTelefone(u.getTelefone());
        existente.setData_nascimento(u.getData_nascimento());
        existente.setEndereco(u.getEndereco());
        // ... atualize outros campos conforme necessário

        // senha: se vier null/empty -> mantém existente; se vier não vazia -> encode e substitui
        if (u.getSenha() != null && !u.getSenha().isBlank()) {
            existente.setSenha(passwordEncoder.encode(u.getSenha()));
        }

        return repo.save(existente);
    }

    // Delete
    public void deletarUsuario(int id) {
        repo.deleteById(id);
    }

    public Optional<Usuario> obterUsuarioPorId(int id) {
        return repo.findById(id);
    }

    // método auxiliar para autenticação (verifica senha crua)
    public Optional<Usuario> autenticarPorCpfESenha(String cpf, String rawSenha) {
        Optional<Usuario> opt = repo.findByCpf(cpf);
        if (opt.isPresent() && passwordEncoder.matches(rawSenha, opt.get().getSenha())) {
            return opt;
        }
        return Optional.empty();
    }
}
