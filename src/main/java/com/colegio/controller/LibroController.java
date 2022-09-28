package com.colegio.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.colegio.entidad.Libro;
import com.colegio.entidad.TipoLibro;
import com.colegio.servicio.LibroServicio;
import com.colegio.servicio.TipoLibroServicio;

@Controller
public class LibroController {

	
	@Autowired
	private LibroServicio libroService;
	@Autowired
	private TipoLibroServicio tipolibroService;
	
	@RequestMapping("/vercrudLibro")
	public String verCrud() {
		return "intranetRegistraLibro";
	}
	@RequestMapping(value="/getTipoLibros",method = RequestMethod.GET,produces = "application/json")
	@ResponseBody
	public ResponseEntity<List<TipoLibro>> listaTipoLibro() {
		List<TipoLibro> lista =  tipolibroService.traerTipoLibros();
		return new ResponseEntity<>(lista, HttpStatus.OK);
	}
	@RequestMapping("/consultaCrudLibro")
	public String lista(String titulo, HttpSession session) {
		List<Libro> lista =  libroService.traerLibroXTitulo(titulo+"%");
		session.setAttribute("libros", lista);
		return "intranetRegistraLibro";
	}
	@RequestMapping("/registraCrudLibro")
	public String registraActualiza(Libro obj, HttpSession session) {	
		try {
			libroService.insertarLibro(obj);		
			session.setAttribute("MENSAJE", "Se registro correctamente");	
		} catch (Exception e) {
			session.setAttribute("MENSAJE", "Existe ERROR");
			e.printStackTrace();
		}
		return "redirect:salidaLibro";
	}
	@RequestMapping("/eliminaCrudLibro")
	public String elimina(Integer idLibro, HttpSession session) {
		try {System.out.println(idLibro+"esto es");
			libroService.eliminarLibro(idLibro);
			session.setAttribute("MENSAJE", "Se elimino correctamente");
				
		} catch (Exception e) {
			session.setAttribute("MENSAJE", "Existe ERROR");
			e.printStackTrace();
		}
		return "redirect:salidaLibro";
	}
	@RequestMapping("/salidaLibro")
	public String listarTodosLibros(HttpSession session) {
		List<Libro> data = libroService.traerLibros();
		session.setAttribute("libros", data);
		return "intranetRegistraLibro";
	}
	
	
}
