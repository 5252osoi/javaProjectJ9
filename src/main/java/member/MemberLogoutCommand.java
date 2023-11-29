package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberLogoutCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String Name=(String) session.getAttribute("sName");
		
		session.invalidate();
		request.setAttribute("msg", Name+"님 로그아웃 되었습니다.");
		request.setAttribute("url", "index.jsp");
	}
}
