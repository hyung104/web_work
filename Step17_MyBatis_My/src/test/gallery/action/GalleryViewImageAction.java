package test.gallery.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;
import test.gallery.dao.GalleryDao;
import test.gallery.dto.GalleryDto;

public class GalleryViewImageAction extends Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		int num=Integer.parseInt(request.getParameter("num"));
		
		GalleryDto dto=GalleryDao.getInstance().getData(num);
		
		System.out.println("num : " + num);
		// requet에 담고
		request.setAttribute("dto", dto);
		
		// view 페이지로 forward 이동
		return new ActionForward("/views/gallery/viewImage.jsp");
	}

}
