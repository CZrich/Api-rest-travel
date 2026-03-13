package com.travel.travel.entidades;

import jakarta.persistence.*;
import lombok.Data;


@Entity
@Table(name = "rol")
@Data
public class Rol {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "rolcod")
    private int rolCod;

    @Column(name = "rolnom",nullable = false, length = 45)

    private String rolNom;

    @Column(name ="rolestreg", nullable = false, length = 1)

    private String rolEstReg;
}
