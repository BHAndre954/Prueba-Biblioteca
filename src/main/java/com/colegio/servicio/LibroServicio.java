package com.colegio.servicio;

import java.util.List;
import org.springframework.data.domain.Pageable;

import com.colegio.entidad.Libro;


public interface LibroServicio {
	public abstract List<Libro> traerLibros();
	public abstract List<Libro> traerLibroXTitulo(String titulo);
	public abstract void insertarLibro(Libro libro);
	public abstract void eliminarLibro(Integer idLibro);
	public abstract List<Libro> getLibrosByAutor(Integer idautor);

	public abstract List<Libro> traerLibroXTitulo(String filtro, Pageable pageable);

	
}
