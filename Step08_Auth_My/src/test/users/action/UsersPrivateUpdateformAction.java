package test.users.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import test.controller.Action;
import test.controller.ActionForward;
import test.users.dao.UsersDao;
import test.users.dto.UsersDto;

public class UsersPrivateUpdateformAction extends Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		//1. 세션에 저장된 아이디를 읽어와서
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");

		//2. db에서 해당 아이디의 개인정보를 읽어와서
		UsersDto dto=UsersDao.getInstance().getData(id);
		
		request.setAttribute("dto", dto);
		return new ActionForward("/views/users/private/updateform.jsp");
	}
}
