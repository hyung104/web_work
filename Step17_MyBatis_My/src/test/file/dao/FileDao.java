package test.file.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import test.file.dto.FileDto;
import test.mybatis.SqlMapConfig;
import test.users.dto.UsersDto;

public class FileDao {
	private static FileDao dao;
	private static SqlSessionFactory factory; 
	private FileDao() {}
	public static FileDao getInstance() {
		if(dao==null) {
			dao=new FileDao();
			factory=SqlMapConfig.getSqlSession();
		}
		return dao;
	}
	// 파일 다운로드 횟수를 증가시키는 메소드
	public boolean addDownCount(int num) {
		SqlSession session = null;
		int flag = 0;
		try {
			//auto commit 되는 SqlSession 객체의 참조값 얻어오기
			session = factory.openSession(true);
			flag=session.update("file.addDownCount", num);
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
	
	// 파일 하나의 정보를 리턴해주는 메소드
	public FileDto getData(int num) {
		SqlSession session=null;
		FileDto dto=null;
		try {
			session=factory.openSession();	// commit 필요없으므로
			// 리턴타입 지정은 mapper에 선언함.
			/*
			 * Mapper 의  namespace : file
			 * sql의 id : getData
			 * parameter type : int
			 * resultType : test.file.dto.FileDto
			 * 
			 * select된  row가 하나인 경우는 .selectOne()
			 * select된 row가 여러개인 경우는 .selectList()
			 */
			dto=session.selectOne("file.getData", num);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (session != null) session.close();
		}		
		return dto;
	}
	
	//파일 정보를 저장하는 메소드
	public boolean insert(FileDto dto) {
		SqlSession session = null;
		int flag = 0;
		try {
			//auto commit 되는 SqlSession 객체의 참조값 얻어오기
			session = factory.openSession(true);
			flag=session.insert("file.insert", dto);
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
	
	//파일정보 삭제하는 메소드
	public boolean delete(int num) {
		SqlSession session = null;
		int flag = 0;
		try {
			//auto commit 되는 SqlSession 객체의 참조값 얻어오기
			session = factory.openSession(true);
			flag=session.delete("file.delete", num);					
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
	
	//파일 목록을 리턴 하는 메소드
	public List<FileDto> getList(FileDto dto){
		SqlSession session=null;
		List<FileDto> list=null;
		try {
			session=factory.openSession();	// commit 필요없으므로
			/*
			 *  .selectList() 인 경우에는 
			 *  resultType : List 의 Generic type 이다. 
			 */
			list=session.selectList("file.getList", dto);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (session != null) session.close();
		}		
		return list;
	} // getList()
	
	//전체 row의 갯수를 리턴하는 메소드
	public int getCount() {
		SqlSession session=null;
		int count=0;
		try {
			session=factory.openSession();
			count=session.selectOne("file.getCount");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		return count;
	}
	
}//class








