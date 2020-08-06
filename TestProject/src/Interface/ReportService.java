package Interface;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.ui.ModelMap;

import Model.Records;
@Repository
public interface ReportService {
	public List<Records> getDepart();
	public List<Records> getPerson();
	public List<Records> indexPage();
}
