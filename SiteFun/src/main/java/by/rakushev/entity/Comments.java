package by.rakushev.entity;

import javax.persistence.Column;
import javax.persistence.Entity;

import org.hibernate.annotations.Type;

@Entity
public class Comments extends AbstractEntity {

	@Column(name = "login")
	private String login;
	
	@Column(name = "news")
	private Long news;

	@Column(name = "comment")
	@Type(type = "text")
	private String comment;

	
	public Long getNews() {
		return news;
	}

	public void setNews(Long news) {
		this.news = news;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	@Override
	public boolean entityEquals(Object o) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int entityHashCode() {
		// TODO Auto-generated method stub
		return 0;
	}
}
