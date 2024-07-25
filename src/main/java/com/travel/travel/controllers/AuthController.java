package com.travel.travel.controllers;

//import com.travel.travel.dto.AuthResponseDto;
import com.travel.travel.dto.LoginResponseDto;
import com.travel.travel.dto.UserRegistrationDto;
//import com.travel.travel.entidades.DatoUsuario;
import com.travel.travel.entidades.Usuario;
import com.travel.travel.entidades.UsuariosRoles;
import com.travel.travel.services.implementados.AuthService;
import com.travel.travel.services.implementados.UsuarioService;
import com.travel.travel.services.implementados.UsuariosRolesService;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/auth")
@CrossOrigin
public class AuthController {

    @Autowired
    private AuthService authService;

    @Autowired
    private UsuarioService usuarioService;

    @Autowired
    private UsuariosRolesService usuariosRolesService;

   @PostMapping("/register")
    public ResponseEntity<Usuario> registerUser(@RequestBody UserRegistrationDto dto) {
        return ResponseEntity.ok(usuarioService.registrarUsuario(dto));
    }
    /*
    @PostMapping("/register")
public ResponseEntity<?> registerUser(@RequestBody UserRegistrationDto dto) {
    usuarioService.registrarUsuario(dto);
    return ResponseEntity.ok(Map.of("message", "User registered successfully"));
}*/
 
    @PostMapping("/login")
    public ResponseEntity<LoginResponseDto> loginUser(@RequestBody Usuario usuario) {
       // logger.debug("Intento de login para usuario: " + usuario.getUsuEma());
        //String token = authService.authenticateUser(usuario.getUsuEma(), new String(usuario.getUsuPas()));
        String token = authService.authenticateUser(usuario.getUsuEma(), usuario.getUsuPas());
        Usuario currentUser = authService.getCurrentUser();
        UsuariosRoles usuariosRoles=usuariosRolesService.getByUser(currentUser);
        String role =usuariosRoles.getRol().getRolNom();
       /// String role = currentUser.getRolles().stream().findFirst().orElse("Cliente"); // Assuming single role
     

        LoginResponseDto response = new LoginResponseDto();
        response.setToken(token);
        response.setRole(role);
        response.setEmail(usuario.getUsuEma());
       

        return ResponseEntity.ok(response);
    }
}
