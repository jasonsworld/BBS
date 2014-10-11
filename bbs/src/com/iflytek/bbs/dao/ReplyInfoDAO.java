package com.iflytek.bbs.dao;

import java.util.List;

import com.iflytek.bbs.entity.ReplyInfo;

public interface ReplyInfoDAO {
	
	//回复帖子
	public void add(ReplyInfo repin);
	
	//按boardName和topicName查找回复的帖子
	public List<ReplyInfo> selectByboardTopicName(int page ,ReplyInfo repin);
	
	//删除回帖
	public void delReply(ReplyInfo repin);
	
	//修改回帖
	public void updateReply(ReplyInfo repin);
	
	//获取页数
	public int getPageCount(ReplyInfo repin);
	
	//获取回帖数量
	public int getReplyCount(String topicName);
}
