package model.member;

/**
 * memberDTO : 회원정보를 담는 DTO 데이터를 DB에 전달해주는 객체 Bean 클래스 GET PROPRTY : getID(){}
 * => id값이 property로 들어감 getXxx() => get xxx property
 * 
 * SET PROPERTY : setID(){} => id값이 property로 들어감 setXxx() => set xxx property
 * 
 */
public class member {
	private String id;
	private String pass;
	private String name;
	private int gender;
	private String tel;
	private String email;
	private String picture;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

}
