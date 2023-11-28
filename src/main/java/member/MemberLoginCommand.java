package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.SecurityUtil;

public class MemberLoginCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.getMemberMidCheck(mid);
		
		//System.out.println("로그인 시도 : "+mid+" / DB아이디 : "+vo.getMid());
		if(vo.getMid()==null || vo.getUserDel().equals("OK")|| !vo.getMid().equals(mid)) {
			request.setAttribute("msg", "아이디를 확인하세요");
			request.setAttribute("url", "index.jsp");
			return;
		}
		
		//암호화된 비밀번호 체크
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(pwd);
		if(!vo.getPwd().equals(pwd)) {
			request.setAttribute("msg", "비밀번호를 확인하세요");
			request.setAttribute("url", "index.jsp");
			return;
		}
		
		//로그인시 처리할내용은 . . .

		//1.아이디 세션에 올리기 . . . 
		HttpSession session = request.getSession();
		session.setAttribute("sMid", mid);
		session.setAttribute("sName", vo.getName());
		
		
		//2.쿠키에 로그인시 아이디 저장
		String idSave = request.getParameter("idSave")==null ? "off" : "on";
		Cookie cookieMid = new Cookie("cMid", mid);
		cookieMid.setPath("/");
		if(idSave.equals("on")) {
			cookieMid.setMaxAge(60*60*24*7);
		}
		else {
			cookieMid.setMaxAge(0);
		}
		response.addCookie(cookieMid);
		//처리완료 -> 메세지 출력 -> 회원메인창으로 보낸다
		//System.out.println("사용자이름 : "+vo.getName());
		
		request.setAttribute("msg", vo.getName()+"님 로그인 되었습니다.");
		request.setAttribute("url", "ma.in");
		
	}

}
