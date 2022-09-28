package com.colegio.servicio;

import java.util.List;

import com.colegio.entidad.Rol;

public interface RolService {
	
	public abstract List<Rol> listarTodos();
	public abstract List<Rol> listaTodosPorUsuario(int idUsuario);
}
