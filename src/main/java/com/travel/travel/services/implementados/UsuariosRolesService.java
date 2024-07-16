package com.travel.travel.services.implementados;

import com.travel.travel.entidades.Usuario;
import com.travel.travel.entidades.UsuariosRoles;
import com.travel.travel.repositorios.UsuariosRolesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UsuariosRolesService {

    @Autowired
    private UsuariosRolesRepository usuariosRolesRepository;

    public UsuariosRoles save(UsuariosRoles usuariosRoles) {
        return usuariosRolesRepository.save(usuariosRoles);
    }
    public UsuariosRoles getByUser(Usuario usuario){
        return usuariosRolesRepository.findByUsuario(usuario);
    }
}
