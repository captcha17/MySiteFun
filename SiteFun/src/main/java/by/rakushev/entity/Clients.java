package by.rakushev.entity;

import javax.persistence.Column;
import javax.persistence.Entity;

@Entity
public class Clients extends AbstractEntity {

	@Column(name = "mail")
	private String mail;

	@Column(name = "login")
	private String login;

	@Column(name = "password")
	private String password;

	@Column(name = "confirm")
	private String confirm;

	@Column(name = "myname")
	private String myname;

	@Column(name = "mylastname")
	private String mylastname;

	@Column(name = "sex")
	private String sex;

	@Column(name = "about")
	private String about;

	public String getMylastname() {
		return mylastname;
	}

	public void setMylastname(String mylastname) {
		this.mylastname = mylastname;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getAbout() {
		return about;
	}

	public void setAbout(String about) {
		this.about = about;
	}

	public String getMyname() {
		return myname;
	}

	public void setMyname(String myname) {
		this.myname = myname;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirm() {
		return confirm;
	}

	public void setConfirm(String confirm) {
		this.confirm = confirm;
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
