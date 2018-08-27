package test.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*
 * 중간에 요청을 가로채서 특정 동작을 하기 위한 클래스 
 * 
 * 1. Filter 인터페이스를 구현한다.
 * 2. Filter 의 동작을 매핑한다.
 * 
 */
//2.동작매핑 - market 하위의 모든 요청
@WebFilter({"/market/*", "/users/private/*"})	//문자열 배열
public class LoginFilter implements Filter {	// 1.인터페이스 구현 

	@Override
	public void destroy() {
				
	}
	
	//필터가 동작될때 호출되는 메소드 
	@Override
	//ServletRequest => HttpServletRequest의 부모타입.(servlet)
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("doFilter() ...");
		
		//원래 type으로 casting - session 쓰기 위해.
		//원래 전달은 http 타입인데 받기를 부모타입으로 받아서 casting해서 getSession()사용하는것임.
		HttpServletRequest request=(HttpServletRequest)req;		//.getSession()
		HttpServletResponse response=(HttpServletResponse)res;	//응답에 필요
		
		//context path
		String cPath=request.getContextPath();
		//현재 요청된 url 정보를 읽어온다. (원래 이동하려던 목적지) - 파라미터는 못가져옴
		String url=request.getRequestURI();
		
		//세션 객체를 얻어와서 
		HttpSession session=request.getSession();
		//id가 저장되어 있는지 읽어와 본다. casting 필요!!
		String id=(String)session.getAttribute("id");		
		if(id==null) {//로그인 하지 않았으면
			//로그인 페이지로 이동하라고 redirect 응답을 준다.			
			response.sendRedirect(cPath+"/users/loginform.jsp?url="+url);
		}else {
			//요청의 흐름 계속 진행 시키기
			chain.doFilter(req, res);			
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
				
	}

}
