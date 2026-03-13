package com.travel.travel.controllers;

import com.travel.travel.entidades.Servicio;
import com.travel.travel.services.interfaces.ServiceServicio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

//import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.format.annotation.DateTimeFormat;
//import org.springframework.http.HttpHeaders;
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
    private final Path uploadDirectory = Paths.get("uploads").toAbsolutePath();
    @PostMapping(consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<Servicio> crearServicio(
            //@RequestParam("estado") String estado,
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
        servicio.setSerEstReg("A");

        try {
            Servicio nuevoServicio = serviceServicio.crearServicio(servicio);
            int id = nuevoServicio.getSerCod();
            serviceServicio.subirImagen(id, imagen);
            return ResponseEntity.ok(nuevoServicio);
        } catch (IOException e) {
            System.out.println("Error al subir la imagen: " + e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        } catch (Exception e) {
            // Log detallado de cualquier otro error
            System.out.println("Error al crear el servicio: " + e.getMessage());
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }

    @PutMapping("/I/{id}")
    public ResponseEntity<Servicio> inactivarServicio(@PathVariable int id){
      
        return  ResponseEntity.ok(serviceServicio.inactivarServicio(id));
    }
    @PutMapping("/A/{id}")
    public ResponseEntity<Servicio> activarServicio(@PathVariable int id){
        
        return  ResponseEntity.ok(serviceServicio.activarServicio(id));
    }

    @GetMapping("/{id}")
    public ResponseEntity<Servicio> obtenerServicioPorId(@PathVariable int id) {
        return ResponseEntity.ok(serviceServicio.obtenerServicioPorId(id));
    }

    @GetMapping
    public ResponseEntity<List<Servicio>> obtenerTodosLosServicios() {
        return ResponseEntity.ok(serviceServicio.obtenerTodosLosServicios());
    }
/*
    @PutMapping("/{id}")
    public ResponseEntity<Servicio> actualizarServicio(@PathVariable int id, @RequestBody Servicio detallesServicio) {
        return ResponseEntity.ok(serviceServicio.actualizarServicio(id, detallesServicio));
    }*/

    @PutMapping(value = "/{id}", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<Servicio> actualizarServicio(
            @PathVariable int id,
            @RequestParam("estado") String estado,
            @RequestParam("nombre") String nombre,
            @RequestParam("descripcion") String descripcion,
            @RequestParam("fecha") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date fecha,
            @RequestParam("destino") String destino,
            @RequestParam("costo") double costo,
            @RequestParam(value = "imagen", required = false) MultipartFile imagen) {

        Servicio detallesServicio = new Servicio();
        detallesServicio.setSerEstReg(estado);
        detallesServicio.setSerNom(nombre);
        detallesServicio.setSerDes(descripcion);
        detallesServicio.setSerFec(fecha);
        detallesServicio.setSerDest(destino);
        detallesServicio.setSerCos(costo);

        try {
            Servicio servicioActualizado = serviceServicio.actualizarServicio(id, detallesServicio, imagen);
            return ResponseEntity.ok(servicioActualizado);
        } catch (IOException e) {
            System.out.println("Error al subir la imagen: " + e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        } catch (Exception e) {
            System.out.println("Error al actualizar el servicio: " + e.getMessage());
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
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
/*
    @GetMapping("/{id}/imagen")
    public ResponseEntity<Resource> obtenerImagen(@PathVariable int id) throws IOException {
        Servicio servicio = serviceServicio.obtenerServicioPorId(id);
        if (servicio == null || servicio.getSerImg() == null) {
            return ResponseEntity.notFound().build();
        }

        Path uploadDirectory = Paths.get(System.getProperty("user.dir"), "travel/src/main/resources/uploads");
        Path imagePath = uploadDirectory.resolve(servicio.getSerImg());

        if (!Files.exists(imagePath)) {
            // logger.error("La imagen no existe en la ruta: " + imagePath);
            System.out.println("la imagen  no existe en:" + imagePath);
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
    }*/
    @GetMapping("/{id}/imagen")
    public ResponseEntity<Resource> obtenerImagen(@PathVariable int id) throws IOException {

        Servicio servicio = serviceServicio.obtenerServicioPorId(id);

        if (servicio == null || servicio.getSerImg() == null) {
            return ResponseEntity.notFound().build();
        }

        Path imagePath = uploadDirectory.resolve(servicio.getSerImg());

        if (!Files.exists(imagePath)) {
            System.out.println("Imagen no encontrada en: " + imagePath);
            return ResponseEntity.notFound().build();
        }

        Resource resource = new UrlResource(imagePath.toUri());

        String contentType = Files.probeContentType(imagePath);
        if (contentType == null) {
            contentType = "application/octet-stream";
        }

        return ResponseEntity.ok()
                .contentType(MediaType.parseMediaType(contentType))
                .body(resource);
    }

}
