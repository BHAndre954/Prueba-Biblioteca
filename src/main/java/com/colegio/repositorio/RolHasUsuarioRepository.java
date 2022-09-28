package com.colegio.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;

import com.colegio.entidad.UsuarioHasRol;

public interface RolHasUsuarioRepository extends JpaRepository<UsuarioHasRol, Integer>{
	

}
