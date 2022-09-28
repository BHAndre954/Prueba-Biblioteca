package com.colegio.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.colegio.entidad.Rol;
import com.colegio.repositorio.RolRepository;

@Service
public class RolServiceImpl implements RolService{
	
	@Autowired
	private RolRepository repository;
	
	@Override
	public List<Rol> listarTodos() {
		return repository.findAll();
	}

	@Override
	public List<Rol> listaTodosPorUsuario(int idUsuario) {
		
		return repository.listaTodosPorUsuario(idUsuario);
	}

}
