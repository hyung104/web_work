package test.users.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;
import test.users.dao.UsersDao;
import test.users.dto.UsersDto;

public class UsersSignupAction extends Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		// 폼전송된 회원 정보를 추출해서
		//request.setCharacterEncoding("utf-8"); <-encodingFilter 사용해서 안해줘도 됨
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		String email=request.getParameter("email");
		// db에 저장하고
		UsersDto dto=new UsersDto();
		dto.setId(id);
		dto.setPwd(pwd);
		dto.setEmail(email);
		boolean isSuccess=UsersDao.getInstance().insert(dto);
		
		request.setAttribute("isSuccess", isSuccess);
		
		return new ActionForward("/views/users/signup.jsp");
	}

}
