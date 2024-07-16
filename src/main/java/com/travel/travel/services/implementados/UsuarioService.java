package com.travel.travel.services.implementados;

import com.travel.travel.dto.UserRegistrationDto;
import com.travel.travel.entidades.DatoUsuario;
import com.travel.travel.entidades.Rol;
import com.travel.travel.entidades.Usuario;
import com.travel.travel.entidades.UsuariosRoles;
import com.travel.travel.entidades.UsuariosRolesId;
import com.travel.travel.repositorios.DatoUsuarioRepository;
import com.travel.travel.repositorios.UsuarioRepository;
import com.travel.travel.repositorios.UsuariosRolesRepository;

import jakarta.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
//import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UsuarioService {
  /* 
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
    }*/

    @Autowired
    private UsuarioRepository usuarioRepository;

    @Autowired
    private DatoUsuarioRepository datoUsuarioRepository;

    @Autowired
    private RolService rolService;

    //@Autowired
    //private UsuariosRolesService usuariosRolesService;
    @Autowired
    private UsuariosRolesRepository usuariosRolesRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;
    
    @Transactional
    public Usuario registrarUsuario(UserRegistrationDto dto) {
        //usuario.setUsuPas(passwordEncoder.encode(usuario.getUsuPas()));
        Usuario usuario = new Usuario();
        usuario.setUsuEma(dto.getEmail());
       // usuario.setUsuPas(passwordEncoder.encode(new String(usuario.getUsuPas())).getBytes());
       usuario.setUsuPas(passwordEncoder.encode(dto.getPassword()));
        //usuario.setUsuPas(passwordEncoder.encode(new String(dto.getPassword())).getBytes());
        usuario.setUsuEstReg("A");
        Usuario savedUsuario = usuarioRepository.save(usuario);

        DatoUsuario datoUsuario = new DatoUsuario();
        datoUsuario.setUsuNom(dto.getNombre());
        datoUsuario.setUsuApePa(dto.getApellidoPaterno());
        datoUsuario.setUsuApeMa(dto.getApellidoMaterno());
        datoUsuario.setUsuDir(dto.getDireccion());
        datoUsuario.setUsuFecNac(dto.getFechaNacimiento());
        datoUsuario.setUsuDNI(dto.getDni());
        datoUsuario.setUsuNac(dto.getNacionalidad());
        datoUsuario.setUsuCel(dto.getCelular());
        datoUsuario.setUsuEstReg("A");
        datoUsuario.setUsuario(savedUsuario);

        datoUsuarioRepository.save(datoUsuario);

        // Asignar rol por defecto
        Rol defaultRole  =  rolService.findByNombre("cliente");
        if (defaultRole != null) {
            UsuariosRolesId usuariosRolesId = new UsuariosRolesId();
            usuariosRolesId.setRolCod(defaultRole.getRolCod());
            usuariosRolesId.setUsuCod(savedUsuario.getUsuCod());

            UsuariosRoles usuariosRoles = new UsuariosRoles();
            usuariosRoles.setId(usuariosRolesId);
            usuariosRoles.setRol(defaultRole);
            usuariosRoles.setUsuario(savedUsuario);

            usuariosRolesRepository.save(usuariosRoles);
        }

        return savedUsuario;
    }

    public DatoUsuario registrarDatoUsuario(DatoUsuario datoUsuario) {
        datoUsuario.setUsuEstReg("A");
        return datoUsuarioRepository.save(datoUsuario);
    }
}
