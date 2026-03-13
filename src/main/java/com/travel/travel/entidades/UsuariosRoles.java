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
    @JoinColumn(name = "rolcod")   // ← EXACTO como en la BD
    private Rol rol;

    @ManyToOne
    @MapsId("usuCod")
    @JoinColumn(name = "usucod")   // ← EXACTO como en la BD
    private Usuario usuario;
}


