package test.gallery.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import test.controller.Action;
import test.controller.ActionForward;
import test.gallery.dao.GalleryDao;
import test.gallery.dto.GalleryDto;

public class GalleryUploadAction extends Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		boolean isSuccess=false;
		try {
			//파일을 저장할 폴더의 절대 경로 얻어오기
			//application 은 ServletContext type 객체 인데 jsp 기본 객체이다.
			//WebContent/upload 폴더를 만들어야 한다. 
			String uploadDir="/upload";
			// ServletContext 객체는 request 객체로 부터 얻어낼 수 있다.
			ServletContext application=request.getServletContext();
			String realPath=application.getRealPath(uploadDir);
			//최대 업로드 사이즈 값 지정
			int sizeLimit=1024*1024*50; //50 Mbyte
			/*
				WEB-INF/lib/cos.jar 파일이 있어야 아래의 MultipartRequest,
				DefaultFileRenamePolicy 클래스를 import 해서 사용할수 있다.
			*/
			
			// MultipartRequest 객체를 생성한다.
			// 객체가 성공적으로 생성되면 클라이언트가 업로드한 파일이
			// WebContent/upload 폴더에 저장된다. 
			MultipartRequest mr=new MultipartRequest(request,
					realPath,
					sizeLimit,
					"utf-8",
					new DefaultFileRenamePolicy());
			//업로드된 파일의 정보는 mr 객체를 이용해서 얻어온다.
			String caption=mr.getParameter("caption");
			//파일 시스템에 저장된 파일명 
			String saveFileName=mr.getFilesystemName("image");
			
			//업로드한 클라이언트의 아이디
			HttpSession session=request.getSession();
			String writer=(String)session.getAttribute("id");
			
			//업로드된 파일의 정보를 GalleryDto 에 담고 
			GalleryDto dto=new GalleryDto();
			dto.setWriter(writer);
			dto.setCaption(caption);
			dto.setImagePath(uploadDir+"/"+saveFileName);
			
			//DB 에 저장한다.
			isSuccess=GalleryDao.getInstance().insert(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("isSuccess", isSuccess);
				
		return new ActionForward("/views/gallery/upload.jsp");
	}

}
