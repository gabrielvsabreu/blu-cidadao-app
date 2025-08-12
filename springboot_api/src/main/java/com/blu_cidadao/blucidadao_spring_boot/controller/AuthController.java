package com.blu_cidadao.blucidadao_spring_boot.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.Map;
import java.util.Optional;

import com.blu_cidadao.blucidadao_spring_boot.service.UsuarioService;
import com.blu_cidadao.blucidadao_spring_boot.model.Usuario;

@RestController
@RequestMapping("/auth")
@CrossOrigin
public class AuthController {

    private final UsuarioService usuarioService;

    public AuthController(UsuarioService usuarioService) {
        this.usuarioService = usuarioService;
    }

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody Map<String, String> body) {
        String cpf = body.get("cpf");
        String senha = body.get("senha");

        if (cpf == null || senha == null) {
            return ResponseEntity.badRequest().body(Map.of("message", "cpf e senha obrigatórios"));
        }

        Optional<Usuario> user = usuarioService.autenticarPorCpfESenha(cpf, senha);
        if (user.isPresent()) {
            Usuario u = user.get();
            u.setSenha(null); // garantir que a senha não saia na resposta
            return ResponseEntity.ok(u);
        } else {
            return ResponseEntity.status(401).body(Map.of("message", "CPF ou senha incorretos"));
        }
    }
}
