package service;

import entity.Menu;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import java.util.List;

public interface SystemService {
    public JSONArray loadMenu();
}
