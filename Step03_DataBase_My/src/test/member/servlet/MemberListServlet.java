package test.member.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import test.member.dao.MemberDao;
import test.member.dto.MemberDto;

//서블릿은 상대경로가 없음. 최상위 경로부터 전부 기술해줘야함.
@WebServlet("/member/list")
public class MemberListServlet extends HttpServlet  {
	@Override
	public void service(ServletRequest request, 
						ServletResponse response) throws ServletException, IOException {
		// DB에서 회원 목록 얻어와서
		MemberDao dao=MemberDao.getInstance();
		List<MemberDto> list=dao.getList();
		//응답 인코딩 설정
		response.setCharacterEncoding("utf-8");
		//응답 컨텐츠 설정 - 준비자. 준비 시킴
		response.setContentType("text/html;charset=utf-8");
		//클라이언트에게 응답할수 있는 객체의 참조값 얻어오기
		PrintWriter pw=response.getWriter();
		
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8'/>");
		pw.println("<title>회원 목록 페이지</title>");
		//pw.println("<link rel=\"stylesheet\" href=\"css/bootstrap.css\" />");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<div class=\"container\">");
		pw.println("<a href='insertform.html'>회원추가 폼</a>");
		pw.println("<h3>회원 목록입니다.</h3>");
		pw.println("<table border='1'>");
		pw.println("<thead>");
			pw.println("<tr>");
					pw.println("<th width='100'>번호</th>");
					pw.println("<th width='150'>이름</th>");
					pw.println("<th width='150'>주소</th>");
					pw.println("<th width='100'>수정</th>");
					pw.println("<th width='100'>삭제</th>");
				pw.println("</tr>");
			pw.println("</thead>");
			pw.println("<tbody>");
		for(MemberDto tmp:list) {
			pw.println("<tr>");
				pw.println("<td align='center'>"+tmp.getNum()+"</td>");
				pw.println("<td>"+tmp.getName()+"</td>");
				pw.println("<td>"+tmp.getAddr()+"</td>");
				pw.println("<td><a href='updateform?num="+tmp.getNum()+"'>수정</a></td>");
				pw.println("<td><a href='delete?num="+tmp.getNum()+"'>삭제</a></td>");
			pw.println("</tr>");
		}
			pw.println("</tbody>");
		pw.println("</table>");				
		pw.println("</div>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();		
	}
}
