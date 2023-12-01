package posting;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class PostUploadCommand implements PostingInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/severPostImg");
		int maxSize = 1024 * 1024 * 30;	// 서버에 저장시킬 파일의 최대용량을 30MByte로 제한한다.(1회저장용량)
		String encoding = "UTF-8";
		// 파일 업로드 처리....(객체가 생성되면서 바로 파일이 업로드 처리된다.)
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		// 업로드된 파일의 정보를 추출해보자...
		
		Enumeration fileNames = multipartRequest.getFileNames();
		
		String file = "";
		String originalFileName = "";
		String filesystemName = "";
		
		System.out.println("서버의 저장경로 : " + realPath);
		System.out.println("fileNames " + fileNames);
		
		while(fileNames.hasMoreElements()) {
			file = (String) fileNames.nextElement();
			originalFileName = multipartRequest.getOriginalFileName(file);
			filesystemName = multipartRequest.getFilesystemName(file);
			
		//	if(multipartRequest.getFilesystemName(file) != null) {
		//		originalFileName += multipartRequest.getOriginalFileName(file) + "/";
		//		filesystemName += multipartRequest.getFilesystemName(file) + "/";
		//	}
			
			System.out.println("원본 파일명 : " + originalFileName);
			System.out.println("서버에 저장된 파일명 : " + filesystemName);
		}
		
		//originalFileName = originalFileName.substring(0,originalFileName.length()-1);
		//filesystemName = filesystemName.substring(0,filesystemName.length()-1);
		
		
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		String name = (String) session.getAttribute("sName");
		
		int fileSize = multipartRequest.getParameter("fileSize") == null ? 0 :Integer.parseInt(multipartRequest.getParameter("fileSize"));
		String content = multipartRequest.getParameter("content") ==null ? "" : multipartRequest.getParameter("content");
		String hostIp = multipartRequest.getParameter("hostIp") ==null ? "" : multipartRequest.getParameter("hostIp");
		String openSw = multipartRequest.getParameter("openSw") ==null ? "공개" : multipartRequest.getParameter("openSw");
		
		PostingVO vo = new PostingVO();
		vo.setMid(mid);
		vo.setfName(name);
		vo.setfName(originalFileName);
		vo.setfSName(filesystemName);
		vo.setfSize(fileSize);
		vo.setOpenSw(openSw);
		vo.setContent(content);
		vo.setHostIp(hostIp);
		
		PostingDAO dao = new PostingDAO();
		int res= dao.setPostUpload(vo);
		if(res==1) {
			request.setAttribute("msg", "포스트를 업로드하였습니다.");
			request.setAttribute("url", "ma.in");
		} else {
			request.setAttribute("msg", "포스트 업로드에 실패했습니다.");
			request.setAttribute("url", "ma.in");
		}
	}
}
