package android;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class QueryBean {
	Connection conn;
	Statement stmt;
	ResultSet rs;

	public QueryBean() {
		conn = null;
		stmt = null;
		rs = null;
	}

	public void getConnection() {
		try {
			conn = DBConnection.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}

		try {
			stmt = conn.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public void closeConnection() {
		if (stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public ArrayList getReservationInfo(String email) throws Exception {

		int result = 0;

		StringBuffer sb = new StringBuffer();
		PreparedStatement pstmt = null;

		sb.append(" SELECT R.shop_title, R.res_date, R.res_customer FROM RESERVATION R ");
		sb.append(" INNER JOIN SHOPUSER U ");
		sb.append(" ON U.USER_EMAIL=R.USER_EMAIL ");
		sb.append(" INNER JOIN SHOP S ");
		sb.append(" ON S.SHOP_TITLE = R.SHOP_TITLE ");
		sb.append(" WHERE R.USER_EMAIL = '" + email + "'");
		sb.append(" AND R.RES_DATE>=TO_CHAR(SYSDATE, 'yyyy-mm-dd') ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = stmt.executeQuery(sb.toString());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		ArrayList res = new ArrayList();
		while (rs.next()) {
			res.add(rs.getString(1));
			res.add(rs.getString(2));
			res.add(rs.getString(3));

		}
		System.out.println(sb.toString());
		return res;
	}

	public String getReservationInsert(String USER_EMAIL, String SHOP_TITLE, String RES_DATE, String RES_TIME,
			String RES_CUSTOMER, String SHOP_ID, String REV_PHONE, String RES_NAME, String check) throws Exception {
		String time_h, time_m;
		if ((RES_TIME.substring(0, 2)).equals("AM")) {
			time_h = RES_TIME.substring(3, RES_TIME.indexOf("시"));
		} else {
			int temp = Integer.parseInt(RES_TIME.substring(3, RES_TIME.indexOf("시")));
			time_h = "" + (temp + 12);
		}
		time_m = RES_TIME.substring(RES_TIME.indexOf("시") + 2, RES_TIME.indexOf("분"));

		StringBuffer sb = new StringBuffer();
		PreparedStatement pstmt = null;
		sb.append(" INSERT INTO ");
		sb.append("RESERVATION(USER_EMAIL, SHOP_TITLE, RES_DATE, RES_CUSTOMER,"
				+ "SHOP_ID,RESERVE_IDX,REV_PHONE,RES_NAME)");
		sb.append(" VALUES('" + USER_EMAIL + "', '" + SHOP_TITLE + "', TO_DATE('" + RES_DATE + "-" + time_h + ":"
				+ time_m + ":00" + "', 'YYYY/MM/DD-HH24:MI:SS'), " + RES_CUSTOMER + ", '" + SHOP_ID + "',"
				+ "SEQ_RESERVE_IDX.NEXTVAL, '" + REV_PHONE + "', '" + RES_NAME + "') ");
		

		try {
			pstmt = conn.prepareStatement(sb.toString());
			stmt.executeQuery(sb.toString());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		System.out.println(sb.toString());
		
		if(check != null){
			StringBuffer sb2 = new StringBuffer();

			sb2.append("SELECT");
			sb2.append(" RESERVE_IDX "); 
			sb2.append("FROM");
			sb2.append(" RESERVATION ");
			sb2.append("WHERE");
			sb2.append(" RES_DATE=TO_DATE('" + RES_DATE + "-" + time_h + ":"
				+ time_m + ":00" + "', 'YYYY/MM/DD-HH24:MI:SS')");

			rs = stmt.executeQuery(sb2.toString());
			System.out.println(sb2.toString());
			
			ArrayList res = new ArrayList();
			while (rs.next()) {
				res.add(rs.getString(1));
				break;
			}
			return res.get(0).toString();
		}
		return "1";
	}

	public ArrayList getUserInfo(String email, String pw) throws Exception {

		int result = 0;

		StringBuffer sb = new StringBuffer();
		PreparedStatement pstmt = null;

		sb.append(" SELECT ");
		sb.append(" USER_EMAIL,USER_PW,USER_NAME,USER_GENDER,USER_BIRTH,USER_PHONE,IS_OWNER,POINT,USER_PHOTO,USER_IDX");
		sb.append(" FROM ");
		sb.append(" ShopUser ");
		sb.append(" WHERE ");
		/* sb.append(" USER_EMAIL LIKE '%" + strUser + "%' "); */
		sb.append(" USER_EMAIL = '" + email + "'");
		/* sb.append(" \'test@bobpool.com\' "); */
		sb.append(" AND ");
		sb.append(" USER_PW = '" + pw + "'");
		/* sb.append(" \'1234\' "); */

		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = stmt.executeQuery(sb.toString());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		ArrayList res = new ArrayList();
		while (rs.next()) {
			res.add(rs.getString(1));
			res.add(rs.getString(2));
			res.add(rs.getString(3));
			res.add(rs.getString(4));
			res.add(rs.getString(5));
			res.add(rs.getString(6));
			res.add(rs.getString(7));
			res.add(rs.getString(8));
			res.add(rs.getString(9));
			res.add(rs.getString(10));

		}
		System.out.println(sb.toString());
		return res;
	}

	public ArrayList getShopList(String loc, String food_type, String search) throws Exception {

		StringBuffer sb = new StringBuffer();

		sb.append(" SELECT ");
		sb.append("SHOP_TITLE, SHOP_ADDR, FOOD_TYPE, SHOP_SCORE, SHOP_TIP, SHOP_ID");
		sb.append(" FROM ");
		sb.append("Shop");
		if (search == null) {
			if(loc != null){
				if(!loc.equals("전체")){
					sb.append(" WHERE SHOP_ADDR LIKE '%" + loc + "%' ");
				}
			}
			else if (food_type != null) {
				if(!food_type.equals("전체")){
					sb.append(" WHERE FOOD_TYPE LIKE '%" + food_type + "%' ");
				}
			}
		}else{
			if(loc != null){
				if(loc.equals("전체")){
					sb.append(" WHERE SHOP_TITLE LIKE '%" + search + "%' or");
					sb.append(" SHOP_ADDR LIKE '%" + search + "%' or");
					sb.append(" FOOD_TYPE LIKE '%" + search + "%' or");
					sb.append(" HASH_TAG LIKE '%" + search + "%'");
				}else{
					sb.append(" WHERE (SHOP_TITLE LIKE '%" + search + "%' or");
					sb.append(" FOOD_TYPE LIKE '%" + search + "%' or");
					sb.append(" HASH_TAG LIKE '%" + search + "%') and");
					sb.append(" SHOP_ADDR LIKE '%" + loc + "%'");
				}
			}
			else if (food_type != null) {
				if(food_type.equals("전체")){
					sb.append(" WHERE SHOP_TITLE LIKE '%" + search + "%' or");
					sb.append(" SHOP_ADDR LIKE '%" + search + "%' or");
					sb.append(" FOOD_TYPE LIKE '%" + search + "%' or");
					sb.append(" HASH_TAG LIKE '%" + search + "%'");
				}else{
					sb.append(" WHERE (SHOP_TITLE LIKE '%" + search + "%' or");
					sb.append(" SHOP_ADDR LIKE '%" + search + "%' or");
					sb.append(" HASH_TAG LIKE '%" + search + "%') and");
					sb.append(" FOOD_TYPE LIKE '%" + food_type + "%'");
				}
			}
		}
		rs = stmt.executeQuery(sb.toString());

		ArrayList res = new ArrayList();
		while (rs.next()) {
			res.add(rs.getString(1));
			res.add(rs.getString(2));
			res.add(rs.getString(3));
			res.add(rs.getString(4));
			res.add(rs.getString(5));
			res.add(rs.getString(6));

		}
		System.out.println(sb.toString());
		return res;

	}

	public ArrayList getShopInfoList(String shop_id) throws Exception {

		StringBuffer sb = new StringBuffer();

		sb.append(" SELECT ");
		sb.append(" SHOP_TITLE, SHOP_ADDR, FOOD_TYPE, SHOP_TIP, BUDGET, SHOP_RESERVE,"
				+ " SHOP_COMMENT, SHOP_VIEW, SHOP_SCORE, SHOP_PHONE, SHOP_TIME, SHOP_ADDINFO,"
				+ " SHOP_TB, SHOP_ALCOHOL, SHOP_CAR, SHOP_CLOSE, SHOP_REVIEW, HASH_TAG, SHOP_PHOTO, SHOP_SUBPHOTO, SHOP_ID");
		sb.append(" FROM ");
		sb.append(" Shop ");
		sb.append(" WHERE SHOP_ID ='" + shop_id + "'");

		rs = stmt.executeQuery(sb.toString());

		ArrayList res = new ArrayList();
		while (rs.next()) {
			res.add(rs.getString(1));
			res.add(rs.getString(2));
			res.add(rs.getString(3));
			res.add(rs.getString(4));
			res.add(rs.getString(5));
			res.add(rs.getString(6));
			res.add(rs.getString(7));
			res.add(rs.getString(8));
			res.add(rs.getString(9));
			res.add(rs.getString(10));
			res.add(rs.getString(11));
			res.add(rs.getString(12));
			res.add(rs.getString(13));
			res.add(rs.getString(14));
			res.add(rs.getString(15));
			res.add(rs.getString(16));
			res.add(rs.getString(17));
			res.add(rs.getString(18));
			res.add(rs.getString(19));
			res.add(rs.getString(20));
			res.add(rs.getString(21));
		}
		System.out.println(sb.toString());
		return res;

	}

	public ArrayList getMenuList(String Shop_id) throws Exception {

		StringBuffer sb = new StringBuffer();

		sb.append(" SELECT ");
		sb.append(" FOOD_NAME, FOOD_PRICE, FOOD_INFO");
		sb.append(" FROM ");
		sb.append(" MENU ");
		if (Shop_id != null) {
			sb.append(" WHERE SHOP_ID ='" + Shop_id + "'");
		}

		rs = stmt.executeQuery(sb.toString());

		ArrayList res = new ArrayList();
		while (rs.next()) {
			res.add(rs.getString(1));
			res.add(rs.getString(2));
			res.add(rs.getString(3));

		}
		System.out.println(sb.toString());
		return res;

	}

	public ArrayList getReviewList(String Shop_id) throws Exception {

		StringBuffer sb = new StringBuffer();

		sb.append(" SELECT ");
		sb.append(
				" USER_EMAIL, REVIEW, TO_CHAR(REVIEW_DATE,'YYYY-MM-DD HH24:MI'), REVIEW_SCORE, LIKE_REVIEW, HATE_REVIEW, REVIEW_IDX");
		sb.append(" FROM ");
		sb.append(" REVIEW ");
		if (Shop_id != null) {
			sb.append(" WHERE SHOP_ID ='" + Shop_id + "'");
		}

		rs = stmt.executeQuery(sb.toString());

		ArrayList res = new ArrayList();
		while (rs.next()) {
			res.add(rs.getString(1));
			res.add(rs.getString(2));
			res.add(rs.getString(3));
			res.add(rs.getString(4));
			res.add(rs.getString(5));
			res.add(rs.getString(6));
			res.add(rs.getString(7));
		}
		System.out.println(sb.toString());
		return res;

	}

	public ArrayList getReviewLH(String user_email) throws Exception {

		StringBuffer sb = new StringBuffer();

		sb.append("SELECT");
		sb.append(" l.review_idx, h.review_idx ");
		sb.append("FROM");
		sb.append(" review_like l FULL OUTER JOIN review_hate h ");
		sb.append("ON");
		sb.append(" l.user_email = h.user_email ");
		sb.append("WHERE");
		sb.append(" l.user_email='" + user_email + "' ");

		rs = stmt.executeQuery(sb.toString());

		ArrayList res = new ArrayList();
		while (rs.next()) {
			res.add(rs.getString(1));
			res.add(rs.getString(2));
		}
		System.out.println(sb.toString());
		return res;

	}

	public void insertReviewLike(String user_email, String shop_id, String review_idx) throws Exception {

		StringBuffer sb = new StringBuffer();

		sb.append("INSERT INTO REVIEW_LIKE");
		sb.append(" (USER_EMAIL, SHOP_ID, REVIEW_IDX) ");
		sb.append("VALUES");
		sb.append(" ('" + user_email + "', '" + shop_id + "', '" + review_idx + "') ");

		stmt.executeQuery(sb.toString());
		System.out.println(sb.toString());

		StringBuffer sb2 = new StringBuffer();

		sb2.append("UPDATE REVIEW");
		sb2.append(" SET LIKE_REVIEW = LIKE_REVIEW + 1 WHERE REVIEW_IDX = '" + review_idx + "'");

		stmt.executeQuery(sb2.toString());
		System.out.println(sb2.toString());

	}

	public void insertReviewHate(String user_email, String shop_id, String review_idx) throws Exception {

		StringBuffer sb = new StringBuffer();

		sb.append("INSERT INTO REVIEW_HATE");
		sb.append(" (USER_EMAIL, SHOP_ID, REVIEW_IDX) ");
		sb.append("VALUES");
		sb.append(" ('" + user_email + "', '" + shop_id + "', '" + review_idx + "') ");

		stmt.executeQuery(sb.toString());
		System.out.println(sb.toString());

		StringBuffer sb2 = new StringBuffer();

		sb2.append("UPDATE REVIEW");
		sb2.append(" SET HATE_REVIEW = HATE_REVIEW + 1 WHERE REVIEW_IDX = '" + review_idx + "'");

		stmt.executeQuery(sb2.toString());
		System.out.println(sb2.toString());

	}
	
	public void insertReview(String shop_id, String user_email, String review_score, String review) throws Exception {

		StringBuffer sb = new StringBuffer();

		sb.append("INSERT INTO REVIEW");
		sb.append(" VALUES ");
		sb.append("(SEQ_REVIEW_IDX.NEXTVAL, '" + shop_id + "', '" + user_email + "', " + review_score + ", '"+review+"', SYSDATE, 0,0,null)");

		stmt.executeQuery(sb.toString());
		System.out.println(sb.toString());


	}

	public void updatePoint(String user_email, String point) throws Exception {

		StringBuffer sb = new StringBuffer();

		sb.append("UPDATE SHOPUSER");
		sb.append(" SET POINT = POINT + " + point + " WHERE USER_EMAIL = '" + user_email + "' ");

		stmt.executeQuery(sb.toString());
		System.out.println(sb.toString());

	}

	public void insertReserveOrder(String user_email, String food_name, String shop_id, String food_count,
			String table_num, String is_pay) throws Exception {
		StringBuffer sb;

		String[] food_nameArr = food_name.split(",");
		String[] food_countArr = food_count.split(",");
		String[] id_payArr = is_pay.split(",");

		for (int i = 0; i < food_nameArr.length; i++) {
			sb = new StringBuffer();
			sb.append("INSERT INTO RESERVE_ORDER");
			sb.append(" (USER_EMAIL, FOOD_NAME, SHOP_ID, FOOD_COUNT,table_number, IS_PAY) ");
			sb.append("VALUES");
			sb.append(" ('" + user_email + "', '" + food_nameArr[i] + "', '" + shop_id + "', " + food_countArr[i] + ", "
					+ table_num + ", " + id_payArr[i] + ") ");

			stmt.executeQuery(sb.toString());
			System.out.println(sb.toString());
		}
	}

	public ArrayList getReserveOrder(String shop_id, String user_email) throws Exception {
		StringBuffer sb = new StringBuffer();
		if(shop_id != null){
			sb.append("SELECT FOOD_NAME, FOOD_COUNT, IS_PAY");
			sb.append(" FROM ");
			sb.append("RESERVE_ORDER");
			sb.append(" WHERE ");
			sb.append("USER_EMAIL = '" + user_email + "'");
			sb.append(" and SHOP_ID = '" + shop_id + "'");
		}else{
			sb.append("SELECT s.shop_title, p.pay_point, TO_CHAR(p.pay_date, 'YYYY/MM/DD')");
			sb.append(" FROM ");
			sb.append("PAYMENT p, SHOP s");
			sb.append(" WHERE ");
			sb.append("p.SHOP_ID = s.SHOP_ID and p.user_email = '"+user_email+"'");
		}

		
		
		rs = stmt.executeQuery(sb.toString());

		ArrayList res = new ArrayList();
		while (rs.next()) {
			res.add(rs.getString(1));
			res.add(rs.getString(2));
			res.add(rs.getString(3));
		}
		System.out.println(sb.toString());
		return res;

	}
	
	public void insertPayment(String user_email, String shop_id,
			String pay_point,String table_num, String reserve_idx, String food_name, String food_count) throws Exception {
		
			StringBuffer sb = new StringBuffer();
			sb.append("INSERT INTO PAYMENT");
			sb.append(" (USER_EMAIL, SHOP_ID, PAY_POINT, PAY_DATE, PAY_IDX) ");
			sb.append("VALUES");
			sb.append(" ('" + user_email +"', '" + shop_id + "', " + pay_point + ","
					+ "SYSDATE, SEQ_PAYMENT_IDX.NEXTVAL) ");

			stmt.executeQuery(sb.toString());
			System.out.println(sb.toString());
			
			if(reserve_idx == null){
				StringBuffer sb2 = new StringBuffer();
				sb2.append("UPDATE RESERVE_ORDER");
				sb2.append(" SET IS_PAY = 0, PAY_DATE = SYSDATE ");
				sb2.append("WHERE");
				sb2.append( " USER_EMAIL = '" + user_email + "' and TABLE_NUMBER = "+table_num+" and IS_PAY > 0");

				stmt.executeQuery(sb2.toString());
				System.out.println(sb2.toString());
			}else{
				String[] food_nameArr = food_name.split(",");
				String[] food_countArr = food_count.split(",");
				StringBuffer sb2;
				
				for (int i = 0; i < food_nameArr.length; i++) {
					sb2 = new StringBuffer();
					sb2.append("INSERT INTO RESERVE_ORDER");
					sb2.append(" (USER_EMAIL, FOOD_NAME, SHOP_ID, FOOD_COUNT,PAY_DATE, RESERVE_IDX, IS_PAY) ");
					sb2.append("VALUES");
					sb2.append(" ('" + user_email + "', '" + food_nameArr[i] + "', '" + shop_id + "', " + food_countArr[i] + ", "
							+"SYSDATE, "+ reserve_idx + ", 0) ");

					stmt.executeQuery(sb2.toString());
					System.out.println(sb2.toString());
				}
			}
			
			StringBuffer sb3 = new StringBuffer();
			sb3.append("UPDATE SHOPUSER");
			sb3.append(" SET POINT = POINT - "+pay_point);
			sb3.append(" WHERE");
			sb3.append(" USER_EMAIL = '"+user_email+"'");

			stmt.executeQuery(sb3.toString());
			System.out.println(sb3.toString());
			
			StringBuffer sb4 = new StringBuffer();
			sb4.append("UPDATE SHOPUSER");
			sb4.append(" SET POINT = POINT + "+pay_point);
			sb4.append(" WHERE");
			sb4.append(" USER_EMAIL = (SELECT USER_EMAIL FROM SHOP WHERE SHOP_ID = '"+shop_id+"')");

			stmt.executeQuery(sb4.toString());
			System.out.println(sb4.toString());
		
	}
	
	public String insertJoin(String user_email, String user_pw, String user_name,
			String user_gender, String user_birth, String user_phone) {
		user_email = user_email.trim();
		user_pw = user_pw.trim();
		user_name = user_name.trim();
		user_gender = user_gender.trim();
		user_birth = user_birth.trim();
		user_phone = user_phone.trim();
		StringBuffer sb = new StringBuffer();
		sb.append("INSERT INTO SHOPUSER");
		sb.append(" VALUES ");
		sb.append("('"+user_email+"', '"+user_pw+"', '"+user_name+"', '"
		+user_gender+"', '"+user_birth+"', '"+user_phone+"', '0', SYSDATE,"
				+ " 0, SEQ_USER_IDX.NEXTVAL, 'user2.png', null, 0)");
		
		String check = "1";
		try {
			stmt.executeQuery(sb.toString());
		} catch (Exception e) {
			check = "0";
		}
		
		System.out.println(sb.toString());
		return check;

	}

}
