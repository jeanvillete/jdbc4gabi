package org.jdb4gabi.statements;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.jdb4gabi.model.Estado;

public class SampleList extends ConnectionData {

	public static void main(String[] args) {
		try {
			SampleList sl = new SampleList();
			
			List<Estado> listaEstado = sl.list();
			if ( listaEstado != null ) {
				for ( Estado estado : listaEstado ) {
					System.out.printf( "-- Estado: id='%d', nome='%s', uf='%s' \n", 
							estado.getId(), estado.getNome(), estado.getUf() );
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private List<Estado> list() throws SQLException{
		List<Estado> listaEstado = new ArrayList<Estado>();
		
		Connection conn = this.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery( " select estado_id, nome, uf from estado " );
		
		while ( rs.next() ) {
			Estado est = new Estado();
			est.setId( rs.getInt( 1 ) );
			est.setNome( rs.getString( 2 ) );
			est.setUf( rs.getString( 3 ) );
			
			listaEstado.add( est );
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
		return listaEstado;
	}
}
