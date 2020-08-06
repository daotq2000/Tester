package Model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "views", schema = "dbo", catalog = "Lab6")
public class Views {
	int id;
	Long view;
	@Id
	@Column(name = "id",nullable = false,unique = true)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Column(name = "views",nullable = false)
	public Long getView() {
		return view;
	}
	public void setView(Long view) {
		this.view = view;
	}
	/**
	 * @param id
	 * @param view
	 */
	public Views(int id, Long view) {
		super();
		this.id = id;
		this.view = view;
	}
	/**
	 * 
	 */
	public Views() {
		super();
	}
	
}
