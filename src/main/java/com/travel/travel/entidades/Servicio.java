package com.travel.travel.entidades;

import jakarta.persistence.*;
import lombok.Data;

import java.util.Date;
import java.util.List;
//import java.util.Set;

import com.fasterxml.jackson.annotation.JsonAlias;
import com.fasterxml.jackson.annotation.JsonIgnore;
//import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.annotation.JsonProperty;
@Entity
@Table(name = "servicio")
@Data
public class Servicio {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="sercod")
    @JsonProperty("id")
    @JsonAlias({"serCod","id"})
    private int serCod;

    @Column(name="sernom", nullable=false, length=45)
    @JsonProperty("nombre")
    @JsonAlias({"serNom","nombre"})
    private String serNom;

    @Column(name="serdes", nullable=false, length=255)
    @JsonProperty("descripcion")
    @JsonAlias({"serDes","descripcion"})
    private String serDes;

    @Column(name="serfec", nullable=false)
    @Temporal(TemporalType.DATE)
    @JsonProperty("fecha")
    @JsonAlias({"serFec","fecha"})
    private Date serFec;

    @Column(name="serdest", nullable=false)
    @JsonProperty("destino")
    @JsonAlias({"serDest","destino"})
    private String serDest;

    @Column(name="sercos", nullable=false)
    @JsonProperty("costo")
    @JsonAlias({"serCos","costo"})
    private double serCos;

    @Column(name="serimg")
    @JsonProperty("imagen")
    @JsonAlias({"serImg","imagen"})
    private String serImg;

    @Column(name="serestreg", length=1)
    @JsonProperty("estado")
    @JsonAlias({"serEstReg","estado"})
    private String serEstReg;

    @ManyToMany(
            cascade={CascadeType.PERSIST, CascadeType.MERGE},
            fetch=FetchType.LAZY
    )
    @JoinTable(
            name="paquetes_servicios",
            joinColumns=@JoinColumn(name="sercod"),
            inverseJoinColumns=@JoinColumn(name="paqcod")
    )
    @JsonIgnore
    private List<Paquete> paquete;
}
