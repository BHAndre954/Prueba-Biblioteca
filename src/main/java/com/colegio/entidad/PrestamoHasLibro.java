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
@Table(name = "prestamo_has_libro")
public class PrestamoHasLibro {

	@EmbeddedId
	private PrestamoHasLibroPK prestamoHasLibroPK;
	
	@ManyToOne
	@JoinColumn(name = "idPrestamo", nullable = false, insertable = false,updatable = false)
	private Prestamo prestamo;
	
	@ManyToOne
	@JoinColumn(name = "idLibro", nullable = false, insertable = false,updatable = false)
	private Libro libro;
	

}

