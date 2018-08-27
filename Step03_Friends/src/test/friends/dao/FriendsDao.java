package test.friends.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import test.friends.dto.FriendsDto;
import test.util.DBConnect;

public class FriendsDao {
	// static 선언
	private static FriendsDao dao;
	// 생성자
	private FriendsDao() {}
	// static getInstance()
	public static FriendsDao getInstance() {
		if(dao==null) {
			dao=new FriendsDao();			
		}
		return dao;		
	}
	
	//친구정보 추가하기
	public boolean insert(FriendsDto dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		int flag=0;
		try {
			conn=new DBConnect().getConn();	
			
			String sql="INSERT INTO Friends(num, name, phone, addr) VALUES (FRIENDS_SEQ.NEXTVAL, ?, ?, ?)";			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,  dto.getName());
			pstmt.setString(2,  dto.getPhone());
			pstmt.setString(3,  dto.getAddr());
			flag=pstmt.executeUpdate();

		} catch (SQLException se) {
			se.printStackTrace();
		}finally {
			try{
				if(pstmt!=null)pstmt.close();
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
			conn=new DBConnect().getConn();					
			String sql="DELETE FROM Friends WHERE num=?";
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
	
	public boolean update(FriendsDto dto) {
		Connection conn=null;
		PreparedStatement  pstmt=null;
		int flag=0;
		try {
			conn=new DBConnect().getConn();					
			String sql="UPDATE Friends SET name=?, phone=?, addr=? WHERE num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPhone());
			pstmt.setString(3, dto.getAddr());
			pstmt.setInt(4, dto.getNum());
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
	//친구정보 가져오기
	public FriendsDto getData(int num) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		FriendsDto dto=null;
		try {
			conn=new DBConnect().getConn();			
			String sql="SELECT num, name, phone, addr FROM Friends WHERE num=?";			
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto=new FriendsDto();
				dto.setNum(rs.getInt("num")); 
				dto.setName(rs.getString("name")); 
				dto.setPhone(rs.getString("phone")); 
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
	
	//친구목록 가져오기
	public List<FriendsDto> getList(){
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<FriendsDto> list=new ArrayList<>();
		try {
			conn=new DBConnect().getConn();			
			String sql="SELECT num, name, phone, addr FROM Friends ORDER BY num";			
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				FriendsDto dto=new FriendsDto(rs.getInt("num"), 
											rs.getString("name"), 
											rs.getString("phone"), 
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
