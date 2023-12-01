package model;

public class Requerimiento {
	
	private int id_req;
	private String folio;
	private String detalle;
	
	public Requerimiento() {
		this.id_req=-1;
		this.folio=null;
		this.detalle=null;
	}
	
	public Requerimiento(int id_req, String folio, String detalle) {
		this.id_req=id_req;
		this.folio=folio;
		this.detalle=detalle;
	}
	public int getId_req() {
		return id_req;
	}
	public void setId_req(int id_req) {
		this.id_req = id_req;
	}
	public String getFolio() {
		return folio;
	}
	public void setFolio(String folio) {
		this.folio = folio;
	}
	public String getDetalle() {
		return detalle;
	}
	public void setDetalle(String detalle) {
		this.detalle = detalle;
	}

}
