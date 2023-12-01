package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.GetConn;

public class MemberDAO {
	private Connection conn = GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs=null;
	
	private String sql="";
	MemberVO vo = null;
	
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
	public MemberVO getMemberMidCheck(String mid) {
		vo = new MemberVO(); 
		try {
			sql="select * from member where mid = ?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setName(rs.getString("name"));
				vo.setEmail(rs.getString("email"));
				vo.setTel(rs.getString("tel"));
				vo.setPr(rs.getString("pr"));
				vo.setUserInfor(rs.getString("userInfor"));
				vo.setUserDel(rs.getString("userDel"));
				vo.setPost(rs.getInt("post"));
				vo.setFollow(rs.getInt("follow"));
				vo.setFollower(rs.getInt("follower"));
			}
		} catch (SQLException e) {
			System.out.println("SQL오류 "+e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}
	public int setMemberJoinOk(MemberVO vo) {
		int res=0;
			try {
				sql="insert into member values(default,?,?,?,?,?,?,default,default,default,default,default)";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, vo.getMid());
				pstmt.setString(2, vo.getPwd());
				pstmt.setString(3, vo.getName());
				pstmt.setString(4, vo.getEmail());
				pstmt.setString(5, vo.getTel());
				pstmt.setString(6, vo.getPr());
				res=pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("SQL오류 "+e.getMessage());
			} finally {
				pstmtClose();
			}
		return res;
	}
	public ArrayList<MemberVO> getRecommendUser() {
		ArrayList<MemberVO> vos = new ArrayList<>();
		try {
			sql="select * from member order by idx desc limit 0,5";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				vo = new MemberVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setName(rs.getString("name"));
				vo.setEmail(rs.getString("email"));
				vo.setTel(rs.getString("tel"));
				vo.setPr(rs.getString("pr"));
				vo.setUserInfor(rs.getString("userInfor"));
				vo.setUserDel(rs.getString("userDel"));
				vo.setPost(rs.getInt("post"));
				vo.setFollow(rs.getInt("follow"));
				vo.setFollower(rs.getInt("follower"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL오류 "+e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}
}
