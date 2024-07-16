package com.travel.travel.entidades;


import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "usuarios_roles")
@Data
public class UsuariosRoles {

    @EmbeddedId
    private UsuariosRolesId id;

    @ManyToOne
    @MapsId("rolCod")
    @JoinColumn(name = "rolCod", nullable = false)
    private Rol rol;

    @ManyToOne
    @MapsId("usuCod")
    @JoinColumn(name = "usuCod", nullable = false)
    private Usuario usuario;
}



