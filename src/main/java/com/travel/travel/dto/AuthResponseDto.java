package com.travel.travel.dto;

import lombok.Data;

@Data
public class AuthResponseDto {
    private String token;
    private String rol;
    
    public AuthResponseDto(String token, String role) {
        this.token = token;
        this.rol = role;
    }

}
