package com.colegio.servicio;


import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.colegio.entidad.Autor;
import com.colegio.repositorio.AutorRepository;


@Service
public class AutorServiceImpl implements AutorService{

	@Autowired
	private AutorRepository repositorio;

	@Override
	public int registrarAutor(Autor e) {
		repositorio.save(e);
		return 0;
	}

	@Override
	public Autor insertaActualizaModalidad(Autor obj) {
		return repositorio.save(obj);
	}

	@Override
	public void eliminaAutor(int id) {
		repositorio.deleteById(id);
		
	}

	@Override
	public List<Autor> listarTodos() {
		return repositorio.findAll();
	}

	@Override
	public List<Autor> listarPorNombre(String filtro) {
		return repositorio.listaPorNombre(filtro);
	}

	@Override
	public Optional<Autor> buscaPorId(int id) {
		return repositorio.findById(id);
	}

	@Override
	public List<Autor> listarPorPais(int idPais) {
		return repositorio.listaPorPais(idPais);
	}

}
