package model;

import java.time.LocalDateTime;

public class Retroalimentacion {
	
	private String comentario;
	private String estadoAnterior;
	private String estadoNuevo;
	private LocalDateTime fecha;
	
	public Retroalimentacion() {
		this.setComentario(null);
		this.setEstadoAnterior("backlog");
		this.setEstadoNuevo("backlog");
		this.setFecha(null);
	}

	public Retroalimentacion(String comentario, String estadoAnterior, String estadoNuevo, LocalDateTime fecha) {
		this.setComentario(comentario);
		this.setEstadoAnterior(estadoAnterior);
		this.setEstadoNuevo(estadoNuevo);
		this.setFecha(fecha);
	}

	public String getComentario() {
		return comentario;
	}

	public void setComentario(String comentario) {
		this.comentario = comentario;
	}

	public String getEstadoAnterior() {
		return estadoAnterior;
	}

	public void setEstadoAnterior(String estadoAnterior) {
		this.estadoAnterior = estadoAnterior;
	}

	public String getEstadoNuevo() {
		return estadoNuevo;
	}

	public void setEstadoNuevo(String estadoNuevo) {
		this.estadoNuevo = estadoNuevo;
	}

	public LocalDateTime getFecha() {
		return fecha;
	}

	public void setFecha(LocalDateTime fecha) {
		this.fecha = fecha;
	}

}
