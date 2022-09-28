package com.colegio.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.colegio.entidad.Rol;
import com.colegio.entidad.Usuario;
import com.colegio.entidad.UsuarioHasRol;
import com.colegio.entidad.UsuarioHasRolPK;
import com.colegio.servicio.RolHasUsuarioService;
import com.colegio.servicio.RolService;
import com.colegio.servicio.UsuarioServicio;



@Controller
public class RolUsuarioController {
	
	
	@Autowired
	private RolService rolService;
	
	@Autowired
	private UsuarioServicio usuarioServicio;
	
	@Autowired
	private RolHasUsuarioService rolHasUsuarioService;
	
	@RequestMapping("/cargaTodosUsuario")
	@ResponseBody
	public List<Usuario> cargaUsuario() {
		return usuarioServicio.listarTodos();
	}
	
	@RequestMapping("/cargaTodosRol")
	@ResponseBody
	public List<Rol> cargaRol() {
		return rolService.listarTodos();
	}
	
	
	@RequestMapping("/cargaUsuarioPorRol")
	@ResponseBody
	public List<Rol> cargaUsuarioPorRolint(int idUsuario) {
		return rolService.listaTodosPorUsuario(idUsuario);
	}
	
	@RequestMapping("/agregarUnUsuarioPorRol")
	@ResponseBody
	public List<Rol> agregarUnUsuarioPorRol( int idRol,int idUsuario) {
		UsuarioHasRolPK pk = new UsuarioHasRolPK();
		pk.setIdUsuario(idUsuario);
		pk.setIdRol(idRol);
		
		UsuarioHasRol obj = new UsuarioHasRol();
		obj.setUsuarioHasRolPk(pk);
		
		rolHasUsuarioService.inserta(obj);
		return rolService.listaTodosPorUsuario(idUsuario);
	}
	
	@RequestMapping("/eliminaUnUsuarioPorRol")
	@ResponseBody
	public List<Rol> eliminaUnUsuarioPorRol(int idRol, int idUsuario) {
		UsuarioHasRolPK pk = new UsuarioHasRolPK();
		pk.setIdUsuario(idUsuario);
		pk.setIdRol(idRol);
		
		UsuarioHasRol obj = new UsuarioHasRol();
		obj.setUsuarioHasRolPk(pk);
		
		rolHasUsuarioService.elimina(obj);
		return rolService.listaTodosPorUsuario(idUsuario);
	}
	
	@RequestMapping("/agregarTodosUsuarioPorRol")
	@ResponseBody
	public List<Rol> agregarTodosUsuarioPorRol(int idUsuario) {
		
		List<Rol> lista = rolService.listaTodosPorUsuario(idUsuario);
		for (Rol x : lista) {
			UsuarioHasRolPK pk = new UsuarioHasRolPK();
			pk.setIdUsuario(idUsuario);
			pk.setIdRol(x.getIdRol());
			
			UsuarioHasRol obj = new UsuarioHasRol();
			obj.setUsuarioHasRolPk(pk);
			
			rolHasUsuarioService.elimina(obj);
		}
		
		List<Rol> todos = rolService.listarTodos();
		for (Rol x : todos) {
			UsuarioHasRolPK pk = new UsuarioHasRolPK();
			pk.setIdUsuario(idUsuario);
			pk.setIdRol(x.getIdRol());
			
			UsuarioHasRol obj = new UsuarioHasRol();
			obj.setUsuarioHasRolPk(pk);
			
			rolHasUsuarioService.inserta(obj);
		}
		
		return todos;
	}
	
	@RequestMapping("/eliminarTodosUsuarioPorRol")
	@ResponseBody
	public List<Rol> eliminarTodosInvestigacionPorAutor(int idUsuario) {
		
		List<Rol> lista = rolService.listaTodosPorUsuario(idUsuario);
		for (Rol x : lista) {
			UsuarioHasRolPK pk = new UsuarioHasRolPK();
			pk.setIdUsuario(idUsuario);
			pk.setIdRol(x.getIdRol());
			
			UsuarioHasRol obj = new UsuarioHasRol();
			obj.setUsuarioHasRolPk(pk);
			
			rolHasUsuarioService.elimina(obj);
		}
		
		return new ArrayList<Rol>();
	}
		
}
