package posting;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PostEditCommand implements PostingInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));
		String content = request.getParameter("content") ==null ? "" : request.getParameter("content");
		
		System.out.println("수정할 idx : "+idx);
		System.out.println("수정할 content : "+content);
		
		PostingDAO dao = new PostingDAO();
		int res = dao.setPostEdit(idx, content);
		
		if(res==1) {
			request.setAttribute("msg", "포스트를 수정하였습니다.");
			request.setAttribute("url", "ma.in");
		} else {
			request.setAttribute("msg", "포스트 수정에 실패했습니다.");
			request.setAttribute("url", "ma.in");
		}
	}

}
