package model;

import java.io.Serializable;
import java.time.LocalDate;

public class UserModel implements Serializable {

	private static final long serialVersionUID = 1L;
	private String userId;
	private String username;
	private String email;
	private String gender;
	private LocalDate dob;
	private String password;
	
	public UserModel(String username, String email, String gender, LocalDate dob, String password) {
		super();
		this.username = username;
		this.email = email;
		this.gender = gender;
		this.dob = dob;
		this.password = password;
	}

	public UserModel()
	{
		
	}
	
	public String getUserId()
	{
		return userId;
	}
	public void setUserId(String userId)
	{
		this.userId = userId;
	}
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public LocalDate getDob() {
		return dob;
	}

	public void setDob(LocalDate dob) {
		this.dob = dob;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
