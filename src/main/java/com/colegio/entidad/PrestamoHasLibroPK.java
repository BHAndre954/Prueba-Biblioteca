package com.colegio.entidad;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Embeddable
public class PrestamoHasLibroPK implements Serializable{

	private static final long serialVersionUID = 1L;

	@Column(name = "idPrestamo", unique = true, nullable = false, length = 10, insertable = true, updatable = false)
	private int idPrestamo;

	@Column(name = "idLibro", unique = true, nullable = false, length = 10, insertable = true, updatable = false)
	private int idLibro;
}
