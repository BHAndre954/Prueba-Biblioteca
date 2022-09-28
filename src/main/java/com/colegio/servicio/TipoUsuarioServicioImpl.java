package com.colegio.servicio;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.colegio.entidad.TipoUsuario;
import com.colegio.repositorio.TipoUsuarioRepositorio;

@Service
public class TipoUsuarioServicioImpl implements TipoUsuarioServicio{

	@Autowired
	private TipoUsuarioRepositorio repositorio;

	@Override
	public List<TipoUsuario> listarTodosUser() {
		return repositorio.findAll();
	}
	
}