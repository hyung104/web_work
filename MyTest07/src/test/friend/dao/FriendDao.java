package test.friend.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import test.friend.dto.FriendDto;
import test.util.DbcpBean;

public class FriendDao {
	private static FriendDao dao;
	private FriendDao() {};
	public static FriendDao getInstance() {
		if(dao==null) {
			dao=new FriendDao();			
		}
		return dao;		
	}
	
	public List<FriendDto> getList(){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//select 된 결과를 담을 지역변수 만들기
		List<FriendDto> list=new ArrayList<>();
		try {
			conn = new DbcpBean().getConn();
			//실행할 select 문
			String sql = "SELECT num,name,phone,regdate FROM friend ORDER BY num";
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			//반복문 돌면서 ResultSet 에 있는 내용 추출
			while (rs.next()) {
				FriendDto dto=new FriendDto();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setRegdate(rs.getString("regdate"));
				list.add(dto);
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return list;
	}
}
