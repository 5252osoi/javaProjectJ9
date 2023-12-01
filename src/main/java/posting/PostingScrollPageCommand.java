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
		
		
		ArrayList<PostingVO> vos = dao.getMainList(startIdxNo, pageSize,"","");
		
		request.setAttribute("vos", vos);
		//request.setAttribute("pageSize", pageSize);
		request.setAttribute("curPage", curPage);
		request.setAttribute("startIdxNo", startIdxNo);
	}

}
