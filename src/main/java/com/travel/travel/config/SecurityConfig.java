package com.travel.travel.config;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
//import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;

import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.security.config.Customizer;
import com.travel.travel.services.implementados.CustomUserDetailsService;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Autowired
    private JwtAuthenticationFilter jwtAuthenticationFilter;
      @Autowired
    private CustomUserDetailsService customUserDetailsService;



    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                .csrf(csrf -> csrf.disable())
                .cors(cors -> cors.configurationSource(corsConfigurationSource()))
                .authorizeHttpRequests(auth -> auth
                // 1. PÚBLICO: Acceso a ver listados y detalles individuales (GET)
                .requestMatchers(HttpMethod.GET, "/api/servicios", "/api/servicios/**").permitAll()
                .requestMatchers(HttpMethod.GET, "/api/paquetes", "/api/paquetes/**").permitAll()

                // 2. AUTH: Login y Registro son siempre públicos
                .requestMatchers("/api/auth/**").permitAll()

                // 3. PROTEGIDO: Solo ADMIN o EMPLEADO pueden modificar (POST, PUT, DELETE)
                // El '/**' en /api/servicios/** cubre el ID (ej: /api/servicios/18)
                .requestMatchers(HttpMethod.POST, "/api/servicios/**").hasAnyAuthority("admin", "empleado")
                .requestMatchers(HttpMethod.PUT, "/api/servicios/**").hasAnyAuthority("admin", "empleado")
                .requestMatchers(HttpMethod.DELETE, "/api/servicios/**").hasAnyAuthority("admin", "empleado")

                // 4. ADMIN EXCLUSIVO: Gestión de personal
                .requestMatchers("/api/empleados/**").hasAuthority("admin")

                // 5. TODO LO DEMÁS: Requiere estar logueado
                .anyRequest().authenticated()
        )
                // Aquí deberías añadir tu JwtAuthenticationFilter
                .sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
        .addFilterBefore(jwtAuthenticationFilter, UsernamePasswordAuthenticationFilter.class);
        return http.build();
    }

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration authenticationConfiguration) throws Exception {
        return authenticationConfiguration.getAuthenticationManager();
    }
    @Bean
    public DaoAuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(customUserDetailsService);
        authProvider.setPasswordEncoder(passwordEncoder());
        return authProvider;
    }

    @Bean
    public CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration configuration = new CorsConfiguration();

        // Cambia "http://localhost:5173" por la URL real de tu frontend
        configuration.setAllowedOrigins(Arrays.asList("http://localhost:5173"));

        configuration.setAllowedMethods(Arrays.asList("GET", "POST", "PUT", "PATCH", "DELETE", "OPTIONS"));
        configuration.setAllowedHeaders(Arrays.asList("*"));
        configuration.setAllowCredentials(true);

        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", configuration);
        return source;
    }
    @Bean
     public PasswordEncoder passwordEncoder() {
    return new BCryptPasswordEncoder();
}

    @Bean
    public UserDetailsService userDetailsService() {
        return new CustomUserDetailsService();
    }
}