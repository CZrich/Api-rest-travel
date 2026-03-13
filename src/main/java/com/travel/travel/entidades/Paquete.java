package com.travel.travel.entidades;


import java.util.List;


import jakarta.persistence.*;
import lombok.Data;


@Entity
@Table(name = "paquetes")
@Data
public class Paquete {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="paqcod")
    private int paqCod;

    @Column(name="paqcos")
    private double paqCos;

    @Column(name="paqestreg")
    private String paqEstReg;

    @ManyToMany(mappedBy="paquete", fetch=FetchType.LAZY)
    private List<Servicio> servicios;

}
