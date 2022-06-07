package bbs;

// 게시판 데이터 베이스 getter setter

public class BbsDTO {
	// 이거 이대로 갈지 안 갈지 모름 일단 둠, 회의하면서 바꿀 부분 
	private int bbsID;
	private String bbsTitle;
	private String ustudentnumber;
	private String bbsDate;
	private String bbsContent;
	private int bbsAvailable;
	
	public int getBbsID() {
		return bbsID;
	}
	public void setBbsID(int bbsID) {
		this.bbsID = bbsID;
	}
	public String getBbsTitle() {
		return bbsTitle;
	}
	public void setBbsTitle(String bbsTitle) {
		this.bbsTitle = bbsTitle;
	}
	public String getUstudentnumber() {
		return ustudentnumber;
	}
	public void setUstudentnumber(String ustudentnumber) {
		this.ustudentnumber = ustudentnumber;
	}
	public String getBbsDate() {
		return bbsDate;
	}
	public void setBbsDate(String bbsDate) {
		this.bbsDate = bbsDate;
	}
	public String getBbsContent() {
		return bbsContent;
	}
	public void setBbsContent(String bbsContent) {
		this.bbsContent = bbsContent;
	}
	public int getBbsAvailable() {
		return bbsAvailable;
	}
	public void setBbsAvailable(int bbsAvailable) {
		this.bbsAvailable = bbsAvailable;
	}
}
