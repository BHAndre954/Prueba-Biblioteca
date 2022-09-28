package com.colegio.controller;

import java.util.ArrayList;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.colegio.entidad.Autor;
import com.colegio.entidad.AutorHasLibro;
import com.colegio.entidad.AutorHasLibroPK;
import com.colegio.entidad.Libro;
import com.colegio.servicio.AutorHasLibroService;
import com.colegio.servicio.AutorService;
import com.colegio.servicio.LibroServicio;

@Controller
public class AutorLibroController {

	@Autowired
	private AutorService autorService;

	@Autowired
	private LibroServicio libroService;

	@Autowired
	private AutorHasLibroService autorLibroService;

	@RequestMapping("/cargaTodosAutorOnLibro")
	@ResponseBody
	public List<Autor> cargaTodosAutorOnLibro() {
		return autorService.listarTodos();
	}

	@RequestMapping("/cargaTodosLibro")
	@ResponseBody
	public List<Libro> cargaTodosLibro() {
		return libroService.traerLibros();
	}

	@RequestMapping("/cargaLibroPorAutor")
	@ResponseBody
	public List<Libro> cargaLibroPorAutor(Integer idAutor) {
		return libroService.getLibrosByAutor(idAutor);
	}

	@RequestMapping("/agregarLibroPorAutor")
	@ResponseBody
	public List<Libro> agregarLibroPorAutor(Integer idLibro, Integer idAutor) {
		AutorHasLibroPK pk = new AutorHasLibroPK();
		pk.setIdAutor(idAutor);
		pk.setIdLibro(idLibro);

		AutorHasLibro obj = new AutorHasLibro();
		obj.setAutorHasLibroPK(pk);

		autorLibroService.inserta(obj);
		return libroService.getLibrosByAutor(idAutor);
	}

	@RequestMapping("/eliminaLibroByAutor")
	@ResponseBody
	public List<Libro> eliminaLibroByAutor(Integer idLibro, Integer idAutor) {
		AutorHasLibroPK pk = new AutorHasLibroPK();
		pk.setIdAutor(idAutor);
		pk.setIdLibro(idLibro);

		AutorHasLibro obj = new AutorHasLibro();
		obj.setAutorHasLibroPK(pk);

		autorLibroService.elimina(obj);
		return libroService.getLibrosByAutor(idAutor);
	}

	@RequestMapping("/agregarTodosLibroByAutor")
	@ResponseBody
	public List<Libro> agregarTodosLibroByAutor(Integer idAutor) {
		List<Libro> lista = libroService.getLibrosByAutor(idAutor);
		for (Libro x : lista) {
			AutorHasLibroPK pk = new AutorHasLibroPK();
			pk.setIdAutor(idAutor);
			pk.setIdLibro(x.getIdLibro());

			AutorHasLibro obj = new AutorHasLibro();
			obj.setAutorHasLibroPK(pk);

			autorLibroService.elimina(obj);
		}
		List<Libro> todos = libroService.traerLibros();
		for (Libro x : todos) {
			AutorHasLibroPK pk = new AutorHasLibroPK();
			pk.setIdAutor(idAutor);
			pk.setIdLibro(x.getIdLibro());

			AutorHasLibro obj = new AutorHasLibro();
			obj.setAutorHasLibroPK(pk);

			autorLibroService.inserta(obj);
		}
		return todos;
	}

	@RequestMapping("/eliminarTodosLibroPorAutor")
	@ResponseBody
	public List<Libro> eliminarTodosLibroPorAutor(Integer idAutor) {
		List<Libro> lista = libroService.getLibrosByAutor(idAutor);
		for (Libro x : lista) {
			AutorHasLibroPK pk = new AutorHasLibroPK();
			pk.setIdAutor(idAutor);
			pk.setIdLibro(x.getIdLibro());

			AutorHasLibro obj = new AutorHasLibro();
			obj.setAutorHasLibroPK(pk);

			autorLibroService.elimina(obj);
		}
		return new ArrayList<Libro>();
	}

}
