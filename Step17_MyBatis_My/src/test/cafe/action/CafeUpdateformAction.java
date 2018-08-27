package test.cafe.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.cafe.dao.CafeDao;
import test.cafe.dto.CafeDto;
import test.controller.Action;
import test.controller.ActionForward;

public class CafeUpdateformAction extends Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		//1.파라미터로 전달되는 글번호
		int num=Integer.parseInt(request.getParameter("num"));
		CafeDto dto=new CafeDto();
		dto.setNum(num);
		//2. CafeDao를 이용해서 글 삭제
		CafeDto resultDto=CafeDao.getInstance().getData(dto);
		//3. 결과를 request에 담고
		request.setAttribute("dto", resultDto);
		//4. view 페이지로 forward 이동해서 응답
		return new ActionForward("/views/cafe/updateform.jsp");
	}

}
