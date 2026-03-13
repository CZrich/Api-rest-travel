package com.travel.travel.services.implementados;

import com.travel.travel.entidades.Servicio;
import com.travel.travel.repositorios.ServicioRepositorio;
import com.travel.travel.services.interfaces.ServiceServicio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.UUID;
import java.nio.file.Path;

@Service
public class ServicioImplementado implements ServiceServicio {


    @Autowired
    private ServicioRepositorio servicioRepositorio;
  //  @Autowired
  //private  UploadFileImgService uploadFileImgService;
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
    public void eliminarServicio(int id) {
        Servicio servicio = obtenerServicioPorId(id);
        servicioRepositorio.delete(servicio);
    }

    @Override
    public Servicio actualizarServicio(int id, Servicio detallesServicio, MultipartFile imagen) throws IOException {

        Servicio servicio = obtenerServicioPorId(id);

        servicio.setSerEstReg(detallesServicio.getSerEstReg());
        servicio.setSerNom(detallesServicio.getSerNom());
        servicio.setSerDes(detallesServicio.getSerDes());
        servicio.setSerFec(detallesServicio.getSerFec());
        servicio.setSerDest(detallesServicio.getSerDest());
        servicio.setSerCos(detallesServicio.getSerCos());

        if (imagen != null && !imagen.isEmpty()) {

            // eliminar imagen anterior
            if (servicio.getSerImg() != null) {
                Path imagePath = Paths.get("uploads", servicio.getSerImg());
                Files.deleteIfExists(imagePath);
            }
            //String newFilename = uploadFileImgService.copy(imagen);
            //servicio.setSerImg(newFilename);
            // subir nueva imagen
           subirImagen(servicio.getSerCod(), imagen);
        }

        return servicioRepositorio.save(servicio);
    }
    @Override
    public Servicio activarServicio(int id){
        Servicio servicio = servicioRepositorio.findById(id).orElse(null);
        if(servicio!=null){
            servicio.setSerEstReg("A");
            return servicioRepositorio.save(servicio);
        }
        return null;
    }
    @Override
    public Servicio inactivarServicio(int id){
        Servicio servicio = servicioRepositorio.findById(id).orElse(null);
        if(servicio!=null){
            servicio.setSerEstReg("I");
            return servicioRepositorio.save(servicio);
        }
        return null;
    }


    @Override
    public Servicio subirImagen(int servicioId, MultipartFile imagen) throws IOException {
        if (imagen.isEmpty()) {
            throw new IOException("El archivo de imagen está vacío.");
        }

        // Usar la misma lógica de ruta absoluta
        String uploadDirectory = System.getProperty("user.dir") + File.separator + "uploads";

        String originalFilename = imagen.getOriginalFilename();
        String fileExtension = (originalFilename != null && originalFilename.contains("."))
                ? originalFilename.substring(originalFilename.lastIndexOf(".")) : "";

        String newFilename = UUID.randomUUID().toString() + fileExtension;
        Path imagePath = Paths.get(uploadDirectory).resolve(newFilename);

        // Crear el directorio si no existe
        Files.createDirectories(imagePath.getParent());

        // Guardar físicamente
        Files.copy(imagen.getInputStream(), imagePath, StandardCopyOption.REPLACE_EXISTING);

        // Actualizar base de datos
        Servicio servicio = obtenerServicioPorId(servicioId);
        servicio.setSerImg(newFilename);
        return servicioRepositorio.save(servicio);
    }
}
