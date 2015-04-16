package org.jdb4gabi.statements;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class SampleInsert extends ConnectionData {

	public static void main(String[] args) {
		try {
			SampleInsert si = new SampleInsert();
			si.insert();
			
			System.out.println("Novo registro inserido.");
		} catch (SQLException e) {
			System.out.println("Problemas ao tentar inserir registro.");
			e.printStackTrace();
		}
	}

	private void insert() throws SQLException{
		Connection conn = this.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(" insert into estado( nome, uf ) values ( ?, ? ) ");
		pstmt.setString(1, "Mato Grosso");
		pstmt.setString(2, "MT");
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
}
