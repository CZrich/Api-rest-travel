package com.travel.travel.entidades;


import java.util.List;


import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "paquetes")
@Data
public class Paquete {
   
  @Id 
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private int paqCod;

  private double paqCos;
  private String paqEstReg;

  @ManyToMany(mappedBy = "paquete",fetch = FetchType.LAZY)
 
  private List<Servicio> servicios;

}
