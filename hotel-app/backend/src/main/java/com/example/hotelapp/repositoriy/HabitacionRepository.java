package com.example.hotelapp.repositoriy;
import com.example.hotelapp.model.Habitacion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface HabitacionRepository extends JpaRepository<Habitacion, Long> {
    List<Habitacion> findByTipoContainingIgnoreCase(String tipo);
    List<Habitacion> findByDisponible(boolean disponible);
}