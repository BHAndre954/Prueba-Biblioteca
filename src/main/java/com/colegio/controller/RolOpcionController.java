package com.colegio.controller;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.colegio.entidad.Opcion;
import com.colegio.entidad.Rol;
import com.colegio.entidad.RolHasOpcion;
import com.colegio.entidad.RolHasOpcionPK;
import com.colegio.servicio.OpcionService;
import com.colegio.servicio.RolHasOpcionService;
import com.colegio.servicio.RolService;



@Controller
public class RolOpcionController {
	
	
	@Autowired
	private RolService rolService;
	
	@Autowired
	private OpcionService opcionService;
	
	@Autowired
	private RolHasOpcionService rolHasOpcionService;
	
	@RequestMapping("/ver")
	public String ver() {
		return "intranetTransaccionOpcionesDeRol";
	}
	
	@RequestMapping("/cargaRol")
	@ResponseBody
	public List<Rol> cargaRol() {
		return rolService.listarTodos();
	}
	
	@RequestMapping("/cargaOpcion")
	@ResponseBody
	public List<Opcion> cargaOpcion() {
		return opcionService.listaTodos();
	}
	
	@RequestMapping("/cargaOpcionPorRol")
	@ResponseBody
	public List<Opcion> cargaOpcionPorRolint(int idRol) {
		return opcionService.listaTodosPorRol(idRol);
	}
	
	@RequestMapping("/agregarUnaOpcionPorRol")
	@ResponseBody
	public List<Opcion> agregarUnaOpcionPorRol(int idOpcion, int idRol) {
		
		RolHasOpcionPK pk = new RolHasOpcionPK();
		pk.setIdRol(idRol);
		pk.setIdOpcion(idOpcion);
		
		RolHasOpcion obj = new RolHasOpcion();
		obj.setRolHasOpcionPK(pk);
		
		rolHasOpcionService.inserta(obj);
		return opcionService.listaTodosPorRol(idRol);
	}
	
	@RequestMapping("/eliminaUnaOpcionPorRol")
	@ResponseBody
	public List<Opcion> eliminaUnaOpcionPorRol(int idOpcion, int idRol) {
		RolHasOpcionPK pk = new RolHasOpcionPK();
		pk.setIdRol(idRol);
		pk.setIdOpcion(idOpcion);
		
		RolHasOpcion obj = new RolHasOpcion();
		obj.setRolHasOpcionPK(pk);
		
		rolHasOpcionService.elimina(obj);
		return opcionService.listaTodosPorRol(idRol);
	}
	
	@RequestMapping("/agregarTodosOpcionPorRol")
	@ResponseBody
	public List<Opcion> agregarTodosOpcionPorRol(int idRol) {
		
		List<Opcion> lista = opcionService.listaTodosPorRol(idRol);
		for (Opcion x : lista) {
			RolHasOpcionPK pk = new RolHasOpcionPK();
			pk.setIdRol(idRol);
			pk.setIdOpcion(x.getIdOpcion());
			
			RolHasOpcion obj = new RolHasOpcion();
			obj.setRolHasOpcionPK(pk);
			
			rolHasOpcionService.elimina(obj);
		}
		
		List<Opcion> todos = opcionService.listaTodos();
		for (Opcion x : todos) {
			RolHasOpcionPK pk = new RolHasOpcionPK();
			pk.setIdRol(idRol);
			pk.setIdOpcion(x.getIdOpcion());
			
			RolHasOpcion obj = new RolHasOpcion();
			obj.setRolHasOpcionPK(pk);
			
			rolHasOpcionService.inserta(obj);
		}
		
		return todos;
	}
	
	@RequestMapping("/eliminarTodosOpcionPorRol")
	@ResponseBody
	public List<Opcion> eliminarTodosOpcionPorRol(int idRol) {
		
		List<Opcion> lista = opcionService.listaTodosPorRol(idRol);
		for (Opcion x : lista) {
			RolHasOpcionPK pk = new RolHasOpcionPK();
			pk.setIdRol(idRol);
			pk.setIdOpcion(x.getIdOpcion());
			
			RolHasOpcion obj = new RolHasOpcion();
			obj.setRolHasOpcionPK(pk);
			
			rolHasOpcionService.elimina(obj);
		}
		
		return new ArrayList<Opcion>();
	}

}
