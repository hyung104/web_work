package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 *  xxx.do 로 끝나는 모든 요청을 처리할 서블릿 
 */
@WebServlet("*.do")
public class MyServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		//요청 uri 문자열 읽어오기
		String uri=request.getRequestURI();
		//context path 읽어오기
		String contextPath=request.getContextPath();
		
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
		pw.println("<title>MyServlet 테스트</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<p>uri:<strong>"+uri+"</strong></p>");
		pw.println("<p>context path:<strong>"+contextPath+"</strong></p>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();		
	}
}
