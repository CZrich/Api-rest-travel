package com.travel.travel.controllers;

import com.travel.travel.entidades.Servicio;
import com.travel.travel.services.interfaces.ServiceServicio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;



//import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import java.io.IOException;

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

        Servicio nuevoServicio = serviceServicio.crearServicio(servicio);
        int id = nuevoServicio.getSerCod();

        try {
            serviceServicio.subirImagen(id, imagen);
            return ResponseEntity.ok(nuevoServicio);
        } catch (IOException e) {
            System.out.println(e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
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
    public ResponseEntity<Resource> obtenerImagen(@PathVariable int id) {
        Servicio servicio = serviceServicio.obtenerServicioPorId(id);
        if (servicio == null || servicio.getSerImg() == null) {
            return ResponseEntity.notFound().build();
        }
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.IMAGE_PNG);
        ByteArrayResource resource = new ByteArrayResource(servicio.getSerImg());
        return ResponseEntity.ok().headers(headers).body(resource);
    }
}
