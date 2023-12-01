package repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {

	private static String usuario = "root";
	private static String contrasena = "andresgdl2001";
	private static String url = "jdbc:mysql://localhost:3306/intell";

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
}

