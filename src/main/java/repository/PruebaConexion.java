package repository;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class PruebaConexion {
	public static void main(String[] args) {
		Connection cn = null;
		Statement stm = null;
		ResultSet rs = null;
		try {
			cn=Conexion.conectar();
			stm = cn.createStatement();
			rs=stm.executeQuery("select * from intell.empleados");
			while(rs.next()) {
				System.out.print(rs.getString(1));
				System.out.print(", "+rs.getString(2));
				System.out.print(", "+rs.getString(3));
				System.out.print(", "+rs.getString(4));
				System.out.print(", "+rs.getInt(5));
				System.out.print(", "+rs.getString(6));
				System.out.print(", "+rs.getString(7));
				System.out.print(", "+rs.getString(8));
				System.out.print(", "+rs.getDate(9)+"\n");
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
					cn.close();
				}
			}catch(Exception e) {
				System.out.println("Error al cerrar: " + e.getMessage());
			}
		}
	}
}
