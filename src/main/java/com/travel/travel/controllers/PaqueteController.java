package com.travel.travel.controllers;

import com.travel.travel.entidades.Paquete;
import com.travel.travel.services.interfaces.ServicePaquete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/paquetes")
@CrossOrigin
public class PaqueteController {

    @Autowired
    private ServicePaquete servicePaquete;

    @PostMapping
    public Paquete crearPaquete(@RequestBody Paquete paquete) {
        return servicePaquete.crearPaquete(paquete);
    }

    @GetMapping("/{id}")
    public Paquete obtenerPaquetePorId(@PathVariable int id) {
        return servicePaquete.obtenerPaquetePorId(id);
    }

    @GetMapping
    public List<Paquete> obtenerTodosLosPaquetes() {
        return servicePaquete.obtenerTodosLosPaquetes();
    }

    @PutMapping("/{id}")
    public Paquete actualizarPaquete(@PathVariable int id, @RequestBody Paquete detallesPaquete) {
        return servicePaquete.actualizarPaquete(id, detallesPaquete);
    }

    @DeleteMapping("/{id}")
    public void eliminarPaquete(@PathVariable int id) {
        servicePaquete.eliminarPaquete(id);
    }
}
