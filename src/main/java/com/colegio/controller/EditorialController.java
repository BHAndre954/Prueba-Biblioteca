package com.colegio.controller;



import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.colegio.entidad.Editorial;
import com.colegio.entidad.Pais;
import com.colegio.servicio.EditorialServicio;
import com.colegio.servicio.PaisServicio;

@Controller
public class EditorialController {

	@Autowired
	private EditorialServicio edi_serv;
	
	@Autowired
	private PaisServicio pais_serv;
	
	@RequestMapping("/registraEditorialBD")
	public String registraEditorial(Editorial e,Model  model) { 
		edi_serv.registrarEditorial(e);
		return "redirect:home"; 
		}
	@RequestMapping("/")
	public String verCrud() {
		return "crudEditorial";
	}
	@RequestMapping("/salidaE")
	public String salir(HttpSession session) {
		List<Editorial> lista = edi_serv.listarTodos();
		session.setAttribute("editoriales", lista);
		return "crudEditorial";
	}
	@RequestMapping("/cargaPais")
	@ResponseBody
	public List<Pais> listasPais() {
		return pais_serv.listarTodosPaises();
	}
	@RequestMapping("/consultaCrudEditorial")
	public String consultaCrud(String filtro, HttpSession session) {
		List<Editorial> lista = edi_serv.listarPorNombre(filtro+"%");
		session.setAttribute("editoriales", lista);
		return "crudEditorial";
	}
	@RequestMapping("/eliminaCrudEditorial")
	public String elimina(Integer id, HttpSession session) {
		
		try {
			Optional<Editorial> obj = edi_serv.buscaPorId(id);
			if(obj.isPresent()) {
				edi_serv.eliminaEditorial(id);
				session.setAttribute("MENSAJE", "Se eliminó correctamente");
			}else {
				session.setAttribute("MENSAJE", "No existe el ID");	
			}	
		} catch (Exception e) {
			session.setAttribute("MENSAJE", "Existe ERROR");
			e.printStackTrace();
		}
		return "redirect:salidaE";
		
		
	}
	@RequestMapping("/regActualizaCrudEditorial")
	public String regAct(Editorial obj, HttpSession session) {
		try {
			Editorial salida = edi_serv.insertaActualizaModalidad(obj);
			if(salida == null) {
				session.setAttribute("MENSAJE", "Existe ERROR");
			}else {
				session.setAttribute("MENSAJE", "registro o actualización correcta");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return "redirect:salidaE";
	}
}
