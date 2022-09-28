package com.colegio.servicio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.colegio.entidad.RolHasOpcion;
import com.colegio.repositorio.RolHasOpcionRepository;


@Service
public class RolHasOpcionServiceImpl implements RolHasOpcionService {
	
	@Autowired
	private RolHasOpcionRepository repository;

	@Override
	public RolHasOpcion inserta(RolHasOpcion obj) {
		return repository.save(obj);
	}

	@Override
	public void elimina(RolHasOpcion obj) {
		repository.delete(obj);
	}

}
