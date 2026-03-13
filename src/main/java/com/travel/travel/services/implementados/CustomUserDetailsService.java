package com.travel.travel.services.implementados;

import com.travel.travel.entidades.Usuario;

import com.travel.travel.repositorios.UsuarioRepository;

import java.util.Collections;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
//import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
//import org.springframework.security.crypto.password.PasswordEncoder;
import com.travel.travel.entidades.Usuario;
import com.travel.travel.entidades.UsuariosRoles;
import com.travel.travel.repositorios.UsuarioRepository;
import com.travel.travel.repositorios.UsuariosRolesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import java.util.Collections;
import java.util.List;
@Service
public class CustomUserDetailsService implements UserDetailsService {
    @Autowired
    private UsuarioRepository usuarioRepository;

    @Autowired
    private UsuariosRolesRepository usuariosRolesRepository;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        // 1. Buscar usuario
        Usuario usuario = usuarioRepository.findByUsuEma(email)
                .orElseThrow(() -> new UsernameNotFoundException("Usuario no encontrado: " + email));

        // 2. Buscar roles asociados (ajusta esto según tu relación en la BD)
        UsuariosRoles ur = usuariosRolesRepository.findByUsuario(usuario);
        String roleName = ur.getRol().getRolNom(); // ej: "admin"

        // 3. CONVERTIR ROL A GRANTED AUTHORITY (¡Aquí está el secreto!)
        // Spring Security requiere que sea "admin", "empleado", etc.
        List<SimpleGrantedAuthority> authorities = Collections.singletonList(
                new SimpleGrantedAuthority(roleName)
        );

        // 4. Retornar el objeto User de Spring Security
        return new User(usuario.getUsuEma(), usuario.getUsuPas(), authorities);
    }
}