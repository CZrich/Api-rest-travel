package com.travel.travel.services.implementados;

import com.travel.travel.entidades.Servicio;
import com.travel.travel.repositorios.ServicioRepositorio;
import com.travel.travel.services.interfaces.ServiceServicio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

//import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.UUID;
import java.nio.file.Path;

@Service
public class ServicioImplementado implements ServiceServicio {
   // private static final String UPLOAD_DIR ="uploads";

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
    //Nuevo metodo agregado
  public Servicio subirImagen(int servicioId, MultipartFile imagen) throws IOException {
    if (imagen.isEmpty()) {
        throw new IOException("El archivo de imagen está vacío.");
    }

    String uploadDirectory = "travel/src/main/resources/uploads/";
    
    String originalFilename = imagen.getOriginalFilename();
    String fileExtension = "";

    if (originalFilename != null && originalFilename.contains(".")) {
        fileExtension = originalFilename.substring(originalFilename.lastIndexOf("."));
    }
   

    String newFilename = UUID.randomUUID().toString() + fileExtension;
    Path imagePath = Paths.get(uploadDirectory, newFilename);
   // Path imagePath = Paths.get("src/main/resources/uploads"+newFilename);
   
    // Crear el directorio si no existe
    if (!Files.exists(Paths.get(uploadDirectory))) {
     Files.createDirectories(Paths.get(uploadDirectory));
    }
  
    // Guardar la imagen en el sistema de archivos
    Files.copy(imagen.getInputStream(), imagePath, StandardCopyOption.REPLACE_EXISTING);

    // Actualizar la entidad Servicio con el nombre del archivo de imagen
    Servicio servicio = obtenerServicioPorId(servicioId);
    servicio.setSerImg(newFilename);
    return crearServicio(servicio);  // O el método adecuado para actualizar el servicio en la base de datos
}
    /*
    @Override
    public Servicio subirImagen(int id, MultipartFile archivoImagen) throws IOException {
        Servicio servicio = obtenerServicioPorId(id);
        //servicio.setSerImg(archivoImagen.getBytes());
        return servicioRepositorio.save(servicio);
    }*/
}

