package model;

public class CasoDeUso {
	private int id_caso;
	private String detalle;

	public CasoDeUso() {
		this.setId_caso(-1);
		this.setDetalle(null);
	}
	
	public CasoDeUso(int id_caso, String detalle) {
		this.setId_caso(id_caso);
		this.setDetalle(detalle);
	}

	public int getId_caso() {
		return id_caso;
	}

	public void setId_caso(int id_caso) {
		this.id_caso = id_caso;
	}

	public String getDetalle() {
		return detalle;
	}

	public void setDetalle(String detalle) {
		this.detalle = detalle;
	}
}
