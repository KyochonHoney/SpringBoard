package com.es.dto;

public class BoardDto {
	private int bno;
	private String writer;
	private String title;
	private String content;
	private int hitCount;
	private String writedate;
	
	public BoardDto() {  }
	public BoardDto(int bno, String writer, String title, String content, int hitCount, String writedate) {
		this.bno = bno;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.hitCount = hitCount;
		this.writedate = writedate;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHitCount() {
		return hitCount;
	}
	public void setHitCount(int hitcount) {
		this.hitCount = hitcount;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	
	
}
