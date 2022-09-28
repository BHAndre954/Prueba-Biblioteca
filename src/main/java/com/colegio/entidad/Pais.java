package com.colegio.entidad;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "pais")
public class Pais {

	@Id
	private Integer idPais;
	private String iso;
	private String nombre;

}
