package com.colegio.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.colegio.entidad.Libro;
import com.colegio.repositorio.LibroRepositorio;

@Service
public class LibroServicioImpl implements LibroServicio{
	@Autowired
	private LibroRepositorio repositorio;

	@Override
	public List<Libro> traerLibros() {return repositorio.findAll();}

	@Override
	public List<Libro> traerLibroXTitulo(String titulo) {return repositorio.traerLibroXTitulo(titulo);
	}

	@Override
	public void insertarLibro(Libro libro) {repositorio.save(libro);}

	@Override
	public void eliminarLibro(Integer idLibro) {repositorio.deleteById(idLibro);}

	@Override
	public List<Libro> getLibrosByAutor(Integer idautor) {return repositorio.getLibrosByAutor(idautor);}

	@Override
	public List<Libro> traerLibroXTitulo(String filtro, Pageable pageable) {
	 return repositorio.traerLibroXTitulo(filtro,pageable);
		}
}
