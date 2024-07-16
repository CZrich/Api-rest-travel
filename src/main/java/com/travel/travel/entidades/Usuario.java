package com.travel.travel.entidades;

import com.fasterxml.jackson.annotation.JsonAlias;
import com.fasterxml.jackson.annotation.JsonProperty;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "usuario")
@Data
public class Usuario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int usuCod;

    @Column(nullable = false, length = 45)
    @JsonProperty("email")
    @JsonAlias({"usuEma","email"})
    private String usuEma;

    @Column(nullable = false)
    @JsonProperty("password")
    @JsonAlias({"usuPas","password"})
    //private byte[] usuPas;
     private String usuPas;
     
    @Column(nullable = false, length = 1)
    @JsonProperty("estado")
    @JsonAlias({"usuEstReg","estado"})
    private String usuEstReg;
}
