/**
 * 
 */
package org.jdb4gabi.first;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * @author jean
 *
 */
public class FirstConnection {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
//		String url = "jdbc:postgresql://192.168.1.10/db4app";
//		Properties props = new Properties();
//		props.setProperty("user","estadocidade_app");
//		props.setProperty("password","estadocidade_app_pw");
//		props.setProperty("ssl","true");
//		Connection conn = DriverManager.getConnection(url, props);

		String url = "jdbc:postgresql://192.168.1.10/db4app?user=estadocidade_app&password=estadocidade_app_pw";
		try {
			Connection conn = DriverManager.getConnection( url );
			System.out.println( "Conexão estabelecida com sucesso!" );
		} catch (SQLException e) {
			System.out.println( "Ops, não conseguimos estabelecer conexão." );
			e.printStackTrace();
		}
	}

}
