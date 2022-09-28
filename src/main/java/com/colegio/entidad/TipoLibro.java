package com.colegio.entidad;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "tipoLibro")
public class TipoLibro {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "idTipoLibro")
	private Integer idTipoLibro;
	
	@Column(name = "nombre")
	private String nombre;
	
	@Column(name = "estado")
	private String estado;
}





