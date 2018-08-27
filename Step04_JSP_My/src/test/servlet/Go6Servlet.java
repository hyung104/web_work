package test.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.member.dao.MemberDao;
import test.member.dto.MemberDto;

@WebServlet("/go6")
public class Go6Servlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, 
							HttpServletResponse response) throws ServletException, IOException {
		
		//1번 회원의 정보를 읽어온다.
		MemberDto dto=MemberDao.getInstance().getData(1);
		//MemberDto 객체를 request에 dto라는 키값으로 담는다.
		request.setAttribute("dto", dto);
		//forward 이동
		RequestDispatcher rd=request.getRequestDispatcher("/member_detail.jsp");
		rd.forward(request, response);
	}
}
