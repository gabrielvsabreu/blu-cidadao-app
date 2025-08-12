// Edited by: Lucas
package com.blu_cidadao.blucidadao_spring_boot.exception;

import org.springframework.http.HttpStatus;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(InvalidCepException.class)
    public ResponseEntity<Map<String,String>> handleInvalidCep(InvalidCepException ex) {
        return ResponseEntity.badRequest().body(Map.of("error", "CEP inválido", "message", ex.getMessage()));
    }

    @ExceptionHandler(CepNotFoundException.class)
    public ResponseEntity<Map<String,String>> handleCepNotFound(CepNotFoundException ex) {
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(Map.of("error", "CEP não encontrado", "message", ex.getMessage()));
    }

    @ExceptionHandler(Exception.class)
    public ResponseEntity<Map<String,String>> handleAll(Exception ex) {
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Map.of("error", "Erro interno", "message", ex.getMessage()));
    }
    
    @ExceptionHandler(InvalidCpfException.class)
    public ResponseEntity<String> handleInvalidCpf(InvalidCpfException ex) {
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(ex.getMessage());
    }
}