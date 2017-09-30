package controller;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.SystemService;

import javax.annotation.Resource;

@Controller
@RequestMapping("system")
public class SystemController {

    @Resource(name="systemService")
    private SystemService systemService;

    @RequestMapping("getMenuList")
    @ResponseBody
    public JSONArray getMenuList(){
        return systemService.loadMenu();
    }
}
