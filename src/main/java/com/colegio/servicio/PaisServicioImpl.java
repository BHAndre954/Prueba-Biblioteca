package com.colegio.servicio;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.colegio.entidad.Pais;
import com.colegio.repositorio.PaisRepositorio;

@Service
public class PaisServicioImpl implements PaisServicio{

	@Autowired
	private PaisRepositorio repositorio;

	@Override
	public List<Pais> listarTodosPaises() {
		return repositorio.findAll();
	}	

}
