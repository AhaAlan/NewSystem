package controller;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.Kv;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.SqlPara;
import interceptor.CategoryNavbarInterceotor;
import interceptor.Login;
import model.Collection;
import model.Topic;
import model.User;

import java.util.List;

@Before(CategoryNavbarInterceotor.class)
public class UserController extends Controller {

    public void queryNewResult(){
        String q="%"+search_query+"%";
        String p="%"+year_query+"%";
        SqlPara fuzzyQuery = Db.getSqlPara("FuzzyQuery",q,p);
        System.out.println("sql语句："+fuzzyQuery.getSql());

        Integer pageNumber = getParaToInt("page", 1);//从ftl页面传回第几页，为了实现下一页上一页功能
        Page<Topic> page = Topic.dao.paginate(pageNumber, 10, fuzzyQuery);//分页显示方法
        System.out.println("结果："+page.getPageSize()+"---"+page.getPageNumber());

        setAttr("page",page);

        renderFreeMarker("queryNewResult.ftl");
    }


    public static String search_query="null";
    public static String year_query="null";
    public void queryNew(){
        search_query = getPara("search");
        year_query = getPara("year");

        Boolean success = true;
        String message = success ? "修改成功" : "修改失败";
        Kv result = Kv.by("success", success).set("message", message);
        renderJson(result);

    }
    @Before(Login.class)
    public void DomodifiyPersonInfo() {
        String userName = getPara("userName");
        String password = getPara("password");
        String nickName = getPara("nickName");
        String tel = getPara("tel");
        String email = getPara("email");
        Integer id = getParaToInt("id");


        Db.update("update user set userName=?,password=?,nickName=?,tel=?,email=? where id=? ", userName, password, nickName, tel, email, id);
        Boolean success = true;
        String message = success ? "修改成功" : "修改失败";
        Kv result = Kv.by("success", success).set("message", message);
        renderJson(result);

    }
    @Before(Login.class)
    public void modifiyPersonInfo() {
        Integer paraToInt = getParaToInt(0, -1);
        User byId = User.dao.findById(paraToInt);
        setAttr("user", byId);
        renderFreeMarker("modifiyPersonInfo.ftl");

    }
    @Before(Login.class)
    public void personInfo() {
        User user = getSessionAttr("user");
        SqlPara personInfoForCollection = Db.getSqlPara("personInfoForCollection",user.getId());
        Integer pageNumber = getParaToInt("page", 1);//从ftl页面传回第几页，为了实现下一页上一页功能
        Page<Collection> page = Collection.dao.paginate(pageNumber, 10, personInfoForCollection);//分页显示方法
        setAttr("page", page);


        List<User> users = User.dao.find("select * from user where id =? ", user.getId());
        setAttr("user", users.get(0));


        renderFreeMarker("personInfo.ftl");


    }

    @Before(Login.class)
    public void index() {

//        renderHtml("学生");
//        renderFreeMarker("index.ftl");
        redirect("/");
    }
}
