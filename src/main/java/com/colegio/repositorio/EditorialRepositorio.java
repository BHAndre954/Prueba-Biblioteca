package com.colegio.repositorio;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.colegio.entidad.Editorial;

public interface EditorialRepositorio extends JpaRepository<Editorial, Integer>{

	@Query("select e from Editorial e where e.nombre like :v_param")
	public abstract List<Editorial> listaPorNombre(@Param("v_param") String filtro);
}
