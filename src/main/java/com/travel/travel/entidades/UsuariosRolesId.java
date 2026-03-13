package com.travel.travel.entidades;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.Data;

@Embeddable
@Data
public class UsuariosRolesId implements Serializable {

    @Column(name = "rolcod")
    private int rolCod;

    @Column(name = "usucod")
    private int usuCod;
}
