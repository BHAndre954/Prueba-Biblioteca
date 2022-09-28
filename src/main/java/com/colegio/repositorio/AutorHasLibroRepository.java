package com.colegio.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;
import com.colegio.entidad.AutorHasLibro;
import com.colegio.entidad.AutorHasLibroPK;

public interface AutorHasLibroRepository extends JpaRepository<AutorHasLibro, AutorHasLibroPK> {

}
