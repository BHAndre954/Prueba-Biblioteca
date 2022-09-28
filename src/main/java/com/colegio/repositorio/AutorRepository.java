package com.colegio.repositorio;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.colegio.entidad.Autor;

public interface AutorRepository extends JpaRepository<Autor,Integer>{

	@Query("select a from Autor a where a.nombres like :parametro")
	public abstract List<Autor> listaPorNombre(@Param("parametro") String filtro);
	
	@Query("Select x from Autor x where x.pais.idPais = :paramp")
	public abstract List<Autor> listaPorPais(@Param(value = "paramp")int idPais);
}
