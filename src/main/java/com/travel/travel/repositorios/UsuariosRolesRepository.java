package com.travel.travel.repositorios;

import com.travel.travel.entidades.Usuario;
import com.travel.travel.entidades.UsuariosRoles;
import com.travel.travel.entidades.UsuariosRolesId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UsuariosRolesRepository extends JpaRepository<UsuariosRoles, UsuariosRolesId> {
    UsuariosRoles   findByUsuario(Usuario usuario);
}
