package test.users.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;
import test.users.dao.UsersDao;
import test.users.dto.UsersDto;

public class UsersLoginAction extends Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		//폼 전송되는 아이디 비밀번호를 읽어와서
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		//로그인 성공 후 원래 가야할 곳의 정보
		String url=request.getParameter("url");
		
		//db의 정보와 이리하는지 확인해서
		UsersDto dto=new UsersDto();
		dto.setId(id);
		dto.setPwd(pwd);
		
		//로그인 성공여부 
		boolean isLoginSuccess=UsersDao.getInstance().isValid(dto);
		
		request.setAttribute("isLoginSuccess", isLoginSuccess);

		return new ActionForward("/views/users/login.jsp");
	}

}
