package com.blu_cidadao.blucidadao_spring_boot.exception;

public class InvalidCpfException extends RuntimeException {
    public InvalidCpfException(String message) {
        super(message);
    }
}