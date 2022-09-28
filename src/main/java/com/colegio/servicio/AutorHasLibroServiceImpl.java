package com.colegio.servicio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.colegio.entidad.AutorHasLibro;
import com.colegio.repositorio.AutorHasLibroRepository;

@Service
public class AutorHasLibroServiceImpl implements AutorHasLibroService{

	@Autowired
	private AutorHasLibroRepository repository;

	@Override
	public AutorHasLibro inserta(AutorHasLibro obj) {
		return repository.save(obj);
	}

	@Override
	public void elimina(AutorHasLibro obj) {
		repository.delete(obj);
	}
	
	
}
