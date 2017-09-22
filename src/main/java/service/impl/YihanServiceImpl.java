package service.impl;

import dao.YihanDao;
import entity.Picture;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Service;
import service.YihanService;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("yihanService")
public class YihanServiceImpl implements YihanService {

    @Resource(name="yihanDao")
    private YihanDao yihanDao;

    public List<Picture> randomPic(int size, int belong) {
        System.out.println("-------:"+yihanDao);
        Map<String,Integer> sqlMap=new HashMap<String,Integer>();
        sqlMap.put("size",size);
        sqlMap.put("belong",belong);
        List<Picture> list=yihanDao.randomPic(sqlMap);
        return list;
    }
}
