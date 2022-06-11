package controller;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.SqlPara;
import interceptor.CategoryNavbarInterceotor;
import model.Topic;

import java.util.List;

/**
 * 分类显示模板
 * 控制每个类别模块的显示的新闻数量等
 */

@Before(CategoryNavbarInterceotor.class)
public class CategoryController extends Controller {

    //即时新闻，分页显示，每页显示10条
    public void instantNews(){
        SqlPara sqlPara = Db.getSqlPara("instantNews");
        Integer pageNumber = getParaToInt("page", 1);//从ftl页面传回第几页，为了实现下一页上一页功能
        Page<Topic> page = Topic.dao.paginate(pageNumber, 10, sqlPara);//分页显示方法
        setAttr("page",page);
        renderFreeMarker("instantNews.ftl");
    }

    //其他类别，分页显示，每页显示5条新闻
    public void index() {
        Integer categoryId = getParaToInt(0, 1);

        String viewNewByCategoryForFive = Db.getSql("viewNewByCategoryForFive");
        List<Topic> topics = Topic.dao.find(viewNewByCategoryForFive, categoryId);
        setAttr("topics",topics);

        SqlPara sqlPara = Db.getSqlPara("viewNewByCategoryForFive-Last",categoryId);
        System.out.println(sqlPara.getSql());

        Integer pageNumber = getParaToInt("page", 1);//从ftl页面传回第几页，为了实现下一页上一页功能

        Page<Topic> page = Topic.dao.paginate(pageNumber, 5, sqlPara);//分页显示方法

        setAttr("page",page);

        renderFreeMarker("viewNewByCategory.ftl");
    }

}
