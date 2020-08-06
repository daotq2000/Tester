package Model;
// Generated Feb 6, 2020 6:59:27 PM by Hibernate Tools 4.3.5.Final

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import org.hibernate.validator.constraints.NotBlank;

import com.sun.istack.internal.NotNull;


@Entity
@Table(name = "users", schema = "dbo", catalog = "Lab6")
public class Users implements java.io.Serializable {
 
	private static final long serialVersionUID = 1L;

	@NotNull()
	@NotBlank()
	private String username;
	 
	@NotNull()
	@NotBlank()
	private String passwords;
// 
	@NotNull()
	@NotBlank()
	private String fullname;

	public Users() {
	}

	public Users(String username, String passwords, String fullname) {
		this.username = username;
		this.passwords = passwords;
		this.fullname = fullname;
	}

	@Id

	@Column(name = "username", unique = true, nullable = false, length = 50)
	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name = "passwords", nullable = false, length = 50)
	public String getPasswords() {
		return this.passwords;
	}

	public void setPasswords(String passwords) {
		this.passwords = passwords;
	}

	@Column(name = "fullname", nullable = false)
	public String getFullname() {
		return this.fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

}
