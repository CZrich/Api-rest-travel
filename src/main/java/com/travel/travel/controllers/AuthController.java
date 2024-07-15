package com.travel.travel.controllers;

import com.travel.travel.entidades.Usuario;
import com.travel.travel.services.implementados.AuthService;
import com.travel.travel.services.implementados.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/auth")
public class AuthController {

    @Autowired
    private AuthService authService;

    @Autowired
    private UsuarioService usuarioService;

    @PostMapping("/register")
    public ResponseEntity<Usuario> registerUser(@RequestBody Usuario usuario) {
        return ResponseEntity.ok(usuarioService.registrarUsuario(usuario));
    }

    @PostMapping("/login")
    public ResponseEntity<String> loginUser(@RequestBody Usuario usuario) {
        String token = authService.authenticateUser(usuario.getUsuEma(), new String(usuario.getUsuPas()));
        return ResponseEntity.ok(token);
    }
}
