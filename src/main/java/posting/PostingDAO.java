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
		
		//게시글 업로드
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
		
		//게시글 목록 가져오기
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
		
		//게시글수정
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
		
		//게시글삭제
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
		
		//댓글쓰기
		public int setPostReplyUpload(PostReplyVO vo) {
			int res=0;
			try {
				sql="insert into postReply values(default,?,?,?,?,default,default)";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, vo.getPostIdx());
				pstmt.setString(2, vo.getMid());
				pstmt.setString(3, vo.getHostIp());
				pstmt.setString(4, vo.getContent());
				res=pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("SQL 오류 : " + e.getMessage());
			} finally {
				pstmtClose();
			}
			return res;
		}
		public ArrayList<PostReplyVO> getReplyList(int[] postIdxArr) {
			ArrayList<PostReplyVO> rVos = new ArrayList<>();
		//	String in="";
		//	System.out.println("postIdxArr.length : " + postIdxArr.length);
		//	switch(postIdxArr.length) {
		//		case 1: in=" WHERE posting.idx IN (?) ";
		//		case 2: in=" WHERE posting.idx IN (?, ?) ";
		//		case 3: in=" WHERE posting.idx IN (?, ?, ?) ";
		//		case 4: in=" WHERE posting.idx IN (?, ?, ?, ?) ";
		//		case 5: in=" WHERE posting.idx IN (?, ?, ?, ?, ?) ";
		//	}
			   // 동적으로 IN 조건을 생성
		    StringBuilder query = new StringBuilder(" WHERE posting.idx IN (");
		    //i의 수만큼 ?를 
		    for (int i = 0; i < postIdxArr.length; i++) {
		    	query.append("?");
		        if (i < postIdxArr.length - 1) {
		        	query.append(", ");
		        }
		    }
		    query.append(") ");
			System.out.println("query : " + query);
			//이렇게하니까 오류 안남...;;
			try {
				sql="SELECT postReply.idx, postReply.postIdx, postReply.mid, postReply.hostIp, postReply.content, postReply.likes, postReply.wDate " +
			             "FROM postReply " +
			             "LEFT JOIN posting ON postReply.postIdx = posting.idx " 
			             + query.toString() +
			             "ORDER BY posting.idx, postReply.idx";
				pstmt=conn.prepareStatement(sql);
				for(int i=0; i<postIdxArr.length; i++) {
					pstmt.setInt(i+1, postIdxArr[i]);
				}
				rs=pstmt.executeQuery();
				while(rs.next()) {
					PostReplyVO vo = new PostReplyVO();
					vo.setIdx(rs.getInt("idx"));
					vo.setPostIdx(rs.getInt("postIdx"));
					vo.setMid(rs.getString("mid"));
					vo.setHostIp(rs.getString("hostIp"));
					vo.setContent(rs.getString("content"));
					vo.setLikes(rs.getInt("likes"));
					vo.setwDate(rs.getString("wDate"));
					rVos.add(vo);
				}
				
			} catch (SQLException e) {
				System.out.println("SQL구문 오류 : " + e.getMessage());
			} finally {
				rsClose();
			}
			return rVos;
		}
		//댓글 삭제
		public int setPostReplyDelete(int idx) {
			int res=0;
			try {
				sql="delete from postReply where idx=?";
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
		//좋아요++
		public int setPostLikePlus(int idx, String mid) {
			int res=0;
			try {
				sql = "insert into postLike values(default,?,?,default)";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, idx);
				pstmt.setString(2, mid);
				res=pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("SQL 오류 : " + e.getMessage());
			} finally {
				pstmtClose();
			}
			return res;
		}
		//해당 게시글이 좋아요 상태인지 아닌지 체크
		public ArrayList<PostLikeVO> getCheckLike(int startIdxNo, int pageSize, String sMid) {
			ArrayList<PostLikeVO> vos=new ArrayList<PostLikeVO>();
			try {
				sql = "select l.idx as idx, l.postIdx as postIdx, l.mid as "+
						"mid from posting p "+
						"left join postLike l on p.idx = l.postIdx "+
						"and l.mid = ? order by p.idx desc limit ?, ?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, sMid);
				pstmt.setInt(2, startIdxNo);
				pstmt.setInt(3, pageSize);
				rs=pstmt.executeQuery();
				while(rs.next()) {
					PostLikeVO vo = new PostLikeVO();
					vo.setIdx(rs.getInt("idx"));
					vo.setPostIdx(rs.getInt("postIdx"));
					vo.setMid(rs.getString("mid"));
					vos.add(vo);
				}
			} catch (SQLException e) {
				System.out.println("SQL구문 오류 : " + e.getMessage());
			} finally {
				rsClose();
			}
			return vos;
		}
		public int setPostlikeMinus(int postIdx, String mid) {
			int res=0;
			try {
				sql="delete from postLike where postIdx = ? and mid = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, postIdx);
				pstmt.setString(2, mid);
				res=pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("SQL 오류 : " + e.getMessage());
			} finally {
				pstmtClose();
			}
			return res;
		}
		//포스트의 좋아요 갯수 = 해당 게시물의 postidx를 가지고있는 postlike테이블의 데이터 수
		public void setEditLikes() {
			try {
				sql="update posting p set p.likes=( "+
						"select count(l.idx) "+
						"from postLike l "+
						"where l.postIdx=p.idx)";
				pstmt = conn.prepareStatement(sql);
				pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("SQL 오류 : " + e.getMessage());
			} finally {
				pstmtClose();
			}
		}
}
