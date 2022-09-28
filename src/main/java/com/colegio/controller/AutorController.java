package com.colegio.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.colegio.entidad.Autor;
import com.colegio.entidad.Pais;
import com.colegio.servicio.AutorService;
import com.colegio.servicio.PaisServicio;

@Controller
public class AutorController {
	@Autowired
	private AutorService autor_servicio;
	
	@Autowired
	private PaisServicio pais_serv;
	
	@RequestMapping("/registraAutorA")
	public String registraAutor(Autor e,Model  model) { 
		autor_servicio.registrarAutor(e);
		return "redirect:home"; 
		}
	@RequestMapping("/vercrudAutor")
	public String vercrud() {
		return"crudAutor";
	}
	@RequestMapping("/salidaA")
	public String salir(HttpSession session) {
		List<Autor> lista = autor_servicio.listarTodos();
		session.setAttribute("autores", lista);
		return "crudAutor";
	}
	
	@RequestMapping("/cargaPaises")
	@ResponseBody
	public List<Pais> ListarPaises(){
		return pais_serv.listarTodosPaises();
	}
	
	@RequestMapping("/consultaCrudAutor")
	public String consultaCrud(String filtro, HttpSession session) {
		List<Autor> lista = autor_servicio.listarPorNombre(filtro+"%");
		session.setAttribute("autores", lista);
		return "crudAutor";
	}
	@RequestMapping("/eliminaCrudAutor")
	public String elimina(Integer id, HttpSession session) {
		
		try {
			Optional<Autor> obj = autor_servicio.buscaPorId(id);
			if(obj.isPresent()) {
				autor_servicio.eliminaAutor(id);
				session.setAttribute("MENSAJE", "Se eliminó correctamente");
			}else {
				session.setAttribute("MENSAJE", "No existe el ID");	
			}	
		} catch (Exception e) {
			session.setAttribute("MENSAJE", "Existe ERROR");
			e.printStackTrace();
		}
		return "redirect:salidaA";
		
		
	}
	@RequestMapping("/regActualizaCrudAutor")
	public String regAct(Autor obj, HttpSession session) {
		try {
			Autor salida = autor_servicio.insertaActualizaModalidad(obj);
			if(salida == null) {
				session.setAttribute("MENSAJE", "Existe ERROR");
			}else {
				session.setAttribute("MENSAJE", "registro o actualización correcta");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return "redirect:salidaA";
	}
	@RequestMapping("/listaTotalPaises")
	@ResponseBody
	public List<Pais> lista(){
		return pais_serv.listarTodosPaises();
	}
	
	@RequestMapping("/consultaAutores")
	@ResponseBody
	public List<Autor> consulta(int parametro){
		List<Autor> listar = null;
		if(parametro == 0) {
			listar = new ArrayList<>();
		}else if(parametro == -1) {
			listar = autor_servicio.listarTodos();
		} else {
			listar = autor_servicio.listarPorPais(parametro);
		}
		return listar;
	}
	
	
}
