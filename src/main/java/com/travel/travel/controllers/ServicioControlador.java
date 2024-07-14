package com.travel.travel.controllers;

import com.travel.travel.entidades.Servicio;
import com.travel.travel.services.interfaces.ServiceServicio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping("/api/servicios")
public class ServicioControlador {

    @Autowired
    private ServiceServicio serviceServicio;

    @PostMapping
    public ResponseEntity<Servicio> crearServicio(@RequestBody Servicio servicio) {
        return ResponseEntity.ok(serviceServicio.crearServicio(servicio));
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
    public ResponseEntity<Servicio> subirImagen(@PathVariable int id, @RequestParam("imagen") MultipartFile imagen) throws IOException {
        return ResponseEntity.ok(serviceServicio.subirImagen(id, imagen));
    }
}
