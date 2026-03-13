package com.travel.travel.repositorios;

import com.travel.travel.entidades.Usuario;
import com.travel.travel.entidades.UsuariosRoles;
import com.travel.travel.entidades.UsuariosRolesId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
@Repository
public interface UsuariosRolesRepository extends JpaRepository<UsuariosRoles, UsuariosRolesId> {
    // Usamos @Query para decirle exactamente qué hacer, ignorando la convención de nombres
    @Query("SELECT ur FROM UsuariosRoles ur WHERE ur.usuario = :usuario")
    UsuariosRoles findByUsuario(@Param("usuario") Usuario usuario);

}
