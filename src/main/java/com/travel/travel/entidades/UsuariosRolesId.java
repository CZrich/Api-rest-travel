package com.travel.travel.entidades;

import java.io.Serializable;
import jakarta.persistence.Embeddable;
import lombok.Data;

@Embeddable
@Data
public class UsuariosRolesId implements Serializable {
    private int rolCod;
    private int usuCod;
}