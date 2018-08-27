package test.gallery.action;

import java.io.File;
import java.util.concurrent.ExecutionException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;
import test.gallery.dao.GalleryDao;
import test.gallery.dto.GalleryDto;

public class GalleryDeleteAction extends Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		boolean isSuccess=false;
		
		try {
			//삭제할 파일 번호를 읽어온다.
			int num=Integer.parseInt(request.getParameter("num"));
			String gubun=request.getParameter("gubun");
	
			// 파일 시스템에서 삭제하기 위해서는 저장된 파일명을 알아야한다.	
			GalleryDto dto=GalleryDao.getInstance().getData(num);
			
			String imagePath=dto.getImagePath();
						
			// 세션의 아이디와 삭제할 글의 작성자와 같은지 한번 더 확인
			String id=(String)request.getSession().getAttribute("id");
			
			if(!(id.equals(dto.getWriter()))){
				//금지된 요청이라고 에러를 응답한다.
				/*
					response.sendError(에러코드, "에러메세지");
				*/
				//response.sendError(HttpServletResponse.SC_FORBIDDEN);
				response.sendError(HttpServletResponse.SC_FORBIDDEN, "본인의 이미지가 아닙니다.");
				return null;
			}
			//1. db에서 파일 정보 삭제
			isSuccess=GalleryDao.getInstance().delete(num);
			
			//2. WebContent/upload 폴더에서 실제 파일 삭제
			
			// ServletContext 객체는 request 객체로 부터 얻어낼 수 있다.
			ServletContext application=request.getServletContext();
			// 삭제할 파일의 전체 경로 구성
			String path=application.getRealPath(imagePath);
			System.out.println(path);
			//file 객체를 생성해서 삭제
			new File(path).delete();
		} catch ( Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("isSuccess", isSuccess);
		
		return new ActionForward("/views/gallery/delete.jsp");
	}

}
