package test.users.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import test.controller.Action;
import test.controller.ActionForward;

public class UsersLogoutAction extends Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session=request.getSession();
		session.invalidate();
		
		return new ActionForward("/views/users/logout.jsp");
	}

}
