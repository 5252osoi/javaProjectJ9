package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import posting.PostLikeVO;
import posting.PostReplyVO;
import posting.PostingDAO;
import posting.PostingVO;

public class MainPagingCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String sMid = (String) session.getAttribute("sMid")==null?"":(String) session.getAttribute("sMid");
		
		int curPage = request.getParameter("curPage")==null?1:Integer.parseInt(request.getParameter("curPage"));
		int pageSize = 5;
		int startIdxNo = (curPage-1)*pageSize; //로딩해서 가져올 새 글의 번호
		
		//우측 추천바 추천인 목록(로그인한 본인을 제외한 최신 가입순 회원 5명)
		MemberDAO mDao = new MemberDAO();
		ArrayList<MemberVO> mVos = mDao.getRecommendUser(sMid);
		
		//상단 추천바 추천인 목록(로그인한 본인을 제외한 랜덤 회원 7명)
		ArrayList<MemberVO> rmVos = mDao.getRanRecommendUser(sMid);
		
		//게시글리스트 가져오기(5개까지)
		PostingDAO dao = new PostingDAO();
		ArrayList<PostingVO> vos = dao.getMainList(startIdxNo, pageSize,"","");
		//각 게시글에 좋아요가 되어있는지 아닌지 체크
		ArrayList<PostLikeVO> lVos = dao.getCheckLike(startIdxNo,pageSize,sMid);
		
		//각 게시글의 idx 가져오기 (해당 idx에 딸린 댓글 가져오기위함)
		int[] postIdxArr = new int[vos.size()];
		for(int i=0; i<vos.size(); i++) {
			postIdxArr[i]=vos.get(i).getIdx();
		}
		//게시글의 수가 1~5개 사이일 때 글에 딸린 댓글을 가져옴
		if(postIdxArr.length >= 1 && postIdxArr.length <= 5) {
			//댓글리스트 가져오기
			ArrayList<PostReplyVO> rVos = dao.getReplyList(postIdxArr);
			request.setAttribute("rVos", rVos);
		}
		request.setAttribute("vos", vos);
		request.setAttribute("mVos", mVos);
		request.setAttribute("rmVos", rmVos);
		request.setAttribute("lVos", lVos);
		request.setAttribute("curPage", curPage);
		request.setAttribute("startIdxNo", startIdxNo);
	
	}

}
