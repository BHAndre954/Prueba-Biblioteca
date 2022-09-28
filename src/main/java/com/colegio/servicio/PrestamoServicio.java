package com.colegio.servicio;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.colegio.entidad.Libro;
import com.colegio.entidad.Prestamo;


public interface PrestamoServicio {
	//METODO USADO POR KATH
	public abstract Prestamo insertaPrestamo(Prestamo obj);
	
}
