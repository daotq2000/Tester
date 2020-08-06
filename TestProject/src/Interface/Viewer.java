package Interface;

import java.util.List;

import org.springframework.stereotype.Repository;

import Model.Views;
@Repository
public interface Viewer {
public boolean saveOrUpdate(Views view);
public List<Views> getAll();
public List<Views> getView();
}
