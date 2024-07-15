package com.travel.travel.entidades;

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
    private String usuEma;

    @Column(nullable = false)
    private byte[] usuPas;

    @Column(nullable = false, length = 1)
    private String usuEstReg;
}
