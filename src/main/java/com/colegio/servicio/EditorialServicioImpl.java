package com.colegio.servicio;


import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.colegio.entidad.Editorial;

import com.colegio.repositorio.EditorialRepositorio;

@Service
public class EditorialServicioImpl implements EditorialServicio{

	@Autowired
	private EditorialRepositorio repositorio;

	@Override
	public int registrarEditorial(Editorial e) {
		repositorio.save(e);
		return 0;
	}

	@Override
	public Editorial insertaActualizaModalidad(Editorial obj) {
		return repositorio.save(obj);
	}

	@Override
	public void eliminaEditorial(int id) {
		repositorio.deleteById(id);
	}

	@Override
	public List<Editorial> listarTodos() {
		return repositorio.findAll();
	}

	@Override
	public List<Editorial> listarPorNombre(String filtro) {
		return repositorio.listaPorNombre(filtro);
	}

	@Override
	public Optional<Editorial> buscaPorId(int id) {
		return repositorio.findById(id);
	}

}
