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

    @Column(name = "usucod")
    private int usuCod;

    @Column(name = "usuema", nullable = false, length = 45)
    @JsonProperty("email")
    private String usuEma;

    @Column(name = "usupas", nullable = false)
    @JsonProperty("password")
    private String usuPas;

    @Column(name = "usuestreg", nullable = false, length = 1)
    private String usuEstReg;
}
