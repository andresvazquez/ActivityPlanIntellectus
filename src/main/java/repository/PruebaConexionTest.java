package repository; 

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class PruebaConexionTest {

    @Before
    public void setUp() throws Exception {
    }

    @After
    public void tearDown() throws Exception {
    }

    @Test
    public void testConexion() {
        Connection cn = null;
        Statement stm = null;
        ResultSet rs = null;

        try {
            cn = Conexion.conectar();
            stm = cn.createStatement();
            rs = stm.executeQuery("select * from intell.empleados");

            assertTrue(rs.next()); // Verifica que haya al menos una fila en el resultado
        } catch (Exception e) {
            fail("Excepción inesperada: " + e.getMessage());
        } finally {
            // Cierra recursos
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                fail("Error al cerrar: " + e.getMessage());
            }
        }
    }
}
