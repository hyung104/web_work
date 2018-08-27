package test.cafe.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.cafe.dao.CafeCommentDao;
import test.cafe.dao.CafeDao;
import test.cafe.dto.CafeCommentDto;
import test.cafe.dto.CafeDto;
import test.controller.Action;
import test.controller.ActionForward;

public class CafeDetailAction extends Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		//1. 파라미터로 전달되는 글번호 읽어오기
		int num=Integer.parseInt(request.getParameter("num"));
		//조회수 증가
		CafeDao.getInstance().addViewCount(num);
		
		//검색과 관련된 파라미터를 읽어와본다
		String keyword=request.getParameter("keyword");
		String condition=request.getParameter("condition");
		
		//CafeDto 객체를 생성해서
		CafeDto dto=new CafeDto();
		if(keyword!=null) {	//검색어가 전달된 경우
			if(condition.equals("titlecontent")) {	// 제목+내용 검색
				dto.setTitle(keyword);
				dto.setContent(keyword);
			}else if(condition.equals("title")) {	// 제목 검색
				dto.setTitle(keyword);
			}else if(condition.equals("writer")) {	// 작성자 검색
				dto.setWriter(keyword);
			}
			//list.jsp에 필요한 내용 담기
			request.setAttribute("keyword", keyword);
			request.setAttribute("condition", condition);			
		}
		//글번호를 dto에 담는다.
		dto.setNum(num);
		
		//2. CafeDao를 이용해서 글정보를 읽어와서
		CafeDto resultDto=CafeDao.getInstance().getData(dto);
		
		//3. request에 담고
		request.setAttribute("dto", resultDto);		
		//로그인 여부 확인해서 request에 담기
		String id=(String)request.getSession().getAttribute("id");
		boolean isLogin=false;
		if(id!=null)isLogin=true;
		//로그인 여부
		request.setAttribute("isLogin", isLogin);
		
		//comment 목록 가져와서 request에 담기
		List<CafeCommentDto> commentList=CafeCommentDao.getInstance().getList(num);
		request.setAttribute("commentList", commentList);
		
		//4. view 페이지로 forward 이동해서 응답		
		return new ActionForward("/views/cafe/detail.jsp");
	}	

}
