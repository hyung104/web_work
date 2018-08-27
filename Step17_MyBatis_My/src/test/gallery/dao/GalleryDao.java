package test.gallery.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import test.gallery.dto.GalleryDto;
import test.mybatis.SqlMapConfig;

public class GalleryDao {
	
	private static GalleryDao dao;
	private static SqlSessionFactory factory; 
	private GalleryDao() {}
	
	public static GalleryDao getInstance() {
		if(dao==null) {
			dao=new GalleryDao();
			factory=SqlMapConfig.getSqlSession();
		}
		return dao;
	}
	
	public boolean insert(GalleryDto dto) {
		SqlSession session = null;
		int flag = 0;
		try {
			//auto commit 되는 SqlSession 객체의 참조값 얻어오기
			session = factory.openSession(true);
			flag=session.insert("gallery.insert", dto);
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
	
	// 이미지 정보 삭제
	public boolean delete(int num) {
		SqlSession session = null;
		int flag = 0;
		try {
			//auto commit 되는 SqlSession 객체의 참조값 얻어오기
			session = factory.openSession(true);
			flag=session.delete("gallery.delete", num);
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
	
	// 이미지 정보 가져오기
	public GalleryDto getData(int num) {
		SqlSession session = null;
		GalleryDto dto=null;
		try {
			//auto commit 되는 SqlSession 객체의 참조값 얻어오기
			session = factory.openSession();
			dto=session.selectOne("gallery.getData", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return dto;		
	}
	//이미지 목록 가져오기
	public List<GalleryDto> getList(GalleryDto dto){
		SqlSession session = null;
		List<GalleryDto> list=null;
		try {
			//auto commit 되는 SqlSession 객체의 참조값 얻어오기
			session = factory.openSession();
			list=session.selectList("gallery.getList", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;	
	}
	//전체 row의 갯수를 리턴하는 메소드
	public int getCount() {
		SqlSession session=null;
		int count=0;
		try {
			session=factory.openSession();
			count=session.selectOne("gallery.getCount");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		return count;
	}
}
