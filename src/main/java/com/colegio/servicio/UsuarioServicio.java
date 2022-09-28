package com.colegio.servicio;

import java.util.List;
import java.util.Optional;

import com.colegio.entidad.Opcion;
import com.colegio.entidad.Rol;
import com.colegio.entidad.Usuario;

public interface UsuarioServicio {

	public abstract Usuario login(Usuario bean);

	public abstract List<Opcion> traerEnlacesDeUsuario(int idUsuario);

	public abstract List<Rol> traerRolesDeUsuario(int idUsuario);

	public abstract Usuario insertaActualizaUsuario(Usuario obj);

	public abstract void eliminaUsuario(int id);

	public abstract List<Usuario> listarTodos();

	public abstract List<Usuario> listarPorNombre(String filtro);

	public abstract Optional<Usuario> buscaPorId(int id);
	
	public abstract List<Usuario> listaTodosPorRol(int idUsuario);

	
}