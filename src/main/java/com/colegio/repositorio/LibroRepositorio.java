package com.colegio.repositorio;

import java.util.List;
import org.springframework.data.domain.Pageable;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.colegio.entidad.Libro;

public interface LibroRepositorio extends JpaRepository<Libro, Integer>{
	@Query("Select li from Libro li where li.titulo like :var_titulo")
	public abstract List<Libro> traerLibroXTitulo(@Param("var_titulo") String titulo);
	
	@Query("Select li from Libro li,AutorHasLibro al where li.idLibro = al.libro.idLibro and al.autor.idAutor = :idau")
	public abstract List<Libro> getLibrosByAutor(@Param("idau") Integer idautor);
	
    @Query("Select li from Libro li where li.titulo like :var_fil")
	public abstract List<Libro> traerLibroXTitulo(@Param("var_fil") String filtro, Pageable pageable);


}
