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
import org.springframework.stereotype.Service;
@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private UsuarioRepository usuarioRepository;
   


   /* @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        Usuario usuario = usuarioRepository.findByUsuEma(email)
                .orElseThrow(() -> new UsernameNotFoundException("Usuario no encontrado con email: " + email));
       
        return User.builder()
                .username(usuario.getUsuEma())
                .password(new String(usuario.getUsuPas()))
                .roles("user")
                
                .build();
    }*/
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Usuario usuario = usuarioRepository.findByUsuEma(username)
            .orElseThrow(() -> new UsernameNotFoundException("Usuario no encontrado"));
        
        return new org.springframework.security.core.userdetails.User(
            usuario.getUsuEma(),
           // new String(usuario.getUsuPas()),  // Convierte los bytes a String
           // Collections.emptyList()  // O agrega las autoridades si las tienes
           usuario.getUsuPas(),
              Collections.singletonList(new SimpleGrantedAuthority("ROLE_USER"))
        );
        
    }
}