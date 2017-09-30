package service.impl;

import dao.SystemDao;
import entity.Menu;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Service;
import service.SystemService;
import javax.annotation.Resource;
import java.util.List;

@Service("systemService")
public class SystemServiceImpl implements SystemService {

    @Resource(name="systemDao")
    private SystemDao systemDao;

    public JSONArray loadMenu() {
        List<Menu> menuList=systemDao.loadMenus(0);
        if(menuList.isEmpty()){
            return null;
        }
        JSONArray menuArray=new JSONArray();
        for(Menu menu:menuList){
            JSONObject single=new JSONObject();
            single.put("mainMenu",menu);
            List<Menu> sonList=systemDao.loadMenus(menu.getId());
            JSONArray sonArray=new JSONArray().fromObject(sonList);
            single.put("sonMenu",sonArray);
            menuArray.add(single);
        }
        return menuArray;
    }
}
