package com.travel.travel.dto;

import lombok.Data;

import java.util.Date;

@Data
public class UserRegistrationDto {
    private String email;
    private String password;
    private String nombre;
    private String apellidoPaterno;
    private String apellidoMaterno;
    private String direccion;
    private Date fechaNacimiento;
    private int dni;
    private String nacionalidad;
    private int celular;
}
