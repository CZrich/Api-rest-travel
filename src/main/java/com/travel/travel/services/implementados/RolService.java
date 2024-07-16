package com.travel.travel.services.implementados;

import com.travel.travel.entidades.Rol;
import com.travel.travel.repositorios.RolRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RolService {

    @Autowired
    private RolRepository rolRepository;

    public Rol findByNombre(String nombre) {
        return rolRepository.findByRolNom(nombre);
    }

    public Rol findById(int id){
        return rolRepository.findById(id).orElse(null);
    }
}
