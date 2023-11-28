package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.SecurityUtil;

public class MemberJoinCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null?"":request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null?"":request.getParameter("pwd");
		String name = request.getParameter("name")==null?"":request.getParameter("name");
		String email = request.getParameter("email")==null?"":request.getParameter("email");

		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.getMemberMidCheck(mid);
		if(vo.getMid()!=null) {
			request.setAttribute("msg", "이미 사용중인 아이디입니다.");
			request.setAttribute("url", "jo.in");
			return;
		}
		//비밀번호 암호화
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(pwd);
		
		vo = new MemberVO();
		vo.setMid(mid);
		vo.setPwd(pwd);
		vo.setName(name);
		vo.setEmail(email);
		vo.setTel("");
		vo.setPr("");
		
		System.out.println("vo : "+ vo);
		
		int res=dao.setMemberJoinOk(vo);
		if(res==1) {
			request.setAttribute("msg", "회원 가입에 성공했습니다.\\n다시 로그인해주세요.");
			request.setAttribute("url", "index.jsp");
		} else {
			request.setAttribute("msg", "회원 가입에 실패했습니다.");
			request.setAttribute("url", "Jo.in");
		}
		
	}
}
