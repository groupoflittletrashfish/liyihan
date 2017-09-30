package dao;

import entity.Menu;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("systemDao")
public interface SystemDao {

    public List<Menu> loadMenus(long parent);
}
