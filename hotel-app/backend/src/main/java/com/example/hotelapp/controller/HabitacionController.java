package com.example.hotelapp.controller;

import com.example.hotelapp.repositoriy.HabitacionRepository;
import com.example.hotelapp.model.Habitacion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import jakarta.validation.Valid;
import java.util.List;


@RestController
@RequestMapping("/habitaciones")
@CrossOrigin(origins = "*")
public class HabitacionController {

    @Autowired
    private HabitacionRepository repository;

    @GetMapping
    public ResponseEntity<List<Habitacion>> getAll() {
        return ResponseEntity.ok(repository.findAll());
    }

    @PostMapping
    public ResponseEntity<Habitacion> create(@Valid @RequestBody Habitacion habitacion) {
        return ResponseEntity.ok(repository.save(habitacion));
    }

    @GetMapping("/{id}")
    public ResponseEntity<Habitacion> getById(@PathVariable Long id) {
        return repository.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PutMapping("/{id}")
    public ResponseEntity<Habitacion> update(@PathVariable Long id, @Valid @RequestBody Habitacion datos) {
        return repository.findById(id)
                .map(h -> {
                    h.setNumero(datos.getNumero());
                    h.setTipo(datos.getTipo());
                    h.setDisponible(datos.getDisponible());
                    return ResponseEntity.ok(repository.save(h));
                })
                .orElse(ResponseEntity.notFound().build());
    }
    
// Buscar habitaciones por tipo (ej: Individual, Doble, Suite)
        @GetMapping("/tipo/{tipo}")
        public ResponseEntity<List<Habitacion>> buscarPorTipo(@PathVariable String tipo) {
            return ResponseEntity.ok(repository.findByTipoContainingIgnoreCase(tipo));
        }

        // Buscar habitaciones por disponibilidad (true o false)
        @GetMapping("/disponibles/{estado}")
        public ResponseEntity<List<Habitacion>> buscarPorDisponibilidad(@PathVariable Boolean estado) {
            return ResponseEntity.ok(repository.findByDisponible(estado));
        }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        if (repository.existsById(id)) {
            repository.deleteById(id);
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.notFound().build();
    }
}