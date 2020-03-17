package admin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import estimate.Estimate;

public class AdminDAO {

	private Connection conn;
	private ResultSet rs;
	
	public AdminDAO() {
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
	
	public int deleteAge(String ds_plan, String ds_company, String ds_gubun, String ds_sex, String ds_old) {
		
		String SQL = "DELETE FROM t_plan where ds_plan = ? and ds_company = ? and ds_gubun = ? and ds_sex = ? and ds_old = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, ds_plan);
			pstmt.setString(2, ds_company);
			pstmt.setString(3, ds_gubun);
			pstmt.setString(4, ds_sex);
			pstmt.setString(5, ds_old);
			return pstmt.executeUpdate(); 
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	
	public int deleteGubun(String ds_plan, String ds_company, String ds_gubun) {
		
		String SQL = "DELETE FROM t_plan where ds_plan = ? and ds_company = ? and ds_gubun = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, ds_plan);
			pstmt.setString(2, ds_company);
			pstmt.setString(3, ds_gubun);
			return pstmt.executeUpdate(); 
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int deleteCompany(String ds_plan, String ds_company) {
		
		String SQL = "DELETE FROM t_plan where ds_plan = ? and ds_company = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, ds_plan);
			pstmt.setString(2, ds_company);
			return pstmt.executeUpdate(); 
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	
	public ArrayList<Admin> getSelectResult(String ds_plan , String ds_company , String ds_sex, String ds_gubun, String ds_old){
		String SQL =  "select ds_bojang,ds_00,ds_01,ds_10,ds_11,ds_20,ds_21,ds_30,ds_31,ds_40,ds_41,ds_50,ds_51,ds_60,ds_61,ds_70,ds_71,ds_80,ds_81,ds_90,ds_91,ds_t0,ds_t1 from t_plan where ds_plan = ? and ds_company = ? and ds_sex = ? and ds_gubun = ? and ds_old = ? order by sn_seq asc ";
		ArrayList<Admin> list = new ArrayList<Admin>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, ds_plan);
			pstmt.setString(2, ds_company);
			pstmt.setString(3, ds_sex);
			pstmt.setString(4, ds_gubun);
			pstmt.setString(5, ds_old);
			System.out.println(pstmt);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Admin admin = new Admin();
				admin.setDs_bojang(rs.getString(1));
				admin.setDs_00(rs.getString(2));
				admin.setDs_01(rs.getString(3));
				admin.setDs_10(rs.getString(4));
				admin.setDs_11(rs.getString(5));
				admin.setDs_20(rs.getString(6));
				admin.setDs_21(rs.getString(7));
				admin.setDs_30(rs.getString(8));
				admin.setDs_31(rs.getString(9));
				admin.setDs_40(rs.getString(10));
				admin.setDs_41(rs.getString(11));
				admin.setDs_50(rs.getString(12));
				admin.setDs_51(rs.getString(13));
				admin.setDs_60(rs.getString(14));
				admin.setDs_61(rs.getString(15));
				admin.setDs_70(rs.getString(16));
				admin.setDs_71(rs.getString(17));
				admin.setDs_80(rs.getString(18));
				admin.setDs_81(rs.getString(19));
				admin.setDs_90(rs.getString(20));
				admin.setDs_91(rs.getString(21));
				admin.setDs_t0(rs.getString(22));
				admin.setDs_t1(rs.getString(23));
				list.add(admin);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; //µ•¿Ã≈Õ ø¿»ﬁ
	}
	
}
