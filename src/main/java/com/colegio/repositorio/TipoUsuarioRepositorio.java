package com.colegio.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;

import com.colegio.entidad.TipoUsuario;

public interface TipoUsuarioRepositorio extends JpaRepository<TipoUsuario, Integer> {

}