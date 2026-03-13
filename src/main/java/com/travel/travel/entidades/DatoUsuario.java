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
    @Column(name="datusucod")
    private int datUsuCod;

    @Column(name="usunom", nullable=false, length=45)
    private String usuNom;

    @Column(name="usuapepa", nullable=false, length=45)
    private String usuApePa;

    @Column(name="usuapema", nullable=false, length=45)
    private String usuApeMa;

    @Column(name="usudir", nullable=false, length=45)
    private String usuDir;

    @Column(name="usufecnac", nullable=false)
    @Temporal(TemporalType.DATE)
    private Date usuFecNac;

    @Column(name="usudni", nullable=false)
    private int usuDNI;

    @Column(name="usunac", nullable=false, length=45)
    private String usuNac;

    @Column(name="usucel", nullable=false)
    private int usuCel;

    @Column(name="usuestreg", nullable=false, length=1)
    private String usuEstReg;

    @OneToOne
    @JoinColumn(name="usucod", nullable=false)
    private Usuario usuario;
}