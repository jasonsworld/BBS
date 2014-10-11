package com.iflytek.bbs.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import com.iflytek.bbs.dao.BaseDAO;
import com.iflytek.bbs.dao.ReplyInfoDAO;
import com.iflytek.bbs.entity.ReplyInfo;

public class ReplyInfoDAOImpl extends BaseDAO implements ReplyInfoDAO {

	private int pageSize = 5; 
	
	//回复帖子
	public void add(ReplyInfo repin) {
	
		String sql = "INSERT INTO bbs.reply ( replyTitle, replyContent, replyAuthor, replyTime, boardName, topicName) VALUES(?, ?, ?, ?, ?, ?)";
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String replyTime = formatter.format(date);
		Connection conn = this.getConnection();
		PreparedStatement pmt = null;
		
		try {
			pmt = conn.prepareStatement(sql);
			pmt.setString(1, repin.getReplyTitle());
			pmt.setString(2, repin.getReplyContent());
			pmt.setString(3, repin.getReplyAuthor());
			pmt.setString(4, replyTime);
			pmt.setString(5, repin.getBoardName());
			pmt.setString(6, repin.getTopicName());
			pmt.execute();
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally{
			this.closeStatement(pmt);
			this.closeConnection(conn);
		}
	}

	//按boardName和topicName查找回复的帖子
	public List<ReplyInfo> selectByboardTopicName(int page, ReplyInfo repin) {
		String sql = "SELECT * FROM bbs.reply WHERE boardName = ? AND topicName = ?  LIMIT ?,?";
		int count = (page-1)*pageSize;
		
		Connection conn = this.getConnection();
		PreparedStatement pmt = null;
		ResultSet rs = null;
		List<ReplyInfo> repinList = new LinkedList<ReplyInfo>();
		
		try {
			pmt = conn.prepareStatement(sql);
			pmt.setString(1, repin.getBoardName());
			pmt.setString(2, repin.getTopicName());
			pmt.setInt(3, count);
			pmt.setInt(4, pageSize);
			rs = pmt.executeQuery();
			while(rs.next()){
				ReplyInfo rep = new ReplyInfo();
				
				rep.setReplyId(rs.getInt("replyId"));
				rep.setBoardName(rs.getString("boardName"));
				rep.setReplyAuthor(rs.getString("replyAuthor"));
				rep.setReplyContent(rs.getString("replyContent"));
				rep.setReplyTime(rs.getString("replyTime"));
				rep.setReplyTitle(rs.getString("replyTitle"));
				rep.setTopicName(rs.getString("topicName"));
				
				repinList.add(rep);
			}
		} catch (Exception e) {
		
			e.printStackTrace();
		}finally{
			this.closeResultSet(rs);
			this.closeStatement(pmt);
			this.closeConnection(conn);
		}
	
		return repinList;
	}
	
	//获取页数
	public int getPageCount(ReplyInfo repin) {
		int count = 0;
		int pageCount = 0;
		String sql = "SELECT COUNT(*) FROM bbs.reply WHERE boardName = ? AND topicName = ?";
		Connection conn = this.getConnection();
		PreparedStatement pmt = null;
		ResultSet rs = null;
		try {
			pmt = conn.prepareStatement(sql);
			pmt.setString(1, repin.getBoardName());
			pmt.setString(2, repin.getTopicName());
			rs = pmt.executeQuery();
			while(rs.next()){
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			this.closeStatement(pmt);
			this.closeConnection(conn);
		}
		
		if(count%pageSize==0){
			pageCount = count/pageSize;
		}else{
			pageCount = (count/pageSize)+1;
		}
		
		return pageCount;
	}


	//获取回帖数量
	public int getReplyCount(String topicName) {
		String sql = "SELECT COUNT(*) FROM bbs.reply WHERE topicName=?";
		Connection conn = this.getConnection();
		PreparedStatement pmt = null;
		ResultSet rs = null;
		int replyCount = 0;
		
		try {
			pmt = conn.prepareStatement(sql);
			pmt.setString(1, topicName);
			rs = pmt.executeQuery();
			while(rs.next()){
				replyCount = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			this.closeResultSet(rs);
			this.closeStatement(pmt);
			this.closeConnection(conn);
		}
		return replyCount;
	}

	//删除回帖
	public void delReply(ReplyInfo repin) {
		String sql = "DELETE FROM bbs.reply WHERE replyId = ? ";
		Connection conn = this.getConnection();
		PreparedStatement pmt = null;
		try {
			pmt = conn.prepareStatement(sql);
			pmt.setInt(1, repin.getReplyId());
			pmt.execute();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			this.closeStatement(pmt);
			this.closeConnection(conn);
		}
		
	}
	
	//修改回帖
	public void updateReply(ReplyInfo repin) {
		String sql = "UPDATE bbs.reply SET replyTitle = ? , replyContent = ? WHERE replyId = ?";
		Connection conn = this.getConnection();
		PreparedStatement pmt = null;
		
		try {
			pmt = conn.prepareStatement(sql);
			pmt.setString(1, repin.getReplyTitle());
			pmt.setString(2, repin.getReplyContent());
			pmt.setInt(3, repin.getReplyId());
			pmt.execute();
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally{
			this.closeStatement(pmt);
			this.closeConnection(conn);
		}
	}
	
	public static void main(String[] args) {
		ReplyInfoDAO repinDAO = new ReplyInfoDAOImpl();
		ReplyInfo repin = new ReplyInfo();
		repin.setReplyId(26);
		
		repinDAO.delReply(repin);
	}

	
}
