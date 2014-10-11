package com.iflytek.bbs.dao;

import java.util.List;

import com.iflytek.bbs.entity.PostInfo;

public interface PostInfoDAO {

	//发帖
	public void add(PostInfo poin);
	
	//删帖
	public void delete(PostInfo poin);
	
	//查找所有帖子
	public List<PostInfo> selectAll(PostInfo poin);
	
	//按boardName查帖
	public List<PostInfo> selectByboardName(String boardName,int page);
	
	//按title查询帖子
	public List<PostInfo> selectByTitle(PostInfo poin);
	
	//修改发帖
	public void updatePost(PostInfo poin);
	
	//获取页数
	public int getPageCount(String boardName);
	
	//查询同主体帖子的数量
	public int getBoardNameNum(String boardName);
	
	//获取最新发帖信息
	public List<PostInfo> getLatestPost(String boardName);
}
