package test.cafe.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.cafe.dao.CafeRecommendDao;
import test.cafe.dto.CafeRecommendDto;
import test.controller.Action;
import test.controller.ActionForward;

public class CafeRecommendAction extends Action  {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		//추천자
		String recommender=(String)request.getSession().getAttribute("id");
		int num=Integer.parseInt(request.getParameter("num"));
		
		CafeRecommendDto dto=new CafeRecommendDto(num, recommender, null);
		
		//DB 에 저장
		boolean isSuccess=CafeRecommendDao.getInstance().insert(dto);
		
		//request 에 성공 여부 담기
		request.setAttribute("isSuccess", isSuccess);
		
		//view 페이지로 forward 이동해서 응답 
		return new ActionForward("/views/cafe/recommend.jsp");
	}

}
