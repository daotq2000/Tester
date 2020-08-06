package Interface;

import java.util.List;

import org.springframework.stereotype.Repository;

import Model.Depart;

@Repository
public interface DepartSevice   {
public List<Depart> getAll();
public boolean save(Depart depart);
public boolean update(String id);
public boolean Delete(String id);
public boolean CheckDuplicate(String id);
}