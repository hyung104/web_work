package test.users.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import test.controller.Action;
import test.controller.ActionForward;
import test.users.dao.UsersDao;
import test.users.dto.UsersDto;

public class UsersPrivateDeleteAction extends Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session=request.getSession();
		//1. 세션에서 아이디를 읽어와서
		String id=(String)session.getAttribute("id");
		//2. db에서 삭제하고
		boolean isSuccess=UsersDao.getInstance().delete(id);	
		//3. 로그아웃 처리하고
		session.invalidate();
		
		request.setAttribute("isSuccess", isSuccess);
		request.setAttribute("deleteId", id);
		return new ActionForward("/views/users/private/delete.jsp");
	}
}
