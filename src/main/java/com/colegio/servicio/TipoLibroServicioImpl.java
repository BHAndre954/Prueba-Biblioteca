package com.colegio.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.colegio.entidad.TipoLibro;
import com.colegio.repositorio.TipoLibroRepositorio;

@Service
public class TipoLibroServicioImpl implements TipoLibroServicio{

	@Autowired
	private TipoLibroRepositorio repositorio;

	@Override
	public List<TipoLibro> traerTipoLibros() {return repositorio.findAll();}
}
