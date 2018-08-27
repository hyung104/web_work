package test.cafe.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import test.cafe.dto.CafeRecommendDto;
import test.mybatis.SqlMapConfig;

public class CafeRecommendDao {
	private static CafeRecommendDao dao;
	private static SqlSessionFactory factory;
	private CafeRecommendDao() {}
	
	//자신의 참조값을 리턴해주는 메소드
	public static CafeRecommendDao getInstance() {
		if(dao==null) {
			dao=new CafeRecommendDao();
			factory=SqlMapConfig.getSqlSession();
		}
		return dao;
	}
	
	public boolean isValid(CafeRecommendDto dto) {
		SqlSession session = null;
		int num = 0;
		try {
			session = factory.openSession();
			num=session.selectOne("cafeRecommend.getData", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		if (num > 0) {
			return false;
		} else {
			return true;
		}
	}
	
	public boolean insert(CafeRecommendDto dto) {
		SqlSession session = null;
		int flag = 0;
		try {
			//auto commit 되는 SqlSession 객체의 참조값 얻어오기
			session = factory.openSession(true);
			flag=session.insert("cafeRecommend.insert", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
}
