package com.travel.travel.entidades;

import jakarta.persistence.*;
import lombok.Data;
import java.util.Date;

@Entity
@Table(name = "dato_usuario")
@Data
public class DatoUsuario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int datUsuCod;

    @Column(nullable = false, length = 45)
    private String usuNom;

    @Column(nullable = false, length = 45)
    private String usuApePa;

    @Column(nullable = false, length = 45)
    private String usuApeMa;

    @Column(nullable = false, length = 45)
    private String usuDir;

    @Column(nullable = false)
    @Temporal(TemporalType.DATE)
    private Date usuFecNac;

    @Column(nullable = false)
    private int usuDNI;

    @Column(nullable = false, length = 45)
    private String usuNac;

    @Column(nullable = false)
    private int usuCel;

    @Column(nullable = false, length = 1)
    private String usuEstReg;

    @OneToOne
    @JoinColumn(name = "usuCod", nullable = false)
    private Usuario usuario;
}
