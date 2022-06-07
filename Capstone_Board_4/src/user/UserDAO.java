package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

// 여기도 회의하면서 바꾸어야 할 듯?

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	// constructor
	public UserDAO() {
		try { // USE BBS가 아니라서 아래 BBS 바꿔줘야 하고 아이디, 비번 마찬가지 -> 해결
			String dbURL = "jdbc:mysql://localhost:3306/youtube"; // database url
			String dbID = "root";
			String dbPassword = "root";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	/*
	 * TABLE은 USER로 동일
	 * FIELD는 ID, UNAME, UPWD, UEMAIL, USTUDENTNUMBER
	 * 특이하게 ID는 INT 형식으로 변경해주어야 함
	 */
	
	// 로그인 시도 함수
	public int login(String userID, String userPassword) {
		// 아래 SQL 문 바꿔줘야 함
		String SQL = "SELECT upwd FROM USER WHERE ustudentnumber = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			// setString이 아닐 수 있음
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1; // 로그인 성공
				}	
				else
					return 0; // 비밀번호 불일치
			}
			return -1; // 아이디 없음
		} catch(Exception e) {
			e.printStackTrace();
		}    
		return -2; // 데이터 베이스 오류
	}
	
	// 회원가입 시도 함수
	public int join(UserDTO user) {
		// 역시 SQL 문 변경해줘야 할 듯
		String SQL = "INSERT INTO USER VALUES (?,?,?,?,?)";
		
		try { // 아래 get 함수들 다 이름 바꿔줘야 할 거 같음
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, user.getId());
			pstmt.setString(2, user.getUpwd());
			pstmt.setString(3, user.getUname());
			pstmt.setString(4, user.getUstudentnumber());
			pstmt.setString(5, user.getUemail());
			
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return -1; // db 오류
	}
}
