package test.cafe.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.cafe.dao.CafeRecommendDao;
import test.cafe.dto.CafeRecommendDto;
import test.controller.Action;
import test.controller.ActionForward;

public class CafeCheckRecommendAction extends Action  {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		//작성자
		String recommender=(String)request.getSession().getAttribute("id");
		int num=Integer.parseInt(request.getParameter("num"));
		System.out.println(num);
		System.out.println(recommender);
		CafeRecommendDto dto=new CafeRecommendDto(num, recommender, null);
		
		boolean isValid=CafeRecommendDao.getInstance().isValid(dto);
		
		request.setAttribute("isValid", isValid);
		
		return new ActionForward("/views/cafe/isValidRecommend.jsp");
	}

}
