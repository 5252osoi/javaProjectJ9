package posting;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PostReplyInputCommand implements PostingInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int postIdx = request.getParameter("postIdx")==null?0: Integer.parseInt(request.getParameter("postIdx"));
		String mid =request.getParameter("mid")==null?"": request.getParameter("mid");
		String hostIp = request.getParameter("hostIp")==null?"":request.getParameter("hostIp");
		String content = request.getParameter("content")==null?"":request.getParameter("content");
		
		System.out.println("postIdx : " + postIdx);
		System.out.println("mid : " + mid);
		
		PostingDAO dao = new PostingDAO();
		PostReplyVO vo = new PostReplyVO();
		vo.setPostIdx(postIdx);
		vo.setMid(mid);
		vo.setHostIp(hostIp);
		vo.setContent(content);
		
		int res = dao.setPostReplyUpload(vo);
		
		response.getWriter().write(res+"");
	}

}
