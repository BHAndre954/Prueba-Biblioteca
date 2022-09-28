package com.colegio.repositorio;
import org.springframework.data.jpa.repository.JpaRepository;

import com.colegio.entidad.Prestamo;
public interface PrestamoRepositorio extends JpaRepository<Prestamo, Integer>{

}
