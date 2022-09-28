package com.colegio.servicio;

import com.colegio.entidad.UsuarioHasRol;

public interface RolHasUsuarioService {
	
	public UsuarioHasRol inserta(UsuarioHasRol obj);
	public void elimina(UsuarioHasRol obj);

}
