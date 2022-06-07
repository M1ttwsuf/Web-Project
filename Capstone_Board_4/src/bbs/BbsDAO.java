package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

// DB 구성이 어떻게 바뀔지 모르니까 일단 후에 바꾸는 걸로

public class BbsDAO {
	private Connection conn;
	private ResultSet rs;
	// constructor
	public BbsDAO() {
		try { // db 관련 정보들 받아서 변경 -> 해결
			String dbURL = "jdbc:mysql://localhost:3306/youtube"; // database url
			String dbID = "root";
			String dbPassword = "root";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 현재 시간을 가져올 함수
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next())
				return rs.getString(1);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ""; // 데이터베이스 오류 발생 시
	}
	
	// 게시글의 번호를 가져올 함수
	public int getNext() { // 이 부분도 테이블 변경 예정
		String SQL = "SELECT bbsID FROM BBS ORDER BY bbsID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next())
				return rs.getInt(1) + 1; // 마지막 게시물의 +1
			return 1; // 첫 번째 게시물의 경우
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류 발생 시
	}
	
	// 실제로 글을 작성하는 함수
	public int write(String bbsTitle, String userID, String bbsContent) {
		// BBS 테이블 변경해야? -> 해결
		String SQL = "INSERT INTO BBS VALUES (?,?,?,?,?,?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1); // Available 이라 삭제가 아니면 1

			return pstmt.executeUpdate(); // 성공시 1을 반환
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류 발생 시
	}
	
	// 페이지 넘버에 따라 게시글 8개를 가져올 수 있게 하는 함수 -> 12개에서 줄임
	public ArrayList<BbsDTO> getList(int pageNumber){
		// 여기도 테이블 BBS 변경해야? -> 해결
		String SQL = "SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 8";
		ArrayList<BbsDTO> list = new ArrayList<BbsDTO>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 8);
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				BbsDTO bbs = new BbsDTO();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUstudentnumber(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				
				list.add(bbs);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; // 데이터베이스 오류 발생 시
	}
	
	public boolean nextPage(int pageNumber){
		// SQL 문 바꿔야 할지도 모름 -> 안해도 ㅇㅋ
		String SQL = "SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1";
		//ArrayList<Bbs> list = new ArrayList<Bbs>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 8);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false; // 데이터베이스 오류 발생 시
	}
	
	// 게시판 글 제목에 대해 접근할 수 있게 해줄 Bbs 객체를 돌려주는 함수
	public BbsDTO getBbs(int bbsID) {
		String SQL = "SELECT * FROM BBS WHERE bbsID = ?";
		//ArrayList<Bbs> list = new ArrayList<Bbs>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				BbsDTO bbs = new BbsDTO();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUstudentnumber(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				
				return bbs;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null; // 데이터베이스 오류 발생 시
	}
	// 게시글을 수정할 수 있게 해주는 함수
	public int update(int bbsID, String bbsTitle, String bbsContent) {
		String SQL = "UPDATE BBS SET bbsTitle = ?, bbsContent = ? WHERE bbsID = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bbsTitle);
			pstmt.setString(2, bbsContent);
			pstmt.setInt(3, bbsID);

			return pstmt.executeUpdate(); // 성공시 1을 반환
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류 발생 시
	}
	
	public int delete(int bbsID) {
		String SQL = "UPDATE BBS SET bbsAvailable = 0 WHERE bbsID = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);

			return pstmt.executeUpdate(); // 성공시 1을 반환
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류 발생 시
	}
}
