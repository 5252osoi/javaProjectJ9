package posting;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.GetConn;

public class PostingDAO {
	private Connection conn = GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs=null;
	
	private String sql="";
	PostingVO vo = null;
	
	//pstmt 객체 반납
		public void pstmtClose() {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {}
			}
		}
		// rs 객체 반납
		public void rsClose() {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {}
				finally {
					pstmtClose();
				}
			}
		}
		public int setPostUpload(PostingVO vo) {
			int res=0;
			try {
				sql="insert into posting values(default,?,?,?,?,?,?,default,default,default)";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, vo.getMid());
				pstmt.setString(2, vo.getfName());
				pstmt.setString(3, vo.getfSName());
				pstmt.setInt(4, vo.getfSize());
				pstmt.setString(5, vo.getContent());
				pstmt.setString(6, vo.getHostIp());
				res=pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("SQL오류 : " + e.getMessage());
			}finally {
				pstmtClose();
			}
			return res;
		}
}
