package com.colegio.repositorio;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.colegio.entidad.Opcion;
import com.colegio.entidad.Rol;
import com.colegio.entidad.Usuario;

public interface UsuarioRepositorio extends JpaRepository<Usuario, Integer> {

	@Query("Select x from Usuario x where x.login = :#{#usu.login} and x.password = :#{#usu.password}")
	public abstract Usuario login(@Param(value = "usu") Usuario bean);

	@Query("Select p from Opcion p, RolHasOpcion pr, Rol r, UsuarioHasRol u where "
			+ " p.idOpcion = pr.opcion.idOpcion and " + " pr.rol.idRol = r.idRol and " + " r.idRol = u.rol.idRol and "
			+ " u.usuario.idUsuario = :var_idUsuario")
	public abstract List<Opcion> traerEnlacesDeUsuario(@Param("var_idUsuario") int idUsuario);

	@Query("Select r from Rol r, UsuarioHasRol u where " + " r.idRol = u.rol.idRol and "
			+ " u.usuario.idUsuario = :var_idUsuario")
	public abstract List<Rol> traerRolesDeUsuario(@Param("var_idUsuario") int idUsuario);

	// REYES CrudUsuario
	//@Query("Select y from Usuario y where y.nombres like :ar_param")
	//public abstract List<Usuario> listaPorNombre(@Param("ar_param") String filtro);

	// RAMOS TRANSACCION PRESTAMOS

	@Query("Select y from Usuario y where y.nombres like :var_cliente")
	public abstract List<Usuario> listaPorNombre(@Param("var_cliente") String filtro);
	
	/*
	--@Query("Select y from Usuario y  where y.nombres like :var_cliente and where y.idTipoUsuario = :2")
	--@Query("Select y from Usuario y  where y.nombres like :var_cliente and where y.tipoUsuario.idTipoUsuario = :2")
	--@Query("Select y from Usuario y  where y.nombres like :var_cliente and where y.tipoUsuario.idTipoUsuario = 2")
	
	@Query("Select y from Usuario y  where y.nombres like :var_cliente and where y.tipoUsuario.idTipoUsuario = 2")
	public abstract List<Usuario> listaPorNombre(@Param("var_cliente") String filtro);
	

	*/
	//SILVA CONTRERAS SUYIN
	@Query("Select r from Usuario r, UsuarioHasRol u where  r.idUsuario = u.usuario.idUsuario and "
			+ " u.rol.idRol = :param")
	public abstract List<Usuario> listaTodosPorRol(@Param("param") int idRol);

	
	
	
	
	
}
