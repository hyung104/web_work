package test.friends.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.friends.dao.FriendsDao;
import test.friends.dto.FriendsDto;

@WebServlet("/friends/insert")
public class FriendsInsertServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, 
							HttpServletResponse response) throws ServletException, IOException {
		//POST방식으로 전송되었을 때 한글 깨지지 않도록
		request.setCharacterEncoding("utf-8");
		//전쇵된 파라미터 추출
		String name=request.getParameter("name");
		String phone=request.getParameter("phone");
		String addr=request.getParameter("addr");
		
		//저장할 친구정보를 FriendsDto에 담아서
		FriendsDto dto=new FriendsDto();
		dto.setName(name);
		dto.setName(phone);
		dto.setAddr(addr);
		//FriendsDao 객체를 이용해서 DB 에 저장
		FriendsDao dao=FriendsDao.getInstance();
		boolean isSuccess=dao.insert(dto);
		
		//클라이언트에게 응답하기
		//요청 uri 문자열 읽어오기
		String uri=request.getRequestURI();
		//context path 읽어오기
		String contextPath=request.getContextPath();
		
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
		pw.println("<title>친구정보 추가 결과페이지</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<p>친구 정보를 추가했습니다.</p>");
		pw.println("<a href='list'>친구 목록보기</a>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();	
	}
}
