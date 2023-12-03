package posting;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PostReplyDeleteCommand implements PostingInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null?0:Integer.parseInt(request.getParameter("idx"));
		PostingDAO dao = new PostingDAO();
		int res = dao.setPostReplyDelete(idx);
		System.out.println("돌려받은 res값 : "+res);
		
		response.getWriter().write(res+"");
		
	}

}
