package com.iflytek.bbs.entity;

public class ReplyInfo {
	
	private int replyId;
	private String replyTitle;
	private String replyContent;
	private String replyAuthor;
	private String replyTime;
	private String boardName;
	private String topicName;
	
	public ReplyInfo() {
		
	}

	public ReplyInfo(String replyTitle, String replyContent,
			String replyAuthor, String replyTime, String boardName,
			String topicName) {
	
		this.replyTitle = replyTitle;
		this.replyContent = replyContent;
		this.replyAuthor = replyAuthor;
		this.replyTime = replyTime;
		this.boardName = boardName;
		this.topicName = topicName;
	}

	public ReplyInfo(int replyId, String replyTitle, String replyContent,
			String replyAuthor, String replyTime, String boardName,
			String topicName) {
		super();
		this.replyId = replyId;
		this.replyTitle = replyTitle;
		this.replyContent = replyContent;
		this.replyAuthor = replyAuthor;
		this.replyTime = replyTime;
		this.boardName = boardName;
		this.topicName = topicName;
	}

	public int getReplyId() {
		return replyId;
	}

	public void setReplyId(int replyId) {
		this.replyId = replyId;
	}

	public String getReplyTitle() {
		return replyTitle;
	}

	public void setReplyTitle(String replyTitle) {
		this.replyTitle = replyTitle;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getReplyAuthor() {
		return replyAuthor;
	}

	public void setReplyAuthor(String replyAuthor) {
		this.replyAuthor = replyAuthor;
	}

	public String getReplyTime() {
		return replyTime;
	}

	public void setReplyTime(String replyTime) {
		this.replyTime = replyTime;
	}

	public String getBoardName() {
		return boardName;
	}

	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}

	public String getTopicName() {
		return topicName;
	}

	public void setTopicName(String topicName) {
		this.topicName = topicName;
	}
	

}
