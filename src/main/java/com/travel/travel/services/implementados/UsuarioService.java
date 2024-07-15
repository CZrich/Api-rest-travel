package com.travel.travel.services.implementados;

import com.travel.travel.entidades.Usuario;
import com.travel.travel.repositorios.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UsuarioService {

    @Autowired
    private UsuarioRepository usuarioRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    public Usuario registrarUsuario(Usuario usuario) {
        usuario.setUsuPas(passwordEncoder.encode(new String(usuario.getUsuPas())).getBytes());
        return usuarioRepository.save(usuario);
    }

    public Usuario obtenerUsuarioPorEmail(String email) {
        return usuarioRepository.findByUsuEma(email).orElseThrow(() -> new RuntimeException("Usuario no encontrado"));
    }
}
