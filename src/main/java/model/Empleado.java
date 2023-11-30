package model;

import java.time.LocalDate;
import java.time.Period;

public class Empleado {

	private String nombreCompleto,nombreUsuario,contrasena,sexo,correo,telefono;
	private int edad,idEmpleado;
	private LocalDate fechaNacimiento;

	public Empleado() {
		this.nombreCompleto=null;
		this.nombreUsuario=null;
		this.contrasena=null;
		this.sexo=null;
		this.edad=-1;
		this.idEmpleado=-1;
		this.fechaNacimiento=null;
		this.correo=null;
		this.telefono=null;
	}

	public Empleado(String nombreCompleto, String nombreUsuario, String contrasena, String sexo, int edad, int idEmpleado, LocalDate fechaNacimiento, String correo, String telefono) {
		this.nombreCompleto=nombreCompleto;
		this.nombreUsuario=nombreUsuario;
		this.contrasena=contrasena;
		this.sexo=sexo;
		this.edad=edad;
		this.idEmpleado=idEmpleado;
		this.fechaNacimiento = fechaNacimiento;
		this.correo = correo;
		this.telefono=telefono;
	}

	public String getNombreCompleto() {
		return nombreCompleto;
	}
	public void setNombreCompleto(String nombreCompleto) {
		this.nombreCompleto = nombreCompleto;
	}
	public String getNombreUsuario() {
		return nombreUsuario;
	}
	public void setNombreUsuario(String nombreUsuario) {
		this.nombreUsuario = nombreUsuario;
	}
	public String getContrasena() {
		return contrasena;
	}
	public void setContrasena(String contrasena) {
		this.contrasena = contrasena;
	}
	public String getSexo() {
		return sexo;
	}
	public void setSexo(String sexo) {
		this.sexo = sexo;
	}
	public void setEdad(int edad) {
		this.edad = edad;
	}
	public int getIdEmpleado() {
		return idEmpleado;
	}
	public void setIdEmpleado(int idEmpleado) {
		this.idEmpleado = idEmpleado;
	}

	public int getEdad() {
		if (fechaNacimiento != null) {
			LocalDate currentDate = LocalDate.now();
			this.edad = Period.between(fechaNacimiento, currentDate).getYears();
		} else {
			this.edad=-1;
		}
		return this.edad;
	}

	public LocalDate getFechaNacimiento() {
		return fechaNacimiento;
	}

	public void setFechaNacimiento(LocalDate fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}

	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
}