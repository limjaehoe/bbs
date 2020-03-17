package estimate;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.*;

import bbs.Bbs;

public class EstimateDAO {

	private Connection conn;
	private ResultSet rs;
	
	public EstimateDAO() {
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
	
	public ArrayList<Estimate> getEstimateResult(String old , String old2 , String userPlan, String userGender, String userGunbun){
		String SQL = "SELECT sn_seq, ds_company,"+ old2 +" FROM t_plan WHERE ds_plan= ? and ds_gubun= ?  and ds_sex= ? and ds_old= ? and ds_bojang ='합계보험료' order by sn_seq desc ";
		ArrayList<Estimate> list = new ArrayList<Estimate>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userPlan);
			pstmt.setString(2, userGunbun);
			pstmt.setString(3, userGender);
			pstmt.setString(4, old);
			System.out.println(pstmt);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Estimate estimate = new Estimate();
				estimate.setSn_seq(rs.getInt(1));
				estimate.setCompany(rs.getString(2));
				estimate.setDs(rs.getString(3));
				list.add(estimate);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; //데이터 오휴
	}
	
	
	public ArrayList<Estimate> getEstimateResultDetail(String old , String old2, String old3 , String userPlan, String userGender, String userGunbun, String company){
		String SQL = "SELECT sn_seq, ds_bojang, "+ old2 + "," + old3 +" FROM t_plan WHERE ds_plan= ? and ds_gubun= ?  and ds_sex= ? and ds_old= ? and ds_company = ? order by ty_gubun desc, sn_seq asc ";
		ArrayList<Estimate> list = new ArrayList<Estimate>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userPlan);
			pstmt.setString(2, userGunbun);
			pstmt.setString(3, userGender);
			pstmt.setString(4, old);
			pstmt.setString(5, company);
			System.out.println(pstmt);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Estimate estimate = new Estimate();
				estimate.setSn_seq(rs.getInt(1));
				estimate.setBojang(rs.getString(2));
				estimate.setMoney(rs.getString(3));
				estimate.setMoney2(rs.getString(4));
				
				list.add(estimate);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; //데이터 오휴
	}
	
	
	public String getHashmap_old(String temp) {
		 HashMap<String, String> map = new HashMap<String, String>();//해쉬맵 생성

        map.put("0", "00-10");//값을 넣어줌
        map.put("1", "11-20");
        map.put("2", "21-30");
        map.put("3", "31-40");
        map.put("4", "41-50");
        map.put("5", "51-60");
        map.put("6", "61-70");
        map.put("7", "71-80");
        
		return map.get(temp);
	}
	
	public String getHashmap_old2(String temp) {
		 HashMap<String, String> map = new HashMap<String, String>();//해쉬맵 생성

       map.put("fetus","ds_00");//값을 넣어줌
       map.put("1", "ds_10");
       map.put("2", "ds_20");
       map.put("3", "ds_30");
       map.put("4", "ds_40");
       map.put("5", "ds_50");
       map.put("6", "ds_60");
       map.put("7", "ds_70");
       map.put("8", "ds_80");
       map.put("9", "ds_90");
       map.put("0", "ds_t0");
       
		return map.get(temp);
	}
	
	public String getHashmap_old3(String temp) {
		 HashMap<String, String> map = new HashMap<String, String>();//해쉬맵 생성

	   map.put("fetus","ds_01");//값을 넣어줌
       map.put("1", "ds_11");
       map.put("2", "ds_21");
       map.put("3", "ds_31");
       map.put("4", "ds_41");
       map.put("5", "ds_51");
       map.put("6", "ds_61");
       map.put("7", "ds_71");
       map.put("8", "ds_81");
       map.put("9", "ds_91");
       map.put("0", "ds_t1");
       
		return map.get(temp);
	}
	
}

