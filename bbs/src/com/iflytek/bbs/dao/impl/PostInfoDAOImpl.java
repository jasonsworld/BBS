package com.iflytek.bbs.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import com.iflytek.bbs.dao.BaseDAO;
import com.iflytek.bbs.dao.PostInfoDAO;
import com.iflytek.bbs.entity.PostInfo;

public class PostInfoDAOImpl extends BaseDAO implements PostInfoDAO {
	
	private int pageSize = 6; 

	//发帖
	public void add(PostInfo poin) {
		String sql = "INSERT INTO bbs.postinfo (title, content, author, postTime, boardName, topicName) VALUES (?, ?, ?, ?, ?, ?)";
		
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String postTime = formatter.format(date);
		
		Connection conn = this.getConnection();
		PreparedStatement pmt = null;
		try {
			pmt = conn.prepareStatement(sql);
			pmt.setString(1,poin.getTitle());
			pmt.setString(2,poin.getContent());
			pmt.setString(3,poin.getAuthor());
			pmt.setString(4,postTime);
			pmt.setString(5,poin.getBoardName());
			pmt.setString(6,poin.getTopicName());
			pmt.execute();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			this.closeConnection(conn);
		}
	}

	//删帖
	public void delete(PostInfo poin) {
		String sql = "DELETE FROM bbs.postinfo WHERE postId = ?";
		Connection conn = this.getConnection();
		PreparedStatement pmt = null;
		try {
			pmt = conn.prepareStatement(sql);
			pmt.setInt(1, poin.getPostId());
			pmt.execute();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			this.closeStatement(pmt);
			this.closeConnection(conn);
		}

	}

	//查询所有帖子
	public List<PostInfo> selectAll(PostInfo poin) {
		// TODO Auto-generated method stub
		return null;
	}
	
	//按title查询帖子
	public List<PostInfo> selectByTitle(PostInfo poin){
		String sql = "SELECT * FROM bbs.postinfo WHERE title = ?";
		Connection conn = this.getConnection();
		PreparedStatement pmt = null;
		ResultSet rs = null;
		List<PostInfo> listpoin = new LinkedList<PostInfo>();
		
		try {
			pmt = conn.prepareStatement(sql);
			pmt.setString(1, poin.getTitle());
			rs = pmt.executeQuery();
		
			while(rs.next()){
				PostInfo po = new PostInfo();
				po.setAuthor(rs.getString("author"));
				po.setBoardName(rs.getString("boardName"));
				po.setContent(rs.getString("content"));
				po.setPostId(rs.getInt("postId"));
				po.setPostTime(rs.getString("postTime"));
				po.setTitle(rs.getString("title"));
				po.setTopicName(rs.getString("topicName"));
				listpoin.add(po);
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally{
			this.closeResultSet(rs);
			this.closeStatement(pmt);
			this.closeConnection(conn);
			
		}
		
		return listpoin;
	}

	//更新发帖
	public void updatePost(PostInfo poin) {
		String sql = "UPDATE bbs.postinfo SET title = ? , content = ? WHERE postId = ? ;";
		Connection conn = this.getConnection();
		PreparedStatement pmt = null;
		
		try {
			pmt = conn.prepareStatement(sql);
			pmt.setString(1, poin.getTitle());
			pmt.setString(2, poin.getContent());
			pmt.setInt(3, poin.getPostId());
			pmt.execute();
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally{
			this.closeStatement(pmt);
			this.closeConnection(conn);
		}
		
	}

	//按boardName查找
	public List<PostInfo> selectByboardName(String boardName, int page) {
		String sql = "SELECT * FROM bbs.postinfo WHERE boardName = ? LIMIT ?,?";
		int count = (page-1)*pageSize;
		Connection conn = this.getConnection();
		PreparedStatement pmt = null;
		ResultSet rs = null;
		List<PostInfo> poinList = new LinkedList<PostInfo>();
		
		try {
			pmt = conn.prepareStatement(sql);
			pmt.setString(1, boardName);
			pmt.setInt(2, count);
			pmt.setInt(3,pageSize);
			rs = pmt.executeQuery();
			while(rs.next()){
				PostInfo poin = new PostInfo();
				
				poin.setPostId(rs.getInt("postId"));
				poin.setTitle(rs.getString("title"));
				poin.setContent(rs.getString("content"));
				poin.setAuthor(rs.getString("author"));
				poin.setPostTime(rs.getString("postTime"));
				poin.setBoardName(rs.getString("boardName"));
				poin.setTopicName(rs.getString("topicName"));
				poinList.add(poin);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			this.closeResultSet(rs);
			this.closeStatement(pmt);
			this.closeConnection(conn);
		}
		return poinList;
	}

	//获取页数
	public int getPageCount(String boardName) {
		int count = 0;
		int pageCount = 0;
		String sql = "SELECT COUNT(*) FROM bbs.postinfo WHERE boardName = ?";
		Connection conn = this.getConnection();
		PreparedStatement pmt = null;
		ResultSet rs = null;
		try {
			pmt = conn.prepareStatement(sql);
			pmt.setString(1, boardName);
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
	
	//查询同主体帖子的数量
	public int getBoardNameNum(String boardName){
		String sql = "SELECT COUNT(*) FROM bbs.postinfo WHERE boardName = ?";
		Connection conn = this.getConnection();
		PreparedStatement pmt = null;
		ResultSet rs = null;
		int boardNum = 0;
		
		try {
			pmt = conn.prepareStatement(sql);
			pmt.setString(1, boardName);
			rs = pmt.executeQuery();
			while(rs.next()){
				boardNum = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			this.closeResultSet(rs);
			this.closeStatement(pmt);
			this.closeConnection(conn);
		}
		return boardNum;
	}

	//获取最新发帖信息
	public List<PostInfo> getLatestPost(String boardName) {
		String sql = "SELECT * FROM bbs.postinfo WHERE boardName=? ORDER BY postId DESC LIMIT 0,1";
		Connection conn = this.getConnection();
		PreparedStatement pmt = null;
		ResultSet rs = null;
		List<PostInfo> listpoin = new LinkedList<PostInfo>();
		
		try {
			pmt = conn.prepareStatement(sql);
			pmt.setString(1, boardName);
			rs = pmt.executeQuery();
			while(rs.next()){
				PostInfo po = new PostInfo();
				po.setAuthor(rs.getString("author"));
				po.setBoardName(rs.getString("boardName"));
				po.setContent(rs.getString("content"));
				po.setPostId(rs.getInt("postId"));
				po.setPostTime(rs.getString("postTime"));
				po.setTitle(rs.getString("title"));
				po.setTopicName(rs.getString("topicName"));
				listpoin.add(po);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			this.closeResultSet(rs);
			this.closeStatement(pmt);
			this.closeConnection(conn);
		}
		return listpoin;
	}



	/*public static void main(String[] args) {
		PostInfoDAO poinDAO = new PostInfoDAOImpl();
		PostInfo poin = new PostInfo();
		poin.setPostId(3);
		poin.setTitle("神马基本都是浮云");
		poin.setContent("风萧萧兮易水寒");
		
		poinDAO.updatePost(poin);
		
	}*/
}
