package test.member.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.member.dao.MemberDao;
import test.member.dto.MemberDto;

@WebServlet("/member/updateform")
public class MemberUpdateformServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, 
							HttpServletResponse response) throws ServletException, IOException {
		//수정할 회원의 번호를 읽어온다.
		int num=Integer.parseInt(request.getParameter("num"));
		//DB 에서 수정할 회원의 정보르 얻어온다.
		MemberDao dao=MemberDao.getInstance();
		MemberDto dto=dao.getData(num);
		
		//응답 인코딩 설정
		response.setCharacterEncoding("utf-8");
		//응답 컨텐츠 설정
		response.setContentType("text/html;charset=utf-8");
		//클라이언트에게 응답할수 있는 객체의 참조값 얻어오기
		PrintWriter pw = response.getWriter();
		//html 형식으로 응답하기 
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8'/>");
		pw.println("<title>회원정보 수정 페이지</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<h3>회원 추가 폼입니다.</h3>");
		pw.println("<form action='update' method='post'>"); 
		pw.println("<input type='hidden' id='num' name='num' value='"+dto.getNum()+"'/><br/>");
		pw.println("이름 <input type='text' id='name' name='name' value='"+dto.getName()+"'/><br/>");
		pw.println("주소 <input type='text' id='addr' name='addr' value='"+dto.getAddr()+"'/><br/>");
		pw.println("<button type='submit'>수정확인</button>");
		pw.println("</form>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();
	}

}
