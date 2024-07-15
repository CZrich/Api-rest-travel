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
    @JsonProperty("id")
    @JsonAlias({"serCod,id"})
    private int serCod;

       
    @JsonProperty("nombre")
    @JsonAlias({"serNom,nombre"})
    @Column(nullable = false, length = 45)
    private String serNom;
    
    @JsonProperty("descripcion")
    @JsonAlias({"serDes,descripcion"})
    @Column(nullable = false, length = 255)
    private String serDes;


    @Column(nullable = false)
    @Temporal(TemporalType.DATE)
    @JsonProperty("fecha")
    @JsonAlias({"serFec,fecha"})
    private Date serFec;
    
    @JsonProperty("destino")
    @JsonAlias({"serDest,destino"})
    @Column(nullable = false)
    private String serDest;
    
    @JsonProperty("costo")
    @JsonAlias({"serCos,costo"})
    @Column(nullable = false)
    private double serCos;
    @Lob
    @Column(name = "serImg", nullable = true, columnDefinition = "LONGBLOB")
    @JsonProperty("imagen")
    @JsonAlias({"serImg,imagen"})
    private byte[] serImg;

    @JsonProperty("estado")
    @JsonAlias({"serEstReg,estado"})
    @Column( length = 1)
    private String serEstReg;
    
    @ManyToMany(cascade ={
        CascadeType.PERSIST,
        CascadeType.MERGE
    },fetch = FetchType.LAZY)
    @JoinTable(
        name = "paquetes_servicios",
        joinColumns = {@JoinColumn(name="serCod")},
        inverseJoinColumns = {@JoinColumn(name="paqCod")}
    )
    @JsonIgnore
    private List<Paquete> paquete;
}
