package test.cafe.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.cafe.dao.CafeCommentDao;
import test.cafe.dto.CafeDto;
import test.controller.Action;
import test.controller.ActionForward;

public class CafeCommentDeleteAction extends Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		//1.파라미터로 전달되는 글번호
		int num=Integer.parseInt(request.getParameter("num"));
		int ref_group=Integer.parseInt(request.getParameter("ref_group"));
		String keyword=request.getParameter("keyword");
		String condition=request.getParameter("condition");
		
		boolean isSuccess=CafeCommentDao.getInstance().update(num);
		if (isSuccess) {
			return new ActionForward("/cafe/detail.do?num="+ref_group+"&keyword="+keyword+"&condition="+condition, true);
		} else {
			return null;
		}
	}

}
