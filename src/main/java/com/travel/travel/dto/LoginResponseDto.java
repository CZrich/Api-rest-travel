package com.travel.travel.dto;

import lombok.Data;

@Data
public class LoginResponseDto {
    private String token;
    private String role;
    private String email;
  //  private String firstName;
   // private String lastName;

    // Getters and setters
}