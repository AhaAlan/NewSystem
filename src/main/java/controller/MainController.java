package controller;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.HashKit;
import com.jfinal.kit.Kv;
import com.jfinal.kit.LogKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.SqlPara;
import interceptor.CategoryNavbarInterceotor;
import interceptor.Login;
import interceptor.LoginValidator;
import interceptor.RegisterValidator;
import model.*;

import java.util.List;

import static com.jfinal.plugin.activerecord.Db.find;
import static model.User.dao;

public class MainController extends Controller {

    @Before(CategoryNavbarInterceotor.class)
    public void index() {
//        List<Category> categories = Category.dao.find("select * from category ");
//        setAttr("categories",categories);
        SqlPara hotTopic = Db.getSqlPara("hotTopic");
        List<Topic> topics = Topic.dao.find(hotTopic);
        setAttr("topies",topics);

        renderFreeMarker("index.ftl");
    }


    public void register() {
        renderFreeMarker("register.ftl");
    }

    @Before(RegisterValidator.class)
    public void doRegister() {
        String username = getPara("username");
        String password = getPara("password");
        String nickName = getPara("nickName");
        String email = getPara("email");
        String tel = getPara("tel");
        User user = new User();
        user.setUserName(username);
        user.setPassword(password);
        user.setNickName(nickName);
        user.setTel(tel);
        user.setEmail(email);
        boolean success = false;
        try {
            user.save();
            success = true;
        } catch (Exception e) {
            LogKit.error("用户注册失败，原因是：" + e.getMessage());
        }
        String message = success ? "注册成功" : "注册失败";
        Kv result = Kv.by("success", success).set("message", message);
        System.out.print(success);
        renderJson(result);

    }

    public void login() {

        renderFreeMarker("login.ftl");
    }

    @Before(LoginValidator.class)
    public void loginCheck() {
        boolean success = false;
        int flag = -1;
        String username = getPara("username");
        String password = getPara("password");
        Integer usertype = getParaToInt("usertype");

        if (usertype == 1) {
            String sql = Db.getSql("checkLoginUser");
            List<User> users = User.dao.find(sql, username, password);
            //登录成功
            if (users.size() != 0) {
                setSessionAttr("user", users.get(0));
                flag = 1;
                success = true;
            } else {
                //登录失败
                setAttr("errmsg", "用户名或密码错误");
//            renderFreeMarker("login.ftl");
            }
        } else {
            String sql = Db.getSql("checkLoginAdmin");
            List<Admin> admins = Admin.dao.find(sql, username, password);
            //登录成功
            if (admins.size() != 0) {
                setSessionAttr("user", admins.get(0));
                flag = 2;
                success = true;
            } else {
                //登录失败
                setAttr("errmsg", "用户名或密码错误");
            }
        }
        String message = success ? "登录成功" : "登录失败,密码或者用户名错误";
        Kv result = Kv.by("success", success).set("message", message).set("flag", flag);
        renderJson(result);
    }

    public void logout() {
        removeSessionAttr("user");
        redirect("/login");
    }



}
