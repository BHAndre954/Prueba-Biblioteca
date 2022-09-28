package com.colegio.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.colegio.entidad.Usuario;
import com.colegio.entidad.TipoUsuario;
import com.colegio.servicio.UsuarioServicio;
import com.colegio.servicio.TipoUsuarioServicio;

@Controller
public class UsuarioController {

	@Autowired
	private UsuarioServicio usuario_servicio;

	@Autowired
	private TipoUsuarioServicio tipousuario_servicio;



	@RequestMapping("/cargatipousuario")
	@ResponseBody
	public List<TipoUsuario> listatipousuario() {
		return tipousuario_servicio.listarTodosUser();
	}

	@RequestMapping("/consultaCrudUsuario")
	public String lista(String filtro, HttpSession session) {
		List<Usuario> lista = usuario_servicio.listarPorNombre(filtro + "%");
		session.setAttribute("usuarios", lista);
		return "crudUsuario";
	}

	@RequestMapping("/registraActualizaCrudUsuario")
	public String registraActualiza(Usuario obj, HttpSession session) {
		try {
			Usuario ale = usuario_servicio.insertaActualizaUsuario(obj);
			if (ale == null) {
				session.setAttribute("MENSAJE", "Existe ERROR");
			} else {
				session.setAttribute("MENSAJE", "Se registro o actualizo correctamente");
			}
		} catch (Exception e) {
			session.setAttribute("MENSAJE", "Existe ERROR");
			e.printStackTrace();
		}
		return "redirect:salidaUsuario";
	}

	@RequestMapping("/eliminaCrudUsuario")
	public String elimina(int id, HttpSession session) {

		try {
			Optional<Usuario> obj = usuario_servicio.buscaPorId(id);
			if (obj.isPresent()) {
				usuario_servicio.eliminaUsuario(id);
				session.setAttribute("MENSAJE", "Se elimino correctamente");
			} else {
				session.setAttribute("MENSAJE", "No existe el ID");
			}
		} catch (Exception e) {
			session.setAttribute("MENSAJE", "Existe ERROR");
			e.printStackTrace();
		}
		return "redirect:salidaUsuario";
	}

	@RequestMapping("/salidaUsuario")
	public String listTodos(HttpSession session) {
		List<Usuario> data = usuario_servicio.listarTodos();
		session.setAttribute("usuarios", data);
		return "crudUsuario";
	}

}
