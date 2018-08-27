package test.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.member.dto.MemberDto;

@WebServlet("/requestScope/showdata")
public class ShowDataServlet extends HttpServlet  {
	@Override
	protected void service(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
	
		//파라미터로 전달되는 번호를 읽어온다.
		int num=Integer.parseInt(request.getParameter("num"));
		//db에서 num에 해당ㅎ되는 정보를 읽어왔다고 가정하자
		MemberDto dto=new MemberDto(num, "김구라", "노량진");
		
		// 1회성 데이터 - 응답하고 나면 사라짐
		//request 영역(request scope)에 dto 담기
		//.setAttribute("키", value);
		request.setAttribute("dto", dto);	
		
		//forward 이동해서 응답한다 (jsp 페이지로 응답 위임하기)		
		RequestDispatcher rd=request.getRequestDispatcher("/path1/showData.jsp");
		rd.forward(request, response);
	}
}
