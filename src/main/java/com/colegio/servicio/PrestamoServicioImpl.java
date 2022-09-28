package com.colegio.servicio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.colegio.entidad.Prestamo;
import com.colegio.repositorio.PrestamoRepositorio;


@Service
public class PrestamoServicioImpl implements PrestamoServicio{

	@Autowired
	private PrestamoRepositorio prestamoRepositorio;
	
	
	@Override
	public Prestamo insertaPrestamo(Prestamo obj) {
		return prestamoRepositorio.save(obj);
	}
}
