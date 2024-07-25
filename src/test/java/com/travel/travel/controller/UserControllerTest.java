//package com.travel.travel;

package com.travel.travel.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.travel.travel.TestSecurityConfig;
import com.travel.travel.controllers.AuthController;
//import com.travel.travel.dto.LoginDto;

import com.travel.travel.dto.UserRegistrationDto;
import com.travel.travel.entidades.Rol;
import com.travel.travel.entidades.Usuario;
import com.travel.travel.entidades.UsuariosRoles;
//import com.travel.travel.service.UserService;
import com.travel.travel.services.implementados.AuthService;
import com.travel.travel.services.implementados.UsuarioService;
import com.travel.travel.services.implementados.UsuariosRolesService;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.MockitoAnnotations;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.context.annotation.Import;
import org.springframework.http.MediaType;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.web.servlet.MockMvc;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.text.SimpleDateFormat;

@WebMvcTest(AuthController.class)
@Import(TestSecurityConfig.class)
public class UserControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private AuthService authService;

    @MockBean
    private UsuarioService usuarioService;

    @MockBean
    private UsuariosRolesService usuariosRolesService;

    @Autowired
    private ObjectMapper objectMapper;

    @BeforeEach
    public void setup() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    @WithMockUser(username = "admin", roles = { "ADMIN" })
    public void testRegisterUser() throws Exception {
        UserRegistrationDto registrationDto = new UserRegistrationDto();
        registrationDto.setEmail("test@example.com");
        registrationDto.setPassword("password");
        registrationDto.setNombre("John");
        registrationDto.setApellidoPaterno("Doe");
        registrationDto.setApellidoMaterno("Condori");
        registrationDto.setDireccion("Sin Direccion");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        registrationDto.setFechaNacimiento(sdf.parse("2000-04-04"));
        registrationDto.setDni(12345678);
        registrationDto.setNacionalidad("Peru");
        registrationDto.setCelular(784512963);

        Usuario usuario = new Usuario();
        usuario.setUsuEma("test@example.com");

        when(usuarioService.registrarUsuario(any(UserRegistrationDto.class))).thenReturn(usuario);

        mockMvc.perform(post("/api/auth/register")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(registrationDto)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.email").value("test@example.com"));
    }

    @Test
    public void testLoginUser() throws Exception {
        Usuario usuario = new Usuario();
        usuario.setUsuEma("test@example.com");
        usuario.setUsuPas("password");

        // Crear el objeto UsuariosRoles con un rol asociado
        Rol rol = new Rol();
        rol.setRolNom("cliente");
        UsuariosRoles usuariosRoles = new UsuariosRoles();
        usuariosRoles.setRol(rol);

        // Configurar los mocks
        when(authService.authenticateUser(anyString(), anyString())).thenReturn("token");
        when(authService.getCurrentUser()).thenReturn(usuario);
        when(usuariosRolesService.getByUser(any(Usuario.class))).thenReturn(usuariosRoles);

        // Realizar la solicitud y verificar el resultado
        mockMvc.perform(post("/api/auth/login")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(usuario)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.token").value("token"))
                .andExpect(jsonPath("$.role").value("cliente"))
                .andExpect(jsonPath("$.email").value("test@example.com"));
    }

}
