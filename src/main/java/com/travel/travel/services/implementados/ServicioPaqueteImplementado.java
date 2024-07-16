package com.travel.travel.services.implementados;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.travel.travel.entidades.Paquete;
import com.travel.travel.repositorios.PaqueteRepositorio;
import com.travel.travel.services.interfaces.ServicePaquete;

@Service
public class ServicioPaqueteImplementado implements ServicePaquete {
      @Autowired
    private PaqueteRepositorio paqueteRepositorio;
    
    @Override
    public Paquete crearPaquete(Paquete paquete) {
        return paqueteRepositorio.save(paquete);
    }
    
    @Override
    public Paquete obtenerPaquetePorId(int id) {
        return paqueteRepositorio.findById(id).orElse(null);
               
    }

    @Override
    public List<Paquete> obtenerTodosLosPaquetes() {
        return paqueteRepositorio.findAll();
    }

    @Override
    public Paquete actualizarPaquete(int id, Paquete detallesPaquete) {
        Paquete paquete = obtenerPaquetePorId(id);

        paquete.setPaqCos(detallesPaquete.getPaqCos());
        paquete.setPaqEstReg(detallesPaquete.getPaqEstReg());

        return paqueteRepositorio.save(paquete);
    }
    @Override
    public void eliminarPaquete(int id) {
        Paquete paquete = obtenerPaquetePorId(id);
        paqueteRepositorio.delete(paquete);
    }

}
