package controller;

/**
 * Created by chenchaochao on 2017/04/20.
 */
import entity.Picture;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import entity.User;
import service.UserService;
import org.apache.commons.collections.map.HashedMap;
import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.ResponseBody;
import service.YihanService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/view")
public class ViewController {

    @Resource(name="yihanService")
    private YihanService yihanService;

    private Logger logger = Logger.getLogger(ViewController.class);

    @Resource(name = "UserService")
    private UserService userService;

    @RequestMapping("/index")
    public String index(){

        return "index";
    }

    @RequestMapping("/find")
    @ResponseBody
    public Map<String,Object> find(User user, HttpServletRequest request){

        Map<String,Object> map = new HashedMap();
        System.out.println("你已通过springMVC进入controller方法。。。。");
        logger.info("你已通过springMVC进入controller方法。。。。");
        User loginuser = userService.findByUsernameAndPwd(user.getUsername(),user.getPassword());
        if(loginuser != null){
            map.put("result","success");
        }else {
            map.put("result","fail");
        }
        return map;
    }

    @RequestMapping("/success")
    public String success(){
        System.out.println("登录成功。。。。");
        logger.info("登录成功。。。。");

        return "success";
    }

    @RequestMapping("savePic")
    public void savePic(@RequestParam("upload") MultipartFile file){

    }

    @RequestMapping("/toPhoto")
    @Transactional()
    public String toPhoto(@RequestParam(required = false,value="size") Integer size, @RequestParam(required = false,value="belog") Integer belong, ModelMap map){
        if(size==null){
            size=20;
        }
        if(belong==null){
            belong=1;
        }
        List<Picture> list=yihanService.randomPic(size,belong);
        map.put("pics",list);
        return "picWall";
    }

}
