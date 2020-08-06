package Interface;

import java.util.List;

import org.springframework.stereotype.Repository;

import Model.Depart;
import Model.Staffs;

@Repository
public interface StaffsService {
 public List<Staffs> getAll();
 public boolean save(Staffs staff,String departID);
 public boolean Delete(String id);
 public List<Depart> getDepart();
 public String getDateFormat(String date);	 
 public String getphoto(String id);
 public List<Staffs> search(String search);
	 
}
