package model;

import java.time.LocalDate;

public class Asignacion {
	
	private int id_asignacion;
	private int idEmpleado;
	private LocalDate fch_inicio;
	private LocalDate fch_fin;
	private String nombreAsignacion;
	private String detalle;
	private int id_req;
	private int id_caso;
	private int horas;
	
	public Asignacion() {
		this.setId_asignacion(-1);
		this.setIdEmpleado(-1);
		this.setFch_inicio(null);
		this.setFch_fin(null);
		this.setNombreAsignacion(null);
		this.setDetalle(null);
		this.setId_req(-1);
		this.setId_caso(-1);
		this.setHoras(-1);
	}

	public Asignacion(int id_asignacion, int idEmpleado, LocalDate fch_inicio, LocalDate fch_fin,
			String nombreAsignacion, String detalle, int id_req, int id_caso,int horas) {
		this.setId_asignacion(id_asignacion);
		this.setIdEmpleado(idEmpleado);
		this.setFch_inicio(fch_inicio);
		this.setFch_fin(fch_fin);
		this.setNombreAsignacion(nombreAsignacion);
		this.setDetalle(detalle);
		this.setId_req(id_req);
		this.setId_caso(id_caso);
		this.setHoras(horas);
	}

	public int getId_asignacion() {
		return id_asignacion;
	}

	public void setId_asignacion(int id_asignacion) {
		this.id_asignacion = id_asignacion;
	}

	public int getIdEmpleado() {
		return idEmpleado;
	}

	public void setIdEmpleado(int idEmpleado) {
		this.idEmpleado = idEmpleado;
	}

	public LocalDate getFch_inicio() {
		return fch_inicio;
	}

	public void setFch_inicio(LocalDate fch_inicio) {
		this.fch_inicio = fch_inicio;
	}

	public LocalDate getFch_fin() {
		return fch_fin;
	}

	public void setFch_fin(LocalDate fch_fin) {
		this.fch_fin = fch_fin;
	}

	public String getNombreAsignacion() {
		return nombreAsignacion;
	}

	public void setNombreAsignacion(String nombreAsignacion) {
		this.nombreAsignacion = nombreAsignacion;
	}

	public String getDetalle() {
		return detalle;
	}

	public void setDetalle(String detalle) {
		this.detalle = detalle;
	}

	public int getId_req() {
		return id_req;
	}

	public void setId_req(int id_req) {
		this.id_req = id_req;
	}

	public int getId_caso() {
		return id_caso;
	}

	public void setId_caso(int id_caso) {
		this.id_caso = id_caso;
	}

	public int getHoras() {
		return horas;
	}

	public void setHoras(int horas) {
		this.horas = horas;
	}

}
