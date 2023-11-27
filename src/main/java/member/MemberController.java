package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("*.mem")
public class MemberController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberInterface command=null;
		String viewPage="/WEB-INF/main";
		String com = request.getRequestURI();
		com=com.substring(com.lastIndexOf("/"),com.lastIndexOf("."));
		
		HttpSession session =request.getSession();
		String mid = session.getAttribute("sMid")==null? "" : (String)session.getAttribute("sMid");
		
		if(com.equals("memberLogin.mem")) {
			command=new MemberLoginCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		
	}
}
