package com.travel.travel.services.interfaces;

import java.util.List;



import com.travel.travel.entidades.Paquete;

public interface ServicePaquete {


   
    Paquete crearPaquete( Paquete paquete);
    
    Paquete obtenerPaquetePorId(int id);
  

     List<Paquete> obtenerTodosLosPaquetes();

   
    public Paquete actualizarPaquete(int id,Paquete paquete);
    
    void eliminarPaquete(int id);
}
