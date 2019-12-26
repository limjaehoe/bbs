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
	
	
	public int join(User user) {
		
		String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			return pstmt.executeUpdate();
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1;
		
	}
	
	
	public ArrayList<User> getList(){
		String SQL = "SELECT * FROM USER";
		ArrayList<User> list = new ArrayList<User>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
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
	
	/*
	public ArrayList<User> getList2(){
		String SQL = "SELECT * FROM USER";
		ArrayList<User> list = new ArrayList<User>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			//pstmt.setInt(1,  getNext() - (pageNumber -1)*10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				
				User bbs = new User();
				bbs.setUserID(rs.getString(1));
				bbs.setUserPassword(rs.getString(2));
				bbs.setUserName(rs.getString(3));
				bbs.setUserGender(rs.getString(4));
				bbs.setUserEmail(rs.getString(5));
				list.add(bbs);
				
			
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; 
		
	}
	*/
			/*
			String id = rs.getString("userID");
			String password = rs.getString("userPassword");
			String name = rs.getString("userName");
			String gender = rs.getString("userGender");
			String email = rs.getString("userEmail");
			
			User temp = new User(id,password,name,gender,email);
			list.add(temp);
			*/
	

}
