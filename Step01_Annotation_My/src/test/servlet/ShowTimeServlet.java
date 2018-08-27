package test.servlet;
/*
 * 1. HttpServlet 클래스 상속 받기
 * 2. service()메소드 오버라이드
 * 3. web.xml에서 서블릿 매핑 => 어노테이션으로 맵핑
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;

//어노테이션 기반으로 서블릿 맵핑하기 @WebServlet("요청경로")
@WebServlet("/showtime")
public class ShowTimeServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		//응답 인코딩 설정
		response.setCharacterEncoding("utf-8");
		//응답 컨텐츠 설정
		response.setContentType("text/html;charset=utf-8");
		//클라이언트에게 응답할수 있는 객체의 참조값 얻어오기
		PrintWriter pw=response.getWriter();
		//html 형식으로 응답하기 
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8'/>");
		pw.println("<title>시간페이지</title>");
		pw.println("</head>");
		pw.println("<body>");
		//날짜 객체 생성 
		Date d=new Date();
		pw.println("<p>현재시간:"+d.toString()+"</p>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();		
	}
}
