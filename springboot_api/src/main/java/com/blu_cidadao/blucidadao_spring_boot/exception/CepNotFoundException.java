package com.blu_cidadao.blucidadao_spring_boot.exception;

public class CepNotFoundException extends RuntimeException {
    public CepNotFoundException(String message) {
        super(message);
    }
}
