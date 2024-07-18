package com.travel.travel.services.implementados;

import com.travel.travel.entidades.Usuario;
import com.travel.travel.repositorios.UsuarioRepository;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
//import org.springframework.security.crypto.password.PasswordEncoder;
//import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import io.jsonwebtoken.security.Keys;
//import java.nio.charset.StandardCharsets;

import java.util.Date;

import javax.crypto.SecretKey;



@Service
public class AuthService {

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private UsuarioRepository usuarioRepository;

  @Autowired
   private PasswordEncoder passwordEncoder;
    
 


//private final String jwtSecret = "tu_secreto_seguro_de_al_menos_32_bytes_de_longitud";
private final SecretKey jwtSecretKey = Keys.secretKeyFor(SignatureAlgorithm.HS512);
private final long jwtExpirationMs = 86400000; // 24 hours

public String authenticateUser(String email, String password) {
    try {
        Usuario usuario = usuarioRepository.findByUsuEma(email)
                .orElseThrow(() -> new RuntimeException("Usuario no encontrado"));

        if (!passwordEncoder.matches(password, usuario.getUsuPas())) {
            throw new RuntimeException("Contraseña incorrecta");
        }

        Authentication authentication = authenticationManager.authenticate(
            new UsernamePasswordAuthenticationToken(email, password)
        );
        SecurityContextHolder.getContext().setAuthentication(authentication);
        return generateToken(authentication);
    } catch (BadCredentialsException e) {
        throw new RuntimeException("Email o contraseña inválidos", e);
    } catch (Exception e) {
        throw new RuntimeException("Error durante la autenticación", e);
    }
}



    private String generateToken(Authentication authentication) {
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        return Jwts.builder()
                .setSubject(userDetails.getUsername())
                .setIssuedAt(new Date())
                .setExpiration(new Date(System.currentTimeMillis() + jwtExpirationMs))
                //.signWith(Keys.hmacShaKeyFor(jwtSecret.getBytes(StandardCharsets.UTF_8)), SignatureAlgorithm.HS512)
                .signWith(jwtSecretKey)
                .compact();
    }

    public Usuario getCurrentUser() {
        String email = SecurityContextHolder.getContext().getAuthentication().getName();
        return usuarioRepository.findByUsuEma(email).orElse(null);
    }
}
