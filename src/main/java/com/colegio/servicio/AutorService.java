package com.colegio.servicio;

import java.util.List;
import java.util.Optional;

import com.colegio.entidad.Autor;

public interface AutorService {
	
	public int registrarAutor( Autor e);
	public abstract Autor insertaActualizaModalidad(Autor obj);
	public abstract void eliminaAutor(int id);
	public abstract List<Autor> listarTodos();
	public abstract List<Autor> listarPorNombre(String filtro);
	public abstract Optional<Autor> buscaPorId(int id);
	public abstract List<Autor> listarPorPais(int idPais);
	
}
