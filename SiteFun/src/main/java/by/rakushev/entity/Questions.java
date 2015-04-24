package by.rakushev.entity;

import javax.persistence.Column;
import javax.persistence.Entity;

import org.hibernate.annotations.Type;

@Entity
public class Questions extends AbstractEntity {

	@Column(name = "fio")
	private String fio;
	
	@Column(name = "organization")
	private String organization;

	@Column(name = "phone")
	private String phone;

	@Column(name = "mail")
	private String mail;

	@Column(name = "sms")
	@Type(type = "text")
	private String sms;

	
	
	public String getFio() {
		return fio;
	}

	public void setFio(String fio) {
		this.fio = fio;
	}

	public String getOrganization() {
		return organization;
	}

	public void setOrganization(String organization) {
		this.organization = organization;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getSms() {
		return sms;
	}

	public void setSms(String sms) {
		this.sms = sms;
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
