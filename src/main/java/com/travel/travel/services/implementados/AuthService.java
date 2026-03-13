package com.travel.travel.services.implementados;

import com.travel.travel.entidades.Usuario;
import com.travel.travel.repositorios.UsuarioRepository;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.crypto.SecretKey;
import java.util.Date;

@Service
public class AuthService {

    private final SecretKey key;

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private UsuarioRepository usuarioRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Value("${jwt.expiration.ms}")
    private long jwtExpirationMs;

    public AuthService(@Value("${jwt.secret}") String secret) {
        this.key = Keys.hmacShaKeyFor(secret.getBytes());
    }

    // 1. Método para autenticar y retornar el token
    public String authenticateUser(String email, String password) {
        try {
            // Validar que el usuario existe
            Usuario usuario = usuarioRepository.findByUsuEma(email)
                    .orElseThrow(() -> new RuntimeException("Usuario no encontrado"));

            // Validar contraseña
            if (!passwordEncoder.matches(password, usuario.getUsuPas())) {
                throw new BadCredentialsException("Contraseña incorrecta");
            }

            // Autenticar en el sistema de Spring Security
            Authentication authentication = authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(email, password)
            );

            SecurityContextHolder.getContext().setAuthentication(authentication);
            return generateToken(authentication);
        } catch (Exception e) {
            throw new RuntimeException("Error en la autenticación: " + e.getMessage());
        }
    }

    // 2. Método privado para generar el JWT
    private String generateToken(Authentication authentication) {
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        return Jwts.builder()
                .subject(userDetails.getUsername())
                .issuedAt(new Date())
                .expiration(new Date(System.currentTimeMillis() + jwtExpirationMs))
                .signWith(key)
                .compact();
    }

    // 3. Obtener el usuario actual desde el contexto de seguridad
    public Usuario getCurrentUser() {
        String email = SecurityContextHolder.getContext().getAuthentication().getName();
        return usuarioRepository.findByUsuEma(email)
                .orElse(null);
    }
}