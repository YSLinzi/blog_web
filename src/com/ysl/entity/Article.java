package com.ysl.entity;

import com.ysl.toolsBean.ChangeTime;

public class Article {
	private int artid;
	private String art_title;
	private String art_content;
	private String art_pubtime;
	private int art_readnum;//关注数量
	private String userName ;//作者
	private int isPublic;//是否公开
	private int author_id;//作者的id
	private int isReview;//是否能够评论
	private int ReviewNum;//评论的数量
	private String category;//文章类别
	private String art_index;//文章关键字索引
	public int getIsPublic() {
		return isPublic;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getArt_index() {
		return art_index;
	}
	public void setArt_index(String art_index) {
		this.art_index = art_index;
	}
	public void setIsPublic(int isPublic) {
		this.isPublic = isPublic;
	}
	public int getAuthor_id() {
		return author_id;
	}
	public void setAuthor_id(int author_id) {
		this.author_id = author_id;
	}
	public int getArtid() {
		return artid;
	}
	public void setArtid(int artid) {
		this.artid = artid;
	}
	public String getArt_title() {
		return art_title;
	}
	public String getInitArtContent() {
		return art_content;
	}
	public String getArtCutContent() {
		int len=100;
		if(len>=art_content.length()||len<=0)
			return ChangeTime.htmlSetChange(art_content);
		else{
			return ChangeTime.htmlSetChange((art_content.substring(0,len)+"..."));
		}
	}
	public void setArt_title(String art_title) {
		this.art_title = art_title;
	}
	public String getArt_content() {
		return art_content;
	}
	public void setArt_content(String art_content) {
		this.art_content = art_content;
	}
	public String getArt_pubtime() {
		return art_pubtime;
	}
	public void setArt_pubtime(String art_pubtime) {
		this.art_pubtime = art_pubtime;
	}
	public int getArt_readnum() {
		return art_readnum;
	}
	public void setArt_readnum(int art_readnum) {
		this.art_readnum = art_readnum;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public int getIsReview() {
		return isReview;
	}
	public void setIsReview(int isReview) {
		this.isReview = isReview;
	}
	public int getReviewNum() {
		return ReviewNum;
	}
	public void setReviewNum(int reviewNum) {
		ReviewNum = reviewNum;
	}
	public Article(int artid, String art_title, String art_content, String art_pubtime, int art_readnum,
			String userName) {
		super();
		this.artid = artid;
		this.art_title = art_title;
		this.art_content = art_content;
		this.art_pubtime = art_pubtime;
		this.art_readnum = art_readnum;
		this.userName = userName;
	}
	public Article() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
