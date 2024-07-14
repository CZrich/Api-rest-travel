package com.travel.travel.services.interfaces;

import org.springframework.web.multipart.MultipartFile;

import com.travel.travel.entidades.Servicio;

import java.io.IOException;
import java.util.List;

public interface ServiceServicio {

    Servicio crearServicio(Servicio servicio) ;

    Servicio obtenerServicioPorId(int id) ;
    List<Servicio> obtenerTodosLosServicios() ;

     Servicio actualizarServicio(int id, Servicio detallesServicio) ;
    void eliminarServicio(int id);

     Servicio subirImagen(int id, MultipartFile archivoImagen) throws IOException;;
}
