package com.travel.travel.entidades;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "rol")
@Data
public class Rol {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int rolCod;

    @Column(nullable = false, length = 45)
    private String rolNom;

    @Column(nullable = false, length = 1)
    private String rolEstReg;
}
