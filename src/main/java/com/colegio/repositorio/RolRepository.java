package com.colegio.repositorio;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.colegio.entidad.Rol;

public interface RolRepository extends JpaRepository<Rol, Integer>{
	
	@Query("select r from Rol r where r.nombre like :var_parm")
	public abstract List<Rol> listaPorNombre(@Param("var_parm") String nombre);
	
	//SILVA CONTRERAS SUYIN
	@Query("Select r from Rol r, UsuarioHasRol u where  r.idRol = u.rol.idRol and "
			+ " u.usuario.idUsuario = :param")
	public abstract List<Rol> listaTodosPorUsuario(@Param("param") int idUsuario);

	

}
