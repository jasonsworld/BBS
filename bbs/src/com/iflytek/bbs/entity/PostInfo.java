package com.iflytek.bbs.entity;

public class PostInfo {
	private int postId;
	private String title;
	private String content;
	private String author;
	private String postTime;
	private String boardName;
	private String topicName;
	
	public PostInfo() {

	}

	public PostInfo(String title, String content, String author,
			String postTime, String boardName, String topicName) {
		
		this.title = title;
		this.content = content;
		this.author = author;
		this.postTime = postTime;
		this.boardName = boardName;
		this.topicName = topicName;
	}

	public String getTopicName() {
		return topicName;
	}

	public void setTopicName(String topicName) {
		this.topicName = topicName;
	}

	public int getPostId() {
		return postId;
	}

	public void setPostId(int postId) {
		this.postId = postId;
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

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPostTime() {
		return postTime;
	}

	public void setPostTime(String postTime) {
		this.postTime = postTime;
	}

	public String getBoardName() {
		return boardName;
	}

	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
	

}