package posting;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@SuppressWarnings("serial")
@WebServlet("*.po")
public class PostingController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PostingInterface command=null;
		String viewPage="/WEB-INF/main";
		String com = request.getRequestURI();
		com=com.substring(com.lastIndexOf("/"),com.lastIndexOf("."));
		
		HttpSession session =request.getSession();
		String mid = session.getAttribute("sMid")==null? "" : (String)session.getAttribute("sMid");
		
		if(com.equals("/postUpload")){
			command=new PostUploadCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		
		} else if(com.equals("/scrollPage")){
			command=new PostingScrollPageCommand();
			command.execute(request, response);
			viewPage = "/mainPage/scrollPage.jsp";
			
		} else if(com.equals("/postEdit")){
			command=new PostEditCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
			
		} else if(com.equals("/postDelete")){
			command=new PostdeleteCommand();
			command.execute(request, response);
			return;
			
		} else if(com.equals("/postReplyInput")){
			command=new PostReplyInputCommand();
			command.execute(request, response);
			return;
			
		} else if(com.equals("/postReplyDelete")){
			command=new PostReplyDeleteCommand();
			command.execute(request, response);
			return;
			
		} else if(com.equals("/likePlus")){
			command=new PostlikePlusCommand();
			command.execute(request, response);
			return;
			
		} else if(com.equals("/likeMinus")){
			command=new PostlikeMinusCommand();
			command.execute(request, response);
			return;
		} 
		
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
}
