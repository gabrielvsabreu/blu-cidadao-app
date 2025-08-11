package com.blu_cidadao.blucidadao_spring_boot.exception;

public class InvalidCepException extends RuntimeException {
    public InvalidCepException(String message) {
        super(message);
    }
}
