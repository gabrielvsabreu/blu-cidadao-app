package com.blu_cidadao.blucidadao_spring_boot.util;

import java.security.SecureRandom;

public class ProtocoloGenerator {
    private static final String CHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    private static final SecureRandom random = new SecureRandom();

    public static String gerarProtocolo(int lenght){
        StringBuilder sb = new StringBuilder(lenght);
        for (int i = 0; i < lenght; i++){
            sb.append(CHARS.charAt(random.nextInt(CHARS.length())));
        }
        return sb.toString();
    }
}
