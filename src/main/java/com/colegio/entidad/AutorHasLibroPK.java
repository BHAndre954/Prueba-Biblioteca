package com.colegio.entidad;

import java.io.Serializable;

import javax.persistence.Embeddable;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Embeddable
public class AutorHasLibroPK implements Serializable{

	private static final long serialVersionUID = 1L;
	private Integer idAutor;
	private Integer idLibro;
}
