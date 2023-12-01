package posting;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PostingScrollPageCommand implements PostingInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PostingDAO dao = new PostingDAO();
		
		int curPage = request.getParameter("curPage")==null?1:Integer.parseInt(request.getParameter("curPage"));
		int pageSize = 5;
		int startIdxNo = (curPage-1)*pageSize; //로딩해서 가져올 새 글의 번호
		
		//게시글리스트 가져오기(5개까지)
		ArrayList<PostingVO> vos = dao.getMainList(startIdxNo, pageSize,"","");
		
		//각 게시글의 idx 가져오기 (해당 idx에 딸린 댓글 가져오기위함)
		int[] postIdxArr = new int[vos.size()];
		for(int i=0; i<vos.size(); i++) {
			postIdxArr[i]=vos.get(i).getIdx();
		}
		//게시글의 수가 1~5개 사이일 때 글에 딸린 댓글도 가져옴
		if(postIdxArr.length >= 1 && postIdxArr.length <= 5) {
			//댓글리스트 가져오기
			ArrayList<PostReplyVO> rVos = dao.getReplyList(postIdxArr);
			request.setAttribute("rVos", rVos);
		}
		request.setAttribute("vos", vos);
		request.setAttribute("curPage", curPage);
		request.setAttribute("startIdxNo", startIdxNo);
	}

}
