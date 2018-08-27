package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

//꼭 / 로 시작해야함.
@WebServlet("/buy")
public class BuyServlet extends HttpServlet {
	@Override
	public void service(ServletRequest request, 
						ServletResponse response) throws ServletException, IOException {
		//GET 방식 전송된 파리미터 추출
		String code=request.getParameter("code");
		String category=request.getParameter("category");
		System.out.println(code+"|"+category);
		
		//간단 응담
		PrintWriter pw=response.getWriter();
		pw.println("/buy request ok~");
		pw.close();
	}
}
