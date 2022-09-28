package com.colegio.servicio;

import java.util.List;

import com.colegio.entidad.Opcion;
import com.colegio.repositorio.OpcionRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OpcionServiceImpl implements OpcionService {
	
	@Autowired
	private OpcionRepository repository;


	@Override
	public List<Opcion> listaTodos() {
		return repository.findAll();
	}


	@Override
	public List<Opcion> listaTodosPorRol(int idRol) {
		return repository.listaTodosPorRol(idRol);
	}

}
