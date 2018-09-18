package test.friend.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;
import test.friend.dao.FriendDao;
import test.friend.dto.FriendDto;

public class FriendListAction extends Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		List<FriendDto> list=FriendDao.getInstance().getList(); 
		request.setAttribute("list", list);
		ActionForward af=new ActionForward("/views/friend/list.jsp");
		return af;
	}

}
