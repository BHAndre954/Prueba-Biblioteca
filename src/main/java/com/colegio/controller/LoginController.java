package com.colegio.controller;

import java.util.ArrayList;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.SetFactoryBean;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.mapping.AccessOptions.GetOptions.GetNulls;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.colegio.entidad.Libro;
import com.colegio.entidad.Mensaje;
import com.colegio.entidad.Opcion;
import com.colegio.entidad.Pais;
import com.colegio.entidad.Prestamo;
import com.colegio.entidad.PrestamoHasLibro;
import com.colegio.entidad.PrestamoHasLibroPK;
import com.colegio.entidad.Rol;
import com.colegio.entidad.Seleccion;
import com.colegio.entidad.Usuario;
import com.colegio.servicio.LibroServicio;
import com.colegio.servicio.PaisServicio;
import com.colegio.servicio.PrestamoServicio;
import com.colegio.servicio.UsuarioServicio;
@Controller
public class LoginController {

	@Autowired
	private UsuarioServicio servicio;

	@Autowired
	private PaisServicio pa_serv;
	

	

	@RequestMapping("/verLogin")
	public String verLogin() { return "login"; }
	
	@RequestMapping("/verIntranetHome")
	public String verHome() { return "intranetHome"; }

	


	@RequestMapping("/registraAutor")
	public String regAutor(Model model) { 
		List<Pais> tem= pa_serv.listarTodosPaises();
		model.addAttribute("objPais", tem);
		return "intranetRegistraAutor"; }
	
	@RequestMapping("/registraLibro")
	public String regLibro() { return "intranetRegistraLibro"; }
	
	@RequestMapping("/registraEditorial")
	public String regEditorial(Model model) { 
		List<Pais> tem= pa_serv.listarTodosPaises();
		model.addAttribute("objPais", tem);
		return "intranetRegistraEditorial"; }
	

	
	@RequestMapping("/registraUsuario")
	public String regUsuario() { return "intranetRegistraUsuario"; }
	
	
	@RequestMapping("/crudAutor")
	public String crudAutor() { return "crudAutor"; }
	

	
	@RequestMapping("/crudEditorial")
	public String crudEditorial(Model model) { 
		List<Pais> tem= pa_serv.listarTodosPaises();
		model.addAttribute("objPais", tem);
         return "crudEditorial"; }
	
	@RequestMapping("/crudLibro")
	public String crudLibro() { return "crudLibro"; }
	
	@RequestMapping("/crudUsuario")
	public String crudUsuario() { return "crudUsuario"; }
	
	
	
	
	@RequestMapping("/enlaceConsultaAutor")
	public String enlaceConsultaAutor() { return "intranetConsultaAutor"; }

	
	@RequestMapping("/enlaceConsultaLibro")
	public String enlaceConsultaLibro() { return "intranetConsultaLibro"; }

	
	@RequestMapping("/enlaceConsultaEditorial")
	public String enlaceConsultaEditorial() { return "intranetConsultaEditorial"; }

	
	

	
	
	
	//@RequestMapping("/enlaceTransaccionPrestamo")
	//public String enlaceTransaccionPrestamo() { return "intranetTransaccionPrestamo"; }

	@RequestMapping("/enlaceTransaccionAutoresDeLibro")
	public String enlaceTransaccionAutoresDeLibro() { return "intranetTransaccionAutoresDeLibro"; }

	@RequestMapping("/enlaceTransaccionRolesDeUsuario")
	public String enlaceTransaccionRolesDeUsuario() { return "intranetTransaccionRolesDeUsuario"; }

	@RequestMapping("/enlaceTransaccionOpcionesDeRol")
	public String enlaceTransaccionOpcionesDeRol() { return "intranetTransaccionOpcionesDeRol"; }

	

	

	
	//ESTA ES MI PARTE QUE YO USO DE TRANSACCIÓN (kath)------------------------------
	
	@Autowired
	private LibroServicio libroservicio;
	
	@Autowired
	private PrestamoServicio prestamoServicio;
	
	private List<Seleccion> seleccionados = new ArrayList<Seleccion>();

	@RequestMapping("/enlaceTransaccionPrestamo")
	public String enlaceTransaccionPrestamo() { 
		return "intranetTransaccionPrestamo"; 
		}

	@RequestMapping("cargaCliente")
	@ResponseBody
	public List<Usuario> listarPorNombre(String filtro){
		return servicio.listarPorNombre(filtro + "%");
	}
	
	//LISTA PARA LOS LIBROS SELECCIONADOS 
	@RequestMapping("listaSeleccion")
	@ResponseBody
	 public List<Seleccion> lista(){
		 return seleccionados;
	 }
	
	//ELIMINA SELECCION 
	@RequestMapping("eliminaSeleccion")
	@ResponseBody
	 public List<Seleccion> eliminar(int idLibro){
		for (Seleccion x : seleccionados) {
			if(x.getIdLibro() == idLibro) {
				seleccionados.remove(x);
				break;
			}
		}
		 return seleccionados;
	 }
	
	//AGREGA SELECCIÓN  
	@RequestMapping("agregarSeleccion")
	@ResponseBody
	 public List<Seleccion> agregar(Seleccion obj){
		seleccionados.add(obj);
		 return seleccionados;
	 }

	

	@RequestMapping("cargaProducto")
	@ResponseBody
	public List<Libro> traerLibroXTitulo(String filtro){
		//los parametros de paginacion 
		int page= 0;
		int size= 10;
		Pageable paginacion= PageRequest.of(page, size);
		return libroservicio.traerLibroXTitulo(filtro + "%", paginacion);
	}

	
	
	@RequestMapping("/registraBoleta")
	@ResponseBody
	public Mensaje registra(Usuario objUsu) {
		Usuario objUsuario = new Usuario();
		objUsuario.setIdUsuario(1);

		List<PrestamoHasLibro> detalles = new ArrayList<PrestamoHasLibro>();
		for (Seleccion x : seleccionados) {
			PrestamoHasLibroPK pk = new PrestamoHasLibroPK();
			pk.setIdLibro(x.getIdLibro());
			PrestamoHasLibro phb = new PrestamoHasLibro();
		//	Prestamo phb = new Prestamo();
			////phb.setLibro(x.getLibro();
				phb.setPrestamoHasLibroPK(pk);

			detalles.add(phb);
		}
	//	Libro objlibro = new Libro();
		Prestamo objBoleta = new Prestamo();
		objBoleta.setUsuario(objUsuario);
		objBoleta.setDetallesPrestamo(detalles);
		objBoleta.setFechaPrestamo(new Date());
		//objBoleta.getFechaPrestamo();
		objBoleta.setFechaDevolucion(new Date());
		objBoleta.setFechaEntrega(new Date());
		objBoleta.setFechaRegistro(new Date());
		//objBoleta.setEstado(objBoleta.getEstado());
	    objBoleta.setEstado("Prestado");
		//objBoleta.setEstado(objUsuario);
		
		Prestamo objIns = prestamoServicio.insertaPrestamo(objBoleta);
		String salida = "-1";

		if (objIns != null) {
			salida = "Se generó la boleta con código N° : " + objIns.getIdPrestamo() + "<br><br>";
			salida += "Alumno: " + objIns.getUsuario().getNombres() + "<br><br>";
			salida += "<table class=\"table\"><tr><td>IDLibro</td><td>Libro</td><td>Fecha Prestamo</td><td>Fecha Devolución</td><td>Fecha Entrega</td><td>Fecha Registro</td><td>Estado</td></tr>";
		   // double monto = 0;
			for (Seleccion x : seleccionados) {
				salida += "<tr><td>" + x.getIdLibro() + "</td><td>" + x.getTitulo() + "</td><td>" + x.getFechaPrestamo()
						+ "</td><td>" + x.getFechaDevolucion() + "</td><td>" + x.getFechaEntrega() + "</td><td>" + x.getFechaRegistra() + "</td><td>" + x.getEstado() + "</td></tr>";
			//	monto += x.getfe * x.getPrecio();
			}
			salida += "</table><br>";
		//	salida += "Monto a pagar : " + monto;

			seleccionados.clear();
		}

		Mensaje objMensaje = new Mensaje();
		objMensaje.setTexto(salida);

		return objMensaje;
	}
	
	
	
	
	// HASTA AQUI LLEGA LO QUE UTILIZO (KATH)----------------------------------------------------
	
	
	
	
	@RequestMapping("/login")
	public String login(Usuario usu, HttpSession  session, HttpServletRequest request) {
		
		Usuario objUsu = servicio.login(usu);
		if(objUsu == null) {
			request.setAttribute("mensaje", "El usuario no existe");
			return "login";
		}else {
			List<Rol> roles = servicio.traerRolesDeUsuario(objUsu.getIdUsuario());
			List<Opcion> menus = servicio.traerEnlacesDeUsuario(objUsu.getIdUsuario());
			
			session.setAttribute("objUsuario", objUsu);
			session.setAttribute("objRoles", roles);
			session.setAttribute("objMenus", menus);
			return "redirect:home";
		}
	}
	
	@RequestMapping("/home")
	public String salida() {
		return "intranetHome";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
		//Destruir todos los objetos de la sesion mediante programación
		session.invalidate();

		response.setHeader("Cache-control", "no-cache");
		response.setHeader("Expires", "0");
		response.setHeader("Pragma", "no-cache");

		request.setAttribute("mensaje", "El usuario salió de sesión");
		return "login";

	}

}
