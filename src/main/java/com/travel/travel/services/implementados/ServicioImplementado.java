package com.travel.travel.services.implementados;

import com.travel.travel.entidades.Servicio;
import com.travel.travel.respositorios.ServicioRepositorio;
import com.travel.travel.services.interfaces.ServiceServicio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


import java.io.IOException;


import java.util.List;


@Service
public class ServicioImplementado implements ServiceServicio {

    @Autowired
    private  ServicioRepositorio servicioRepositorio;

   @Override
    public Servicio crearServicio(Servicio servicio) {
        return servicioRepositorio.save(servicio);
    }

    @Override
    public Servicio obtenerServicioPorId(int id) {
        return servicioRepositorio.findById(id).orElse(null);

    }
   @Override
    public List<Servicio> obtenerTodosLosServicios() {
        return servicioRepositorio.findAll();
    }
    @Override
    public Servicio actualizarServicio(int id, Servicio detallesServicio) {
        Servicio servicio = obtenerServicioPorId(id);

        servicio.setSerImg(detallesServicio.getSerImg());
        servicio.setSerDes(detallesServicio.getSerDes());
        servicio.setSerNom(detallesServicio.getSerNom());
        servicio.setSerFec(detallesServicio.getSerFec());
        servicio.setSerCos(detallesServicio.getSerCos());
        servicio.setSerEstReg(detallesServicio.getSerEstReg());

        return servicioRepositorio.save(servicio);
    }
    @Override
    public void eliminarServicio(int id) {
        Servicio servicio = obtenerServicioPorId(id);
        servicioRepositorio.delete(servicio);
    }
    @Override
    public Servicio subirImagen(int id, MultipartFile archivoImagen) throws IOException {
        Servicio servicio = obtenerServicioPorId(id);
        servicio.setSerImg(archivoImagen.getBytes());
        return servicioRepositorio.save(servicio);
    }
}

