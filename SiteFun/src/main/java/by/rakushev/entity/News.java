package by.rakushev.entity;

import javax.persistence.Column;
import javax.persistence.Entity;

import org.hibernate.annotations.Type;

@Entity
public class News extends AbstractEntity {

	@Column(name = "name")
	private String name;

	@Column(name = "category")
	private String category;

	@Column(name = "description")
	@Type(type = "text")
	private String description;

	@Column(name = "brief")
	@Type(type = "text")
	private String brief;

	@Column(name = "image", length = 5000000)
	// @Type(type = "byte")
	private byte[] image;

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}

	public String getBrief() {
		return brief;
	}

	public void setBrief(String brief) {
		this.brief = brief;
	}

	public String getName() {
		return name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setName(String name) {
		this.name = name;
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
