package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.io.IOException;


import bbs.Bbs;

public class UserDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS?serverTimezone=UTC";
			String dbID = "root";
			String dbPaswword = "dlatkwkd13@";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPaswword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1;
				}
				else
					return 0;
				
			}
			return -1; //아이디가 없다고 알려줌
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2;
	}
	
	public int getjoinNext() {
		String SQL = "SELECT sn_seq FROM User ORDER BY sn_seq DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; //첫 번째 게시물인 경우
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터 오휴
	}
	
	public int join(User user) {
		
		String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, ?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			pstmt.setInt(6, getjoinNext());
			return pstmt.executeUpdate();
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1;
		
	}
	
	
	public ArrayList<User> getList(int pageNumber){
		String SQL = "SELECT * FROM USER where sn_seq < ? ORDER BY sn_seq DESC limit 10";
		ArrayList<User> list = new ArrayList<User>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  getjoinNext() - (pageNumber -1)*10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				User user = new User();
				user.setUserID(rs.getString(1));
				user.setUserPassword(rs.getString(2));
				user.setUserName(rs.getString(3));
				user.setUserGender(rs.getString(4));
				user.setUserEmail(rs.getString(5));
				list.add(user);
				
			}
			return list;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; 
	}
	
	public boolean nextPage(int pageNumber){
		String SQL = "SELECT * FROM User WHERE sn_seq < ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  getjoinNext() - (pageNumber -1)*10);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false; //데이터 오휴
	}
	
	
	public User getUser(String userID) {
		String SQL = "SELECT * FROM User WHERE userID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				User user = new User();
				user.setUserID(rs.getString(1));
				user.setUserPassword(rs.getString(2));
				user.setUserName(rs.getString(3));
				user.setUserGender(rs.getString(4));
				user.setUserEmail(rs.getString(5));
				user.setSn_seq(rs.getInt(6));
				return user;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null; //데이터 오휴
	}
	
	public int update(String userID, String userPassword, String userName, String userGender, String userEmail) {
		
		String SQL = "UPDATE user SET userPassword = ?, userName = ?, userGender = ?, userEmail = ? WHERE userID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, userPassword);
			pstmt.setString(2, userName);
			pstmt.setString(3, userGender);
			pstmt.setString(4, userEmail);
			pstmt.setString(5, userID);
			return pstmt.executeUpdate(); 
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int delete(String userID) {
		
		String SQL = "DELETE FROM user where userID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, userID);
			return pstmt.executeUpdate(); 
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

}
