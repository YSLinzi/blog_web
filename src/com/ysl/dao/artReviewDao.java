package com.ysl.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ysl.entity.ArtReview;
import com.ysl.toolsBean.ChangeTime;
import com.ysl.toolsBean.DB;

public class artReviewDao{
	/**
	 * <p>Title: 获取所有的评论信息</p>  
	 */
	public static List<ArtReview> getList() throws SQLException{
		List<ArtReview> list=null;
		String sql = "select review_id,review_user,review_txt,review_time,ruser_id,"
				+ "tb_artreview.isPublic,tb_artreview.art_id,art_title from tb_artreview "
				+ "INNER JOIN tb_article on tb_artreview.art_id=tb_article.art_id order by review_id";
		DB mydb=new DB();
		mydb.dops(sql, null);
		ResultSet rs=mydb.getRs();
		if(rs!=null){
			list=new ArrayList<ArtReview>();
			while(rs.next()){
				ArtReview single=new ArtReview();
				single.setReview_id(rs.getInt(1));
				single.setReview_user(rs.getString(2));
				single.setReview_txt(rs.getString(3));
				single.setReview_time(ChangeTime.dateTimeChange(rs.getTimestamp(4)));
				single.setRuser_id(rs.getInt(5));//用户id
				single.setIsPublic(rs.getInt(6));
				single.setArt_id(rs.getInt(7));//评论的文章id
				single.setArt_title(rs.getString(8));
				list.add(single);
			}
		}
		return list;
	}
	
	/**
	 * <p>Title: 删除用户评论</p>  
	 */
	public static int delete(int id) throws SQLException{
		String sql="delete from tb_artreview where review_id=?";
		DB mydb=new DB();
		return mydb.dops(sql, new Object[]{id});		
	}
	/**
	 * 根据文章id删除评论
	 */
	public static int deleteArtId(int id) throws SQLException{
		String sql="delete from tb_artreview where art_id=?";
		DB mydb=new DB();
		int flag = mydb.dops(sql, new Object[]{id});
		mydb.closed();
		return flag;
	}
	/**
	 * 根据文章id删除评论
	 */
	public static int deleteUId(int id) throws SQLException{
		String sql="delete from tb_artreview where ruser_id=?";
		DB mydb=new DB();
		int flag = mydb.dops(sql, new Object[]{id});
		mydb.closed();
		return flag;
	}
	/**
	 * <p>Title: 获取指定文章的用户评论</p>  
	 */
	
	public static List<ArtReview> getArtReviewList(int id) throws SQLException{
		Object[] params={id};
		List<ArtReview> list=null;
		String sql="SELECT * FROM tb_artreview WHERE art_id=? and isPublic=1 ORDER BY review_id";
		DB mydb=new DB();
		mydb.dops(sql, params);
		ResultSet rs=mydb.getRs();
		if(rs!=null){
			list=new ArrayList<ArtReview>();
			while(rs.next()){
				ArtReview single=new ArtReview();
				single.setReview_id(rs.getInt(1));
				single.setReview_user(rs.getString(2));
				single.setReview_txt(rs.getString(3));
				single.setReview_time(ChangeTime.dateTimeChange(rs.getTimestamp(4)));
				single.setArt_id(rs.getInt(7));//评论的文章id
				list.add(single);
			}
		}		
		return list;
	}
	/*
	 * 对文章进行评论
	 */
	public static int insert(Object[] params) throws SQLException{
		String sql="insert into tb_artreview(review_user,review_txt,review_time,ruser_id,isPublic,art_id) values(?,?,?,?,?,?)";
		DB mydb=new DB();
		int flag = mydb.dops(sql, params);
		mydb.closed();
		return flag;
	}
	
	/**
	 * @功能：获取在会员文章所有的评论
	 */
	public List<ArtReview> getUserReviewList(int id) throws SQLException{
		String sql = "select review_id,review_txt,review_user,review_time,ruser_id,tb_artreview.isPublic,tb_artreview.art_id,art_title from tb_artreview INNER JOIN tb_article on tb_article.art_id= tb_artreview.art_id where tb_article.author_id=? ORDER BY tb_artreview.art_id";
		Object[] params={id};
		List<ArtReview> artrlist=null;
		DB mydb=new DB();
		mydb.dops(sql, params);
		ResultSet rs=mydb.getRs();
		if(rs!=null){
			artrlist=new ArrayList<ArtReview>();
			while(rs.next()){
				ArtReview single=new ArtReview();
				single.setReview_id(rs.getInt(1));
				single.setReview_user(rs.getString(3));
				single.setReview_txt(rs.getString(2));
				single.setReview_time(ChangeTime.dateTimeChange(rs.getTimestamp(4)));
				single.setIsPublic(rs.getInt(6));
				single.setArt_id(rs.getInt(7));//评论的文章id
				single.setArt_title(rs.getString(8));
				artrlist.add(single);
			}
		}		
		return artrlist;
	}

	/**
	 * @功能：获取在个人主页中显示的文章
	 */
	public List getReview2(int id) throws SQLException{
		String sql="select review_id,review_user,review_txt,review_time  from tb_artreview where review_id=? order by review_time desc";
		Object[] params={id};		
		List articlelist=getList();		
		return articlelist;
	}
	
	public void insert2(Object[] params) throws SQLException{
		String sql="insert into tb_artreviewB values(?,?,?,?)";
		DB mydb=new DB();
		mydb.dops(sql, params);
	}
	/**
	 * @throws SQLException 
	 * @功能：获取个人对某篇文章的评论数量
	 */
	public Map<Integer, Integer> getReviewUserNum(int uid) throws SQLException {
		String sql="select art_id,count(art_id) as nums from tb_artreview where ruser_id=? GROUP BY art_id";
		Object[] params={uid};		
		DB mydb=new DB();
		mydb.dops(sql, params);
		ResultSet rs=mydb.getRs();
		Map<Integer, Integer> count = new HashMap<Integer, Integer>(); 
		while(rs!=null&&rs.next()) {
			count.put(rs.getInt(1),rs.getInt(2));
		}
		rs.close();
		mydb.closed();
		return count;
	}
}
