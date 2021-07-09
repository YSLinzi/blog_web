package com.ysl.entity;

public class ArtReview {
	private int review_id;
	private String review_user;
	private String review_txt;
	private String review_time;
	private int ruser_id;//用户id
	private int isPublic;//是否公开
	private int art_id;//评论文章的id
	private String art_title;//评论文章的标题
	
	public int getReview_id() {
		return review_id;
	}
	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}
	public String getReview_user() {
		return review_user;
	}
	public void setReview_user(String review_user) {
		this.review_user = review_user;
	}
	public String getReview_txt() {
		return review_txt;
	}
	public void setReview_txt(String review_txt) {
		this.review_txt = review_txt;
	}
	public String getReview_time() {
		return review_time;
	}
	public void setReview_time(String review_time) {
		this.review_time = review_time;
	}
	public int getRuser_id() {
		return ruser_id;
	}
	public void setRuser_id(int ruser_id) {
		this.ruser_id = ruser_id;
	}
	public int getIsPublic() {
		return isPublic;
	}
	public void setIsPublic(int isPublic) {
		this.isPublic = isPublic;
	}
	public int getArt_id() {
		return art_id;
	}
	public void setArt_id(int art_id) {
		this.art_id = art_id;
	}
	public String getArt_title() {
		return art_title;
	}
	public void setArt_title(String art_title) {
		this.art_title = art_title;
	}

	public ArtReview(int id, int review_id, String review_user, String review_txt, String review_time, int ruser_id,
			int isPublic, int art_id) {
		super();
		this.review_id = review_id;
		this.review_user = review_user;
		this.review_txt = review_txt;
		this.review_time = review_time;
		this.ruser_id = ruser_id;
		this.isPublic = isPublic;
		this.art_id = art_id;
	}
	public ArtReview() {
		super();
	}
}
