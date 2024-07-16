package com.travel.travel.repositorios;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.travel.travel.entidades.DatoUsuario;
@Repository
public interface DatoUsuarioRepository  extends JpaRepository<DatoUsuario,Integer>{

}
