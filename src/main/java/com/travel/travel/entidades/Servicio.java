package com.travel.travel.entidades;

import jakarta.persistence.*;
import lombok.Data;

import java.util.Date;

@Entity
@Table(name = "servicio")
@Data
public class Servicio {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int serCod;

    @Lob
    @Column(name = "serImg", nullable = true, columnDefinition = "LONGBLOB")
    private byte[] serImg;

    @Column(nullable = false, length = 255)
    private String serDes;

    @Column(nullable = false, length = 45)
    private String serNom;

    @Column(nullable = false)
    @Temporal(TemporalType.DATE)
    private Date serFec;

    @Column(nullable = false)
    private double serCos;

    @Column(nullable = false, length = 1)
    private String serEstReg;
}
