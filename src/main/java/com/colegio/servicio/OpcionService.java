package com.colegio.servicio;

import java.util.List;

import com.colegio.entidad.Opcion;

public interface OpcionService {
	
	public abstract List<Opcion> listaTodos();
	public abstract List<Opcion> listaTodosPorRol(int idRol);

}
