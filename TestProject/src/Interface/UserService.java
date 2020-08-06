package Interface;

import java.util.List;

import org.springframework.stereotype.Repository;

import Model.Users;
@Repository
public interface UserService {
 public List<Users> getAll();
 public boolean save(Users user);
 public boolean Delete(String id);
 public boolean checkLogin(String username, String passwords);
 public boolean checkAcountGoogle(String username);
 public  Boolean checkFpt(String email);
 public String getFullname(String username);
}
