package test.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import test.member.dto.MemberDto;
import test.util.DbcpBean;

public class MemberDao {
	// static 선언
	private static MemberDao dao;
	// 생성자
	private MemberDao() {}
	// static getInstance()
	public static MemberDao getInstance() {
		if(dao==null) {
			dao=new MemberDao();			
		}
		return dao;		
	}
	
	//회원정보 추가하기
	public boolean insert(MemberDto dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		int flag=0;
		try {
			// Connection Pool에서 Connection 객체 가지고 오고
			conn=new DbcpBean().getConn();	
			
			String sql="INSERT INTO member(num, name, addr) VALUES (MEMBER_SEQ.NEXTVAL, ?, ?)";			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,  dto.getName());
			pstmt.setString(2,  dto.getAddr());
			flag=pstmt.executeUpdate();

		} catch (SQLException se) {
			se.printStackTrace();
		}finally {
			try{
				if(pstmt!=null)pstmt.close();
				//conn.close() 하면 Connectin 이 자동 반납된다.  connection pool에 자동 반납됨.
				if(conn!=null)conn.close();			
			} catch (Exception  exe) {}
		}
		if(flag>0) {
			return true;
		}else {
			return false;
		}		
	}
	
	//삭제
	public boolean delete(int num) {
		Connection conn=null;
		PreparedStatement  pstmt=null;
		int flag=0;
		try {
			conn=new DbcpBean().getConn();					
			String sql="DELETE FROM member WHERE num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			flag=pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch ( Exception  exe) { }
		}
		if(flag>0) {
			return true;
		}else {
			return false;
		}
	}
	
	public boolean update(MemberDto dto) {
		Connection conn=null;
		PreparedStatement  pstmt=null;
		int flag=0;
		try {
			conn=new DbcpBean().getConn();					
			String sql="UPDATE member SET name=?, addr=? WHERE num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
			pstmt.setInt(3, dto.getNum());
			flag=pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch ( Exception  exe) { }
		}
		if(flag>0) {
			return true;
		}else {
			return false;
		}
	}
	//회원정보 가져오기
	public MemberDto getData(int num) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		MemberDto dto=null;
		try {
			conn=new DbcpBean().getConn();			
			String sql="SELECT num, name, addr FROM member WHERE num=?";			
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto=new MemberDto();
				dto.setNum(rs.getInt("num")); 
				dto.setName(rs.getString("name")); 
				dto.setAddr(rs.getString("addr"));
				
			}
		}catch(SQLException se) {
			se.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception exe) {}
		}				
		return dto;		
	}
	
	//회원목록 가져오기
	public List<MemberDto> getList(){
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<MemberDto> list=new ArrayList<>();
		try {
			conn=new DbcpBean().getConn();			
			String sql="SELECT num, name, addr FROM member ORDER BY num";			
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				MemberDto dto=new MemberDto(rs.getInt("num"), 
											rs.getString("name"), 
											rs.getString("addr"));
				list.add(dto);
			}
		}catch(SQLException se) {
			se.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception exe) {}
		}				
		return list;
	}
}
