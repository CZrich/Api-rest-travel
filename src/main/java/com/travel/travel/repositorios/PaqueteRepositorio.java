package com.travel.travel.repositorios;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.travel.travel.entidades.Paquete;

@Repository
public interface PaqueteRepositorio extends JpaRepository <Paquete,Integer> {

}
