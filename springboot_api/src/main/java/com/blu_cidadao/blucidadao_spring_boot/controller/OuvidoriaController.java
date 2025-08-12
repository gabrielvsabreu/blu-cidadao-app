// Edited by: Lucas e Gabrielli Danker
package com.blu_cidadao.blucidadao_spring_boot.controller;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.blu_cidadao.blucidadao_spring_boot.dto.RegistrarOuvidoriaDTO;
import com.blu_cidadao.blucidadao_spring_boot.model.Endereco;
import com.blu_cidadao.blucidadao_spring_boot.model.Ouvidoria;
import com.blu_cidadao.blucidadao_spring_boot.model.RegistrarOuvidoria;
import com.blu_cidadao.blucidadao_spring_boot.service.EnderecoService;
import com.blu_cidadao.blucidadao_spring_boot.service.OuvidoriaService;
import com.blu_cidadao.blucidadao_spring_boot.service.RegistrarOuvidoriaService;

@RestController
@RequestMapping("/ouvidoria")
@CrossOrigin
public class OuvidoriaController {

    private final OuvidoriaService ouvidoriaService;
    private final EnderecoService enderecoService;
    private final RegistrarOuvidoriaService registrarOuvidoriaService;

    @Autowired
    public OuvidoriaController(OuvidoriaService ouvidoriaService,
                               EnderecoService enderecoService,
                               RegistrarOuvidoriaService registrarOuvidoriaService) {
        this.ouvidoriaService = ouvidoriaService;
        this.enderecoService = enderecoService;
        this.registrarOuvidoriaService = registrarOuvidoriaService;
    }

    // Endpoints já existentes
    @PostMapping
    public void inserirOuvidoria(@RequestBody Ouvidoria o) {
        ouvidoriaService.inserirOuvidoria(o);
    }

    @GetMapping
    public List<Ouvidoria> listarOuvidoria() {
        return ouvidoriaService.listarOuvidoria();
    }

    @GetMapping("/{id}")
    public Optional<Ouvidoria> obterOuvidoriaPorId(@PathVariable int id) {
        return ouvidoriaService.obterOuvidoriaPorId(id);
    }

    @PutMapping
    public void atualizarOuvidoria(@RequestBody Ouvidoria o) {
        ouvidoriaService.atualizarOuvidoria(o);
    }

    @DeleteMapping("/{id}")
    public void deletarOuvidoria(@PathVariable int id) {
        ouvidoriaService.deletarOuvidoria(id);
    }

    // Novo endpoint para registrar manifestação
    @PostMapping("/registrar")
    public RegistrarOuvidoria registrarManifestacao(@RequestBody RegistrarOuvidoriaDTO dto) {
        Ouvidoria tipo = ouvidoriaService.obterOuvidoriaPorId(dto.getId_ouvidoria())
                .orElseThrow(() -> new RuntimeException("Tipo de ouvidoria não encontrado"));

        Endereco endereco = enderecoService.obterEnderecoPorId(dto.getId_endereco())
                .orElseThrow(() -> new RuntimeException("Endereço não encontrado"));

        RegistrarOuvidoria registro = new RegistrarOuvidoria();
        registro.setOuvidoria(tipo);
        registro.setEndereco(endereco);
        registro.setComentario(dto.getComentarios());
        registro.setDia(LocalDate.now());

        return registrarOuvidoriaService.salvarRegistro(registro);
    }
}

