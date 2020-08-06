package Interface;

import java.util.List;

import org.springframework.stereotype.Repository;

import Model.Records;
import Model.Staffs;
@Repository
public interface RecordsService {
	public List<Records> getAll();
	public boolean save(Records record);
	public boolean update(Records record,String staffId);
	public boolean Delete(Long id);
	public List<Staffs> getStaff();
 
}
