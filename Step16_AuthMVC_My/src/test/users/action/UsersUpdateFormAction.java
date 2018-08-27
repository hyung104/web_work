package test.users.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;
import test.users.dao.UsersDao;
import test.users.dto.UsersDto;

public class UsersUpdateFormAction extends Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		//1. 세션에 저장된 아이디를 읽어와서
		String id=(String)request.getSession().getAttribute("id");

		//2. db에서 해당 아이디의 개인정보를 읽어와서
		UsersDto dto=UsersDao.getInstance().getData(id);
		// requet에 담고
		request.setAttribute("dto", dto);
		// view 페이지로 forward 이동
		return new ActionForward("/views/users/updateform.jsp");
	}

}
