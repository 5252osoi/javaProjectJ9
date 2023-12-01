package posting;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
		public ArrayList<PostingVO> getMainList(int startIdxNo, int pageSize, String string, String string2) {
			ArrayList<PostingVO> vos = new ArrayList<PostingVO>();
			try {
				sql = "select *,datediff(wDate, now()) as date_diff, timestampdiff(hour,wDate, now()) as hour_diff, "
						+ "(select count(*) from postReply where postIdx=p.idx) as replyCnt "
						+ "from posting p order by idx desc limit ?, ?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, startIdxNo);
				pstmt.setInt(2, pageSize);
				rs=pstmt.executeQuery();
				while(rs.next()) {
					vo = new PostingVO();
					vo.setIdx(rs.getInt("idx"));
					vo.setMid(rs.getString("mid"));
					vo.setfName(rs.getString("fName"));
					vo.setfSName(rs.getString("fSName"));
					vo.setfSize(rs.getInt("fSize"));
					vo.setContent(rs.getString("content"));
					vo.setHostIp(rs.getString("hostIp"));
					vo.setOpenSw(rs.getString("openSw"));
					vo.setLikes(rs.getInt("likes"));
					vo.setwDate(rs.getString("wDate"));
					vos.add(vo);
				}
			} catch (SQLException e) {
				System.out.println("SQL구문 오류 : " + e.getMessage());
			} finally {
				rsClose();
			}
			return vos;
		}
		public int setPostEdit(int idx, String content) {
			int res=0;
			try {
				sql="update posting set content=? where idx=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, content);
				pstmt.setInt(2, idx);
				res=pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("SQL오류 : " + e.getMessage());
			}finally {
				pstmtClose();
			}
			return res;
		}
		public int setPostDelete(int idx) {
			int res = 0;
			try {
				sql = "delete from posting where idx = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, idx);
				res = pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("SQL 오류 : " + e.getMessage());
			} finally {
				pstmtClose();
			}
			return res;
		}
}
