package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

@WebServlet("/cafe/detail")
public class CafeDetailServlet extends HttpServlet {
	@Override
	public void service(ServletRequest request, 
						ServletResponse response) throws ServletException, IOException {
		
		//자세히 보여줄 글번호를 읽어온다.
		String num=request.getParameter("num");
		System.out.println(num+"번글 자세히 보기 요청 처리함.");
		
		//간단 응답
		PrintWriter pw=response.getWriter();
		pw.println("/cafe/detail response~");
		pw.close();
	}
}
