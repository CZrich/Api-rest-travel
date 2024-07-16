package com.travel.travel.controllers;

import com.travel.travel.entidades.Servicio;
import com.travel.travel.services.interfaces.ServiceServicio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

//import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.Path;
import java.util.List;
import java.util.Date;
@RestController
@RequestMapping("/api/servicios")
@CrossOrigin
public class ServicioControlador {

    @Autowired
    private ServiceServicio serviceServicio;
  /*
    @PostMapping
    public ResponseEntity<Servicio> crearServicio(@RequestBody Servicio servicio) {
        
        return ResponseEntity.ok(serviceServicio.crearServicio(servicio));
    }
    @PostMapping
    public ResponseEntity<Servicio> crearServicio(@RequestBody Servicio servicio, @RequestParam("imagen") MultipartFile imagen) {
        Servicio nuevoServicio = serviceServicio.crearServicio(servicio);
        int id = nuevoServicio.getSerCod();
        try{
        serviceServicio.subirImagen(id, imagen);
        return ResponseEntity.ok(nuevoServicio);
        }catch(IOException e){
            System.out.println(e.getMessage());
        }
        return null;
    }*/

    @PostMapping(consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<Servicio> crearServicio(
        @RequestParam("estado") String estado,
        @RequestParam("nombre") String nombre,
        @RequestParam("descripcion") String descripcion,
        @RequestParam("fecha") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date fecha,
        @RequestParam("destino") String destino,
        @RequestParam("costo") double costo,
        @RequestParam("imagen") MultipartFile imagen) {

        Servicio servicio = new Servicio();
        servicio.setSerNom(nombre);
        servicio.setSerDes(descripcion);
        servicio.setSerFec(fecha);
        servicio.setSerDest(destino);
        servicio.setSerCos(costo);
        servicio.setSerEstReg(estado);

      

        try {
            Servicio nuevoServicio = serviceServicio.crearServicio(servicio);
            int id = nuevoServicio.getSerCod();
            serviceServicio.subirImagen(id, imagen);
            return ResponseEntity.ok(nuevoServicio);
        } catch (IOException e) {
            System.out.println("Error al subir la imagen: " + e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }catch (Exception e) {
            // Log detallado de cualquier otro error
            System.out.println("Error al crear el servicio: " + e.getMessage());
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<Servicio> obtenerServicioPorId(@PathVariable int id) {
        return ResponseEntity.ok(serviceServicio.obtenerServicioPorId(id));
    }

    @GetMapping
    public ResponseEntity<List<Servicio>> obtenerTodosLosServicios() {
        return ResponseEntity.ok(serviceServicio.obtenerTodosLosServicios());
    }

    @PutMapping("/{id}")
    public ResponseEntity<Servicio> actualizarServicio(@PathVariable int id, @RequestBody Servicio detallesServicio) {
        return ResponseEntity.ok(serviceServicio.actualizarServicio(id, detallesServicio));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> eliminarServicio(@PathVariable int id) {
        serviceServicio.eliminarServicio(id);
        return ResponseEntity.noContent().build();
    }

    @PostMapping("/{id}/imagen")
    public ResponseEntity<Servicio> subirImagen(@PathVariable int id, @RequestParam("imagen") MultipartFile imagen)
            throws IOException {
        return ResponseEntity.ok(serviceServicio.subirImagen(id, imagen));
    }
    @GetMapping("/{id}/imagen")
public ResponseEntity<Resource> obtenerImagen(@PathVariable int id) throws IOException {
    Servicio servicio = serviceServicio.obtenerServicioPorId(id);
    if (servicio == null || servicio.getSerImg() == null) {
        return ResponseEntity.notFound().build();
    }

    Path uploadDirectory = Paths.get(System.getProperty("user.dir"), "travel/src/main/resources/uploads");
    Path imagePath = uploadDirectory.resolve(servicio.getSerImg());

    if (!Files.exists(imagePath)) {
      //  logger.error("La imagen no existe en la ruta: " + imagePath);
      System.out.println("la imagen  no existe en:" +imagePath);
        return ResponseEntity.notFound().build();
    }

    ByteArrayResource resource = new ByteArrayResource(Files.readAllBytes(imagePath));

    String contentType = Files.probeContentType(imagePath);
    if (contentType == null) {
        contentType = "application/octet-stream";
    }

    return ResponseEntity.ok()
            .contentType(MediaType.parseMediaType(contentType))
            .body(resource);
}
    /*@GetMapping("/{id}/imagen")
    public ResponseEntity<Resource> obtenerImagen(@PathVariable int id) throws IOException {
        Servicio servicio = serviceServicio.obtenerServicioPorId(id);
        if (servicio == null || servicio.getSerImg() == null) {
            return ResponseEntity.notFound().build();
        }
    
        // Obtiene la ruta del directorio uploads en la raíz del proyecto
        Path uploadDirectory = Paths.get(System.getProperty("user.dir"), "src/main/resources/uploads");
        Path imagePath = uploadDirectory.resolve(servicio.getSerImg());
    
        if (!Files.exists(imagePath)) {
            return ResponseEntity.notFound().build();
        }
    
        ByteArrayResource resource = new ByteArrayResource(Files.readAllBytes(imagePath));
    
        // Determina el tipo de contenido del archivo
        String contentType = Files.probeContentType(imagePath);
        if (contentType == null) {
            contentType = "application/octet-stream";  // Tipo de contenido genérico en caso de que no se pueda determinar
        }
    
        return ResponseEntity.ok()
                .contentType(MediaType.parseMediaType(contentType))
                .body(resource);
    }
/*
    @GetMapping("/{id}/imagen")
    public ResponseEntity<Resource> obtenerImagen(@PathVariable int id) {
        Servicio servicio = serviceServicio.obtenerServicioPorId(id);
        if (servicio == null || servicio.getSerImg() == null) {
            return ResponseEntity.notFound().build();
        }
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.IMAGE_PNG);
        ByteArrayResource resource = new ByteArrayResource(servicio.getSerImg());
        return ResponseEntity.ok().headers(headers).body(resource);
    }*/
}
