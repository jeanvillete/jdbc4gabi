package org.jdb4gabi.statements;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionData {

	private String hostname = "localhost";
	private String portNumber = "5432";
	private String database = "db4app";
	private String userName = "estadocidade_app";
	private String password = "estadocidade_app_pw";
	
	protected Connection getConnection() throws SQLException {
		String url = "jdbc:postgresql://" + hostname + ":" + portNumber + "/" + database + "?user=" + userName + "&password=" + password;
		Connection conn = DriverManager.getConnection( url );
		return conn;
	}	
}
