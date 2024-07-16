package com.travel.travel.repositorios;

import com.travel.travel.entidades.Rol;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RolRepository extends JpaRepository<Rol, Integer> {
    Rol findByRolNom(String rolNom);
    
}
