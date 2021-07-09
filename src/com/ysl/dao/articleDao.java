package com.ysl.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ysl.entity.Article;
import com.ysl.toolsBean.ChangeTime;
import com.ysl.toolsBean.DB;

public class articleDao{
	/**
	 * @功能：获取当前页显示的所有文章
	 */
	public List<Article> getListArticle() throws SQLException{
		String sql="select * from tb_article";
		DB mydb=new DB();
		mydb.dops(sql,null);
		ResultSet rs=mydb.getRs();
		List<Article> newArticleList = null;
		if(rs!=null){
			newArticleList=new ArrayList<Article>();
			while(rs.next()){
				Article single=new Article();
				single.setArtid(rs.getInt(1));
				single.setArt_title(rs.getString(2));
				single.setArt_content(rs.getString(3));	
				single.setArt_pubtime(ChangeTime.dateTimeChange(rs.getTimestamp(4)));
				single.setArt_readnum(rs.getInt(5));
				single.setUserName(rs.getString(6));
				single.setIsPublic(rs.getInt(7));
				newArticleList.add(single);
			}
		}
		return newArticleList;
	}
	/**
	 * @throws SQLException 
	 * @功能：删除文章
	 */
	public int delete(int id) throws SQLException{
		String sql="delete from tb_article where art_id=?";
		DB mydb=new DB();
		int flag=mydb.dops(sql, new Object[]{id});
		return flag;
	}
	/**
	 * @功能：获取当前页公开的所有文章
	 */
	public List<Article> getListArticlePub() throws SQLException{
		String sql="select * from tb_article where isPublic='1' and art_title!='无'";
		DB mydb=new DB();
		mydb.dops(sql,null);
		ResultSet rs=mydb.getRs();
		List<Article> newArticleList = null;
		if(rs!=null){
			newArticleList=new ArrayList<Article>();
			while(rs.next()){
				Article single=new Article();
				single.setArtid(rs.getInt(1));
				single.setArt_title(rs.getString(2));
				single.setArt_content(rs.getString(3));	
				single.setArt_pubtime(ChangeTime.dateTimeChange(rs.getTimestamp(4)));
				single.setArt_readnum(rs.getInt(5));
				single.setUserName(rs.getString(6));
				single.setIsPublic(rs.getInt(7));
				single.setIsReview(rs.getInt(9));
				single.setReviewNum(rs.getInt(10));
				newArticleList.add(single);
			}
		}
		return newArticleList;
	}
	
	/**
	 * @功能：累计文章关注数量
	 */	
	public int getArticleRoteNum(int id) throws SQLException{
		String sql="update tb_article SET art_readnum=art_readnum+1 where art_id=?";
		Object[] params={id};
		DB mydb=new DB();
		int flag = mydb.dops(sql, params);
		mydb.closed();
		return flag;
	}
	
	/**
	 * @throws SQLException 
	 * @功能：获取文章评论数
	 */
	public int getRevCount(int id) throws SQLException{
		int count=0;
		String sql="select count(id) from tb_artreview where review_id=?";
		Object[] params={id};
		
		DB mydb=new DB();
		mydb.dops(sql, params);
		ResultSet rs = mydb.getRs();
		if(rs!=null&&rs.next())
			count=rs.getInt(1);
		rs.close();
		mydb.closed();
		return count;
	}
	
	/**
	 * @功能：累加文章评论次数
	 */
	public static void setArtReviewCount(String id) throws SQLException{
		String sql="update tb_article set ReviewNum=ReviewNum+1 where art_id=?";
		Object[] params={id};
		DB mydb=new DB();
		mydb.dops(sql, params);
		mydb.closed();
	}
	/**
	 * @throws SQLException 
	 * @功能：获取该博主文章
	 */
	public List<Article> getUserArticle(int uid) throws SQLException{
		String sql="select * from tb_article where author_id=?";
		Object[] params={uid};
		DB mydb=new DB();
		mydb.dops(sql, params);
		ResultSet rs=mydb.getRs();
		List<Article> newArticleList = null;
		if(rs!=null){
			newArticleList=new ArrayList<Article>();
			while(rs.next()){
				Article single=new Article();
				single.setArtid(rs.getInt(1));
				single.setArt_title(rs.getString(2));
				single.setArt_content(rs.getString(3));	
				single.setArt_pubtime(ChangeTime.dateTimeChange(rs.getTimestamp(4)));
				single.setArt_readnum(rs.getInt(5));
				single.setUserName(rs.getString(6));
				single.setIsPublic(rs.getInt(7));
				single.setIsReview(rs.getInt(9));
				single.setReviewNum(rs.getInt(10));
				single.setCategory(rs.getString(11));
				single.setArt_index(rs.getString(12));
				newArticleList.add(single);
			}
		}
		return newArticleList;
	}
	
	/*
	 * 根据文章id获取文章信息
	 */
	public static List<Article> getArticleById(int art_id) throws SQLException{
		String sql="select * from tb_article where art_id=?";
		Object[] params={art_id};
		DB mydb=new DB();
		mydb.dops(sql, params);
		ResultSet rs=mydb.getRs();
		List<Article> newArticleList = null;
		if(rs!=null){
			newArticleList=new ArrayList<Article>();
			while(rs.next()){
				Article single=new Article();
				single.setArtid(rs.getInt(1));
				single.setArt_title(rs.getString(2));
				single.setArt_content(rs.getString(3));	
				single.setArt_pubtime(ChangeTime.dateTimeChange(rs.getTimestamp(4)));
				single.setIsPublic(rs.getInt(7));
				single.setIsReview(rs.getInt(9));
				single.setCategory(rs.getString(11));
				single.setArt_index(rs.getString(12));
				newArticleList.add(single);
			}
		}
		return newArticleList;
	}
	
	/**
	 * @throws SQLException 
	 * @功能：获取该博主文章总数
	 */
	public int getActicleCount(int id) throws SQLException{
		int count=0;
		String sql="select count(id) from tb_article where art_id=?";
		Object[] params={id};
		
		DB mydb=new DB();
		mydb.dops(sql, params);
		ResultSet rs = mydb.getRs();
		if(rs!=null&&rs.next())
			count=rs.getInt(1);
		rs.close();
		mydb.closed();
		return count;
	}
	
	
	/**
	 * @throws SQLException 
	 * @功能：修改文章
	 */
	public int modify(Object[] params) throws SQLException{
		String sql="update tb_article set art_title=?,art_content=?,art_pubtime=?,category=?,art_index=?,isPublic=?,isReview=? where art_id=?";
		DB mydb=new DB();
		mydb.dops(sql, params);
		int i=mydb.getCount();
		mydb.closed();
		return i;
	}
	
	/**
	 * @throws SQLException 
	 * @功能：发表文章
	 */
	public int insert(Object[] params) throws SQLException{
		String sql="insert into tb_article(art_title,art_content,art_author,author_id,isPublic,isReview,art_pubtime,category,art_index) values(?,?,?,?,?,?,?,?,?)";
		DB mydb=new DB();
		mydb.dops(sql,params);
		int i=mydb.getCount();
		mydb.closed();
		return i;
	}
	
	/**
	 * @throws SQLException 
	 * @功能： 获取分类后的文章
	 */
	public List<Article> getCateArticle(int uid) throws SQLException{
		String sql="select * from tb_article where author_id=? GROUP BY category,art_id";
		List<Article> newArticleList=null;
		Object[] params={uid};
		DB mydb=new DB();
		mydb.dops(sql,params);
		ResultSet rs=mydb.getRs();
		if(rs!=null){
			newArticleList=new ArrayList<Article>();
			while(rs.next()){
				Article single=new Article();
				single.setArtid(rs.getInt(1));
				single.setArt_title(rs.getString(2));
				single.setArt_content(rs.getString(3));	
				single.setArt_pubtime(ChangeTime.dateTimeChange(rs.getTimestamp(4)));
				single.setArt_readnum(rs.getInt(5));
				single.setUserName(rs.getString(6));
				single.setCategory(rs.getString(11));
				single.setArt_index(rs.getString(12));
				newArticleList.add(single);
			}
		}
		rs.close();
		mydb.closed();
		return newArticleList;
	}
	/**
	 * @获取博主文章的所有的分类信息
	 * @throws SQLException 
	 * 
	 */
	public List<String> getAllCate(int uid) throws SQLException {
		String sql="select category from tb_article where author_id=? GROUP BY category";
		List<String> newArticleList=null;
		Object[] params={uid};
		DB mydb=new DB();
		mydb.dops(sql,params);
		ResultSet rs=mydb.getRs();
		if(rs!=null){
			newArticleList=new ArrayList<String>();
			while(rs.next()){
				newArticleList.add(rs.getString(1));
			}
		}
		rs.close();
		mydb.closed();
		return newArticleList;
	}
	/**
	 * @插入分类
	 */
	public int InsertCate(Object[] params) throws SQLException{
		String sql="insert into tb_article(art_author,author_id,category) values(?,?,?)";
		DB mydb=new DB();
		mydb.dops(sql,params);
		int i=mydb.getCount();
		mydb.closed();
		return i;
	}
	/**
	 * @throws SQLException 
	 * @删除文章后更新文章的评论数量
	 */
	public int desArtRevCount(int art_id) throws SQLException {
		String sql="update tb_article set ReviewNum=ReviewNum-1 where art_id=?";
		Object[] params={art_id};
		DB mydb=new DB();
		mydb.dops(sql, params);
		int i=mydb.getCount();
		mydb.closed();
		return i;
	}
	/**
	 * @throws SQLException 
	 * @删除用户后更新文章的评论数量
	 */
	public int desArtRevCountUid(int num,int art_id) throws SQLException {
		String sql1="select ReviewNum from tb_article where art_id=?";
		Object[] params={art_id};
		DB mydb=new DB();
		mydb.dops(sql1,params);
		ResultSet rs=mydb.getRs();
		int counts = 0;
		if(rs!=null){
			while(rs.next()){
				counts=rs.getInt(1);
			}
		}
		counts = counts-num;
		String sql="update tb_article set ReviewNum=? where art_id=?";
		Object[]  params2= {counts,art_id};
		mydb.dops(sql, params2);
		int i=mydb.getCount();
		mydb.closed();
		return i;
	}
}
