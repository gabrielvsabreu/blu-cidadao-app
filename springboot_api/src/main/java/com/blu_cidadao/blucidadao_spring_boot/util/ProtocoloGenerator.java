// Edited by: Gabrielli Danker
package com.blu_cidadao.blucidadao_spring_boot.util;

import java.security.SecureRandom;

public class ProtocoloGenerator {
    private static final String CARACTERES = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    private static final SecureRandom random = new SecureRandom();

    /**
     * Gera um protocolo aleatório com o tamanho informado.
     * @param tamanho quantidade de caracteres do protocolo
     * @return String protocolo gerado
     */
    public static String gerarProtocolo(int tamanho) {
        StringBuilder sb = new StringBuilder(tamanho);
        for (int i = 0; i < tamanho; i++) {
            int index = random.nextInt(CARACTERES.length());
            sb.append(CARACTERES.charAt(index));
        }
        return sb.toString();
    }

}
