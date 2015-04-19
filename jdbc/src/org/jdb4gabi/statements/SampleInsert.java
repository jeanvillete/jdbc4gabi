package org.jdb4gabi.statements;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.jdb4gabi.model.Estado;

public class SampleInsert extends ConnectionData {

	public static void main(String[] args) {
		if ( args != null && args.length == 2 ) {
			Estado estado = new Estado();
			estado.setNome( args[0] );
			estado.setUf( args[1] );
			
			try {
				SampleInsert si = new SampleInsert();
				si.insert( estado );
				
				System.out.println("Novo registro inserido.");
			} catch (SQLException e) {
				System.out.println("Problemas ao tentar inserir registro.");
				usage();
				
				e.printStackTrace();
			}
		} else {
			usage();
		}
	}

	private void insert( Estado estado ) throws SQLException{
		Connection conn = this.getConnection();
		PreparedStatement pstmt = conn.prepareStatement( " insert into estado( nome, uf ) values ( ?, ? ) " );
		pstmt.setString( 1, estado.getNome() );
		pstmt.setString( 2, estado.getUf() );
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
	
	private static void usage() {
		System.out.println( "SampleInsert - usage" );
		System.out.println( "\tSampleInsert estadoNome estadoUf" );
	}
}
