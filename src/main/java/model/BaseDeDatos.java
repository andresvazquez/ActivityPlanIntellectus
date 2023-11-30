package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

public class BaseDeDatos {

	private static String usuario = "root";
	private static String contrasena = "andresgdl2001";
	private static String url = "jdbc:mysql://localhost:3306/evimc";


	public static Connection conectar(){
		Connection connection=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(url,usuario,contrasena);
			if (connection != null) {
				System.out.println("Conexión exitosa");
			} else {
				System.out.println("La conexión es nula. Verifica tu configuración.");
			}
		}catch(SQLException e) {
			System.out.println("Error de conexión: " + e.getMessage());
		}
		catch( ClassNotFoundException e) {
			System.out.println("Error de driver: " + e.getMessage());
			e.printStackTrace();
		}

		return connection;

	}

	public static void desconectar(Connection connection) {
		try {
			if (connection != null) {
				connection.close();
				System.out.println("Conexión cerrada exitosamente");
			}
		} catch (SQLException e) {
			System.out.println("Error al cerrar la conexión: " + e.getMessage());
		}
	}

	public static boolean validaCredenciales(String nombreUsuario, String contrasena) {
		Connection cn = null;
		Statement stm = null;
		ResultSet rs = null;
		try {
			cn= conectar();
			stm = cn.createStatement();
			rs=stm.executeQuery("select nombre_usuario, contrasena from intell.empleados;");
			while(rs.next()) {
				if(nombreUsuario.equals(rs.getString(1)) && contrasena.equals(rs.getString(2))){
					return true;
				}
			}
		}catch(SQLException e) {
			System.out.println("Error de conexión: " + e.getMessage());
		}catch(NullPointerException e) {
			System.out.println("Error de null pointer: " + e.getMessage());
		}finally {
			try {
				if(rs!=null) {
					rs.close();
				}
				if(stm!=null) {
					stm.close();
				}
				if(cn!=null) {
					desconectar(cn);
				}
			}catch(Exception e) {
				System.out.println("Error al cerrar: " + e.getMessage());
			}
		}
		return false;
	}

	public static Empleado obtenerEmpleadoPorNombre(String nombreUsuario) {
		Connection cn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int idEmpleado = -1; 
		String nombreCompleto = null;
		String contrasena = null;
		String sexo = null;
		LocalDate fechaNacimiento = null;
		String correo = null;
		String telefono = null;
		int edad = -1;
		Empleado empleado;
		try {
			cn = conectar();
			String query = "SELECT * FROM empleados WHERE nombre_usuario = ?";
			ps = cn.prepareStatement(query);
			ps.setString(1, nombreUsuario);
			rs = ps.executeQuery();
			if (rs.next()) {
				idEmpleado = rs.getInt("id_empleado");
				nombreCompleto = rs.getString("nombre_completo");
				contrasena = rs.getString("contrasena");
				edad = rs.getInt("edad");
				sexo = rs.getString("sexo");
				correo = rs.getString("correo");
				telefono = rs.getString("telefono");
				fechaNacimiento = rs.getObject("fecha_nacimiento", LocalDate.class);
			}
			empleado = new Empleado(nombreCompleto,nombreUsuario,contrasena,sexo,edad,idEmpleado,fechaNacimiento,correo,telefono);
		} catch (SQLException e) {
			System.out.println("Error al obtener el Empleado a partir del usuario: " + e.getMessage());
			empleado = new Empleado();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (cn != null) {
					desconectar(cn);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return empleado;
	}

	public static List<Asignacion> obtenerAsignacionesEmpleado(String nombreUsuario) {
		Connection cn = null;
		Statement stm = null;
		ResultSet rs = null;
		List<Asignacion> asignaciones = new ArrayList<>();
		int idEmpleado = obtenerEmpleadoPorNombre(nombreUsuario).getIdEmpleado();
		LocalDate fch_inicio = null;
		LocalDate fch_fin = null;
		String nombreAsignacion = null;
		String detalle = null;
		int id_asignacion = -1;
		int id_req = -1;
		int id_caso = -1;
		int horas =-1;
		if (idEmpleado != -1) {
			try {
				cn = conectar();
				stm = cn.createStatement();
				String query = "select * from intell.asignaciones where id_empleado = '" + idEmpleado + "'";
				rs = stm.executeQuery(query);
				while (rs.next()) {
					fch_inicio = rs.getObject("fch_inicio",LocalDate.class);
					fch_fin = rs.getObject("fch_fin",LocalDate.class);
					id_asignacion = rs.getInt("id_asignacion");
					id_req = rs.getInt("id_req");
					id_caso = rs.getInt("id_caso");
					detalle = rs.getString("detalle");
					horas =rs.getInt("horas");
					Asignacion asignacion = new Asignacion(id_asignacion, idEmpleado, fch_inicio, fch_fin,nombreAsignacion,detalle,id_req,id_caso,horas);
					asignaciones.add(asignacion);
				}
			} catch (SQLException e) {
				System.out.println("Error al obtener asignaciones del empleado: " + e.getMessage());
			} finally {
				try {
					desconectar(cn);
					stm.close();
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		} else {
			System.out.println("El empleado no existe en la tabla empleados.");
		}

		return asignaciones;
	}

	public static boolean realizarAsignacion(String nombreUsuario, LocalDate fch_inicio,LocalDate fch_fin, String nombre_asignacion, String detalle, int id_req,int id_caso) {
		Connection cn = null;
		PreparedStatement ps = null;
		int idEmpleado = obtenerEmpleadoPorNombre(nombreUsuario).getIdEmpleado();

		if (idEmpleado != -1) {
			try {
				cn = conectar();
				String query = "INSERT INTO intell.asignaciones (id_empleado, fch_inicio, fch_fin, nombre_asignacion, detalle, id_req, id_caso) VALUES (?, ?, ?, ?, ?, ?, ?)";
				ps = cn.prepareStatement(query);
				ps.setInt(1, idEmpleado);
				ps.setDate(2, java.sql.Date.valueOf(fch_inicio));
				ps.setDate(3, java.sql.Date.valueOf(fch_fin));
				ps.setString(4, nombre_asignacion);
				ps.setString(5, detalle);
				ps.setInt(6, id_req);
				ps.setInt(7, id_caso);
				int filasAfectadas = ps.executeUpdate();
				return filasAfectadas > 0;
			} catch (SQLException e) {
				System.out.println("Error al realizar asignación: " + e.getMessage());
			} finally {
				try {
					desconectar(cn);
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		} else {
			System.out.println("El empleado no existe en la tabla empleados.");
		}

		return false;
	}

	public static boolean realizarAsignacionExistente(String nombreUsuario, int id_asignacion) {
		Connection cn = null;
		Statement stm = null;
		int idEmpleado = obtenerEmpleadoPorNombre(nombreUsuario).getIdEmpleado();

		if (idEmpleado != -1) {
			try {
				cn = conectar();
				stm = cn.createStatement();
				String query = "UPDATE intell.asignaciones SET id_empleado = '" + idEmpleado + "' WHERE id_asignacion = '" + id_asignacion + "'";
				int filasAfectadas = stm.executeUpdate(query);
				return filasAfectadas > 0;
			} catch (SQLException e) {
				System.out.println("Error al realizar asignación existente: " + e.getMessage());
			} finally {
				try {
					if (stm != null) {
						stm.close();
					}
					desconectar(cn);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		} else {
			System.out.println("El empleado no existe en la tabla empleados.");
		}

		return false;
	}


	public static boolean registrarEmpleado(String nombreCompleto, String nombreUsuario, String contrasena, int edad, String sexo, String correo, String telefono, LocalDate fecha_nacimiento) {
		Connection cn = null;
		PreparedStatement ps = null;

		try {
			cn = conectar();
			String query = "INSERT INTO intell.empleados (nombre_completo, nombre_usuario, contrasena, edad, sexo, correo, telefono, fecha_nacimiento)  VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
			ps = cn.prepareStatement(query);
			ps.setString(1, nombreCompleto);
			ps.setString(2, nombreUsuario);
			ps.setString(3, contrasena);
			ps.setInt(4, edad);
			ps.setString(5, sexo);
			ps.setString(6, correo);
			ps.setString(7, telefono);
			ps.setDate(8, java.sql.Date.valueOf(fecha_nacimiento));
			int filasAfectadas = ps.executeUpdate();
			return filasAfectadas > 0;
		} catch (SQLException e) {
			System.out.println("Error al registrar empleado: " + e.getMessage());
		} finally {
			try {
				desconectar(cn);
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}


	public static boolean registrarRequerimiento(String folio, String detalle) {
		Connection cn = null;
		PreparedStatement ps = null;

		try {
			cn = conectar();
			String query = "INSERT INTO intell.requerimientos (folio, detalle) VALUES (?, ?)";
			ps = cn.prepareStatement(query);
			ps.setString(1, folio);
			ps.setString(2, detalle);
			int filasAfectadas = ps.executeUpdate();
			return filasAfectadas > 0;
		} catch (SQLException e) {
			System.out.println("Error al registrar requerimiento: " + e.getMessage());
		} finally {
			try {
				desconectar(cn);
				if (ps != null) {
					ps.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	public static boolean registrarCasoDeUso(String detalle) {
		Connection cn = null;
		PreparedStatement ps = null;

		try {
			cn = conectar();
			String query = "INSERT INTO intell.casosdeuso (detalle) VALUES (?)";
			ps = cn.prepareStatement(query);
			ps.setString(1, detalle);
			int filasAfectadas = ps.executeUpdate();
			return filasAfectadas > 0;
		} catch (SQLException e) {
			System.out.println("Error al registrar caso de uso: " + e.getMessage());
		} finally {
			try {
				desconectar(cn);
				if (ps != null) {
					ps.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}


	public static boolean registrarHorasTrabajadas(int id_asignacion, int horas) {
		Connection cn = null;
		PreparedStatement psAsignaciones = null;
		PreparedStatement psHorasTrabajadas = null;

		try {
			cn = conectar();
			cn.setAutoCommit(false);  // Deshabilitar la confirmación automática para transacción

			// Actualizar horas en la tabla asignaciones
			String queryAsignaciones = "UPDATE intell.asignaciones SET horas = horas + ? WHERE id_asignacion = ?";
			psAsignaciones = cn.prepareStatement(queryAsignaciones);
			psAsignaciones.setInt(1, horas);
			psAsignaciones.setInt(2, id_asignacion);
			int filasAfectadasAsignaciones = psAsignaciones.executeUpdate();

			// Insertar registro en la tabla horas_trabajadas
			String queryHorasTrabajadas = "INSERT INTO intell.horas_trabajadas (horas, fch_captura, id_asignacion) VALUES (?, ?, ?)";
			psHorasTrabajadas = cn.prepareStatement(queryHorasTrabajadas);
			psHorasTrabajadas.setInt(1, horas);
			psHorasTrabajadas.setTimestamp(2, Timestamp.valueOf(LocalDateTime.now()));
			psHorasTrabajadas.setInt(3, id_asignacion);
			int filasAfectadasHorasTrabajadas = psHorasTrabajadas.executeUpdate();

			// Confirmar la transacción
			cn.commit();
			cn.setAutoCommit(true);  // Restaurar la confirmación automática

			return filasAfectadasAsignaciones > 0 && filasAfectadasHorasTrabajadas > 0;
		} catch (SQLException e) {
			// Manejar errores y revertir la transacción si es necesario
			try {
				if (cn != null) {
					cn.rollback();
					cn.setAutoCommit(true);  // Restaurar la confirmación automática en caso de rollback
				}
			} catch (SQLException rollbackException) {
				rollbackException.printStackTrace();
			}

			System.out.println("Error al registrar horas trabajadas: " + e.getMessage());
		} finally {
			try {
				if (psAsignaciones != null) {
					psAsignaciones.close();
				}
				if (psHorasTrabajadas != null) {
					psHorasTrabajadas.close();
				}
				desconectar(cn);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	public static int obtenerHorasRegistradasEnRango(int id_asignacion, LocalDate fechaInicio, LocalDate fechaFin) {
		Connection cn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int totalHoras = 0;

		try {
			cn = conectar();
			String query = "SELECT horas FROM intell.horas_trabajadas WHERE id_asignacion = ? AND fch_captura BETWEEN ? AND ?";
			ps = cn.prepareStatement(query);
			ps.setInt(1, id_asignacion);
			ps.setTimestamp(2, Timestamp.valueOf(LocalDateTime.of(fechaInicio, LocalDateTime.MIN.toLocalTime())));
			ps.setTimestamp(3, Timestamp.valueOf(LocalDateTime.of(fechaFin, LocalDateTime.MAX.toLocalTime())));
			rs = ps.executeQuery();

			while (rs.next()) {
				totalHoras += rs.getInt("horas");
			}
		} catch (SQLException e) {
			System.out.println("Error al obtener horas registradas en rango: " + e.getMessage());
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (ps != null) {
					ps.close();
				}
				desconectar(cn);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return totalHoras;
	}

	public static int obtenerHorasRegistradasEnUltimoDia(int id_asignacion) {
		LocalDate fechaActual = LocalDate.now();
		LocalDate fechaInicio = fechaActual.minus(1, ChronoUnit.DAYS);
		return obtenerHorasRegistradasEnRango(id_asignacion, fechaInicio, fechaActual);
	}

	public static int obtenerHorasRegistradasEnUltimaSemana(int id_asignacion) {
		LocalDate fechaActual = LocalDate.now();
		LocalDate fechaInicio = fechaActual.minus(1, ChronoUnit.WEEKS);
		return obtenerHorasRegistradasEnRango(id_asignacion, fechaInicio, fechaActual);
	}

	public static int obtenerHorasRegistradasEnUltimoMes(int id_asignacion) {
		LocalDate fechaActual = LocalDate.now();
		LocalDate fechaInicio = fechaActual.minus(1, ChronoUnit.MONTHS);
		return obtenerHorasRegistradasEnRango(id_asignacion, fechaInicio, fechaActual);
	}


}
