package dao;

import entity.Picture;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("yihanDao")
public interface YihanDao {
    public List<Picture> randomPic(Map map);
}
