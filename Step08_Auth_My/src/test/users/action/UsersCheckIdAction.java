package test.users.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;
import test.users.dao.UsersDao;

public class UsersCheckIdAction extends Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		//1. 파라미터로 전달되는 아이디 읽어오기
		String inputId=request.getParameter("inputId");
		//2. DB 에서 사용가능한 아이디인지 확인 한다.
		boolean canUse=UsersDao.getInstance().canUseId(inputId);	
		System.out.println("canuse: "+canUse);
		request.setAttribute("canUse", canUse);
		
		return new ActionForward("/views/users/checkid.jsp");
	}

}
