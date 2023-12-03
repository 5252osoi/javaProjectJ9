package posting;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PostlikeMinusCommand implements PostingInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int postIdx = request.getParameter("idx")==null?0:Integer.parseInt(request.getParameter("idx"));
		String mid = request.getParameter("mid")==null?"":request.getParameter("mid");
		PostingDAO dao = new PostingDAO();
		int res= dao.setPostlikeMinus(postIdx,mid);
		dao.setEditLikes();
		response.getWriter().write(res+"");
	}

}
