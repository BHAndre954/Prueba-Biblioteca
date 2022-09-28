package com.colegio.entidad;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "libro")
public class Libro {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "idLibro")
	private Integer idLibro;
	
	@Column(name = "codigo")
	private String codigo;
	
	@Column(name = "titulo")
	private String titulo;
	
	@Column(name = "estado")
	private String estado;
	
	@Column(name = "tipo")
	private String tipo;

	@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idTipoLibro")
	private TipoLibro tipoLibro;
	


}
