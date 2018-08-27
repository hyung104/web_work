package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

@WebServlet("/users/login")
public class UsersLoginServlet extends HttpServlet {
	@Override
	public void service(ServletRequest request, 
						ServletResponse response) throws ServletException, IOException {
		//POST 방식 전송 했을 때 한글 깨지지 않도록
		request.setCharacterEncoding("utf-8");
		
		//1. 입력한 아이디 비밀번호를 읽어온다.
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		System.out.println(id+"|"+pwd);
		
		//2. DB에서 해당정보가 유효한 정보인지 확인한다.		
		//3. 유효한 정보이면 로그인 처리를 하고		
		//4. 유효하지 않은 정보이면 아이디 혹은 비밀번호가 틀렸다고 응답해준다.
		
		//로그인 성공 여부
		boolean isSuccess=false;
		if(id.equals("gura") && pwd.equals("1234")) {
			isSuccess=true;
		}
		
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
		pw.println("<title>로그인 결과</title>");
		pw.println("</head>");
		pw.println("<body>");
		if(isSuccess) {
			pw.println("<p>"+id+" 님 로그인 되었습니다.</p>");
		}else {
			pw.println("<script>");
			pw.println("alert('아이디 혹은 비밀번호가 틀려요')");
			pw.println("</script>");
			pw.println("<a href='loginform.html'>로그인폼</a>");
		}
		pw.println("</body>");
		pw.println("</html>");
		pw.close();	
		
	}
}
