package com.colegio.entidad;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "autor_has_libro")
public class AutorHasLibro {

	@EmbeddedId
	private AutorHasLibroPK autorHasLibroPK;
	
	@ManyToOne
	@JoinColumn(name = "idAutor", nullable = false, insertable = false,updatable = false)
	private Autor autor;
	
	@ManyToOne
	@JoinColumn(name = "idLibro", nullable = false, insertable = false,updatable = false)
	private Libro libro;
	
}

