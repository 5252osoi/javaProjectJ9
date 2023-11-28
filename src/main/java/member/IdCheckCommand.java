package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IdCheckCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null?"":request.getParameter("mid");
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.getMemberMidCheck(mid);
		//System.out.println("전달받은 mid : "+mid);
		//System.out.println("vo : "+vo.getMid());
		int res=0;

		//ID가 이미 존재하면 res=1로 반환
		if(vo.getMid()!=null) {
			res=1;
		}

		response.getWriter().write(res+"");
		
	}

}
