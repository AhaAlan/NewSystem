package controller;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.Kv;
import com.jfinal.kit.LogKit;
import com.jfinal.kit.PathKit;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.SqlPara;
import com.jfinal.upload.UploadFile;
import interceptor.Login;
import model.*;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.channels.FileChannel;
import java.util.Date;
import java.util.List;

@Before(Login.class)
public class AdminController extends Controller {
    public static String nickNameForUser;
    public static String nickNameForAdmin;
    public static String nickNameForReply;

    /*====================================用户管理========================================*/
    //通过昵称搜索用户
    public void searchUserByNickNameResult(){
        List<User> user = User.dao.find("select * from user where nickName =?", nickNameForUser);
        setAttr("user",user);
        renderFreeMarker("manageUser.ftl");
    }

    //返回搜索结果（成功/失败）
    public void searchUserByNickName(){
        nickNameForUser = getPara("nickName");
        Boolean success = true;
        String message = success ? "成功" : "失败";
        Kv result = Kv.by("success", success).set("message", message);
        System.out.print(success);
        renderJson(result);
    }

    //新增用户：添加用户信息，并返回结果信息
    public void DoAddUserInfo(){
        //从前端获取值
        String userName = getPara("userName");
        String nickName = getPara("nickName");
        String tel = getPara("tel");
        String email = getPara("email");
        String password = getPara("password");
        //创建新用户，并设置值
        User user = new User();
        user.setUserName(userName);
        user.setPassword(password);
        user.setNickName(nickName);
        user.setEmail(email);
        user.setTel(tel);
        user.save();
        //判断并返回结果
        Boolean success = true;
        String message = success ? "成功" : "失败";
        Kv result = Kv.by("success", success).set("message", message);
        renderJson(result);
    }

    //renderFreeMarker方法，完成视图渲染
    public void addUser(){
        renderFreeMarker("addUser.ftl");
    }

    //修改用户信息：更改用户信息，并返回结果
    public void DomodifyUserInfo(){
        String userName = getPara("userName");
        String nickName = getPara("nickName");
        Integer id = getParaToInt("id");
        String tel = getPara("tel");
        String email = getPara("email");
        String password = getPara("password");
        Db.update("update user set userName=?,nickName=?,password=?,tel=?,email=? where id=?",userName,nickName,password,tel,email,id);
        Boolean success = true;
        String message = success ? "成功" : "失败";
        Kv result = Kv.by("success", success).set("message", message);
        renderJson(result);
    }

    public void modifyUserInfo(){
        Integer paraToInt = getParaToInt(0, -1);
        List<User> user = User.dao.find("select * from user where id= ?", paraToInt);
        setAttr("user",user.get(0));
        renderFreeMarker("modifyUserInfo.ftl");
    }

    //删除用户信息
    public void deleteUserInfo(){
        Integer paraToInt = getParaToInt(0, -1);
        Db.delete("delete from user where id =?",paraToInt);

        List<User> user = User.dao.find("select * from user");
        setAttr("user",user);
        renderFreeMarker("manageUser.ftl");
    }

    public void manageUser(){
        List<User> user = User.dao.find("select * from user");
        setAttr("user",user);
        renderFreeMarker("manageUser.ftl");
    }

    /*==============================管理员管理===================================*/
    //通过昵称搜索管理员
    public void searchAdminByNickNameResult(){
        List<Admin> admins = Admin.dao.find("select * from admin where nickName =?", nickNameForAdmin);
        setAttr("admins",admins);
        renderFreeMarker("manageAdmin.ftl");
    }


    public void searchAdminByNickName(){
        nickNameForAdmin = getPara("nickName");
        Boolean success = true;
        String message = success ? "成功" : "失败";
        Kv result = Kv.by("success", success).set("message", message);
        System.out.print(success);
        renderJson(result);
    }

    //增加管理员信息
    public void DoAddAdminInfo(){
        String adminName = getPara("adminName");
        String nickName = getPara("nickName");
        String tel = getPara("tel");
        String email = getPara("email");
        Integer Super = getParaToInt("super");
        String password = getPara("password");

        Admin admin = new Admin();
        admin.setAdminName(adminName);
        admin.setPassword(password);
        admin.setNickName(nickName);
        admin.setEmail(email);
        admin.setTel(tel);
        admin.setSuper(Super);
        admin.save();

        Boolean success = true;
        String message = success ? "成功" : "失败";
        Kv result = Kv.by("success", success).set("message", message);
        renderJson(result);
    }

    public void addAdmin(){
        renderFreeMarker("addAdmin.ftl");
    }

    public void DomodifiyAdminInfo(){
        String adminName = getPara("adminName");
        String nickName = getPara("nickName");
        Integer id = getParaToInt("id");
        String tel = getPara("tel");
        String email = getPara("email");
        Integer Super = getParaToInt("super");
        String password = getPara("password");
        Db.update("update admin set adminName=?,nickName=?,password=?,tel=?,email=?,super=? where id=?",adminName,nickName,password,tel,email,Super,id);
        Boolean success = true;
        String message = success ? "成功" : "失败";
        Kv result = Kv.by("success", success).set("message", message);
        renderJson(result);
    }

    public void modifyAdminInfo(){
        Integer paraToInt = getParaToInt(0, -1);
        List<Admin> admins = Admin.dao.find("select * from admin where id= ?", paraToInt);
        setAttr("admin",admins.get(0));
        renderFreeMarker("modifyAdminInfo.ftl");
    }

    public void deleteAdminInfo(){
        Integer paraToInt = getParaToInt(0, -1);
        Db.delete("delete from admin where id =?",paraToInt);

        List<Admin> admins = Admin.dao.find("select * from admin");
        setAttr("admins",admins);
        renderFreeMarker("manageAdmin.ftl");
    }

    //管理管理员
    public void manageAdmin(){
        List<Admin> admins = Admin.dao.find("select * from admin");
        setAttr("admins",admins);
        renderFreeMarker("manageAdmin.ftl");
    }

    /*============================================评论管理========================================*/
    //根据类别管理评论信息
    public void manageReplyByCategory() {
        List<Category> categories = Category.dao.find("select * from category");
        setAttr("categories", categories);

        SqlPara manageReplyByCategory = Db.getSqlPara("manageReplyByCategory", nickNameForReply);
        Integer pageNumber = getParaToInt("page", 1);//从ftl页面传回第几页，为了实现下一页上一页功能
        Page<Reply> page = Reply.dao.paginate(pageNumber, 10, manageReplyByCategory);//分页显示方法
        setAttr("page", page);

        renderFreeMarker("commitManage.ftl");
    }

    public void searchReplyByCategoryId() {
        nickNameForReply = getPara("nickName");
        Boolean success = true;
        String message = success ? "成功" : "失败";
        Kv result = Kv.by("success", success).set("message", message);
        System.out.print(success);
        renderJson(result);
    }

    public void refuseReply() {
        List<Category> categories = Category.dao.find("select * from category");
        setAttr("categories", categories);

        Integer para = getParaToInt(0, -1);
        Db.update("update reply set status =0 where id =?", para);

        SqlPara commitManage = Db.getSqlPara("commitManage");
        Integer pageNumber = getParaToInt("page", 1);//从ftl页面传回第几页，为了实现下一页上一页功能
        Page<Reply> page = Reply.dao.paginate(pageNumber, 10, commitManage);//分页显示方法
        setAttr("page", page);

        renderFreeMarker("commitManage.ftl");
    }

    public void passReply() {

        List<Category> categories = Category.dao.find("select * from category");
        setAttr("categories", categories);

        Integer para = getParaToInt(0, -1);
        Db.update("update reply set status =1 where id =?", para);

        SqlPara commitManage = Db.getSqlPara("commitManage");
        Integer pageNumber = getParaToInt("page", 1);//从ftl页面传回第几页，为了实现下一页上一页功能
        Page<Reply> page = Reply.dao.paginate(pageNumber, 10, commitManage);//分页显示方法
        setAttr("page", page);

        renderFreeMarker("commitManage.ftl");
    }

    public void commitManage() {

        List<Category> categories = Category.dao.find("select * from category");
        setAttr("categories", categories);

        SqlPara commitManage = Db.getSqlPara("commitManage");
        Integer pageNumber = getParaToInt("page", 1);//从ftl页面传回第几页，为了实现下一页上一页功能
        Page<Reply> page = Reply.dao.paginate(pageNumber, 10, commitManage);//分页显示方法
        setAttr("page", page);

        renderFreeMarker("commitManage.ftl");
    }

    /**===============================新闻管理=================================*/
    public void DomodifyNew() {
        Integer id1 = getParaToInt("id");
        String title = getPara("title");
        String contetnt = getPara("content");
        String link = getPara("link");
        String linkName = getPara("linkName");
        Integer categoryId = getParaToInt("category");
        Db.update("update topic set title=?,content=?,link=?,linkName=?,categoryId=? where id=? ", title, contetnt, link, linkName, categoryId, id1);
        Boolean success = true;
        String message = success ? "成功" : "失败";
        Kv result = Kv.by("success", success).set("message", message);
        renderJson(result);

    }

    public void ModifyNew() {
        Integer para = getParaToInt(0, -1);
        List<Category> categories = Category.dao.find("select * from category");
        setAttr("categories", categories);

        Topic byId = Topic.dao.findById(para);
        setAttr("topic", byId);

        renderFreeMarker("ModifyNew.ftl");

    }

    public void deleteNew() {
        Integer para = getParaToInt(0, -1);
        Db.delete("delete from topic where id= ?", para);
        List<Category> categories = Category.dao.find("select * from category");
        setAttr("categories", categories);
        SqlPara manageNew = Db.getSqlPara("manageNew");
        Integer pageNumber = getParaToInt("page", 1);//从ftl页面传回第几页，为了实现下一页上一页功能

        Page<Topic> page = Topic.dao.paginate(pageNumber, 10, manageNew);//分页显示方法
        setAttr("page", page);

        renderFreeMarker("manageNew.ftl");
    }

    public void manageNewByCategory() {
        List<Category> categories = Category.dao.find("select * from category");
        setAttr("categories", categories);
        SqlPara manageNewByCategory = Db.getSqlPara("manageNewByCategory", selectFlag);
        Integer pageNumber = getParaToInt("page", 1);//从ftl页面传回第几页，为了实现下一页上一页功能
        Page<Topic> page = Topic.dao.paginate(pageNumber, 10, manageNewByCategory);//分页显示方法
        setAttr("page", page);

        renderFreeMarker("manageNew.ftl");
    }


    public static int selectFlag = -1;

    public void searchNewByCategoryId() {
        selectFlag = getParaToInt("select");
        Boolean success = true;
        String message = success ? "成功" : "失败";
        Kv result = Kv.by("success", success).set("message", message);
        System.out.print(success);
        renderJson(result);
    }

    public void manageNew() {
        List<Category> categories = Category.dao.find("select * from category");
        setAttr("categories", categories);
        SqlPara manageNew = Db.getSqlPara("manageNew");
        Integer pageNumber = getParaToInt("page", 1);//从ftl页面传回第几页，为了实现下一页上一页功能

        Page<Topic> page = Topic.dao.paginate(pageNumber, 10, manageNew);//分页显示方法
        setAttr("page", page);

        renderFreeMarker("manageNew.ftl");
    }


    public void DouploadCoverPic() {
        Boolean success = false;
        UploadFile upload = this.getFile();
        String fileName = upload.getOriginalFileName();

        File file = upload.getFile();
        String contentType = upload.getContentType();

        String webRootPath = PathKit.getWebRootPath();//得到web路径

        PropKit.use("myconfig.properties");//从配置文件中读取保存路径
//            String saveFilePathforimage = PropKit.get("saveFilePathforimage");
        String saveFilePathforimage = webRootPath + "\\template\\newImg\\";
        String filename = file.getName();
        String savaFileName = filename;

        System.out.println("保存路径=" + saveFilePathforimage);
        String saveNme = saveFilePathforimage + savaFileName;

        String mysql_save_Path = "/template/newImg/" + savaFileName;

        File Direction = new File(saveFilePathforimage);
        //判断文件夹是否存在 如果不存在 就创建文件夹
        if (!Direction.exists()) {
            Direction.mkdirs();
        }

        File t = new File(saveNme);
        try {
            t.createNewFile();
            Db.update("update topic set coverPic = ? where id =?", mysql_save_Path, tempID);
            success = true;
        } catch (Exception e) {
            e.printStackTrace();
            LogKit.error("上传失败，原因是：" + e.getMessage());
        }
        fileChannelCopy(file, t);
        file.delete();

        String message = success ? "上传成功" : "上传失败";
        Kv result = Kv.by("success", success).set("message", message);
        System.out.print(success);
        renderJson(result);
    }

    public void addNew() {

        List<Category> categories = Category.dao.find("select * from category");
        setAttr("categories", categories);
        renderFreeMarker("addNew.ftl");
    }


    public void upload() {
        Boolean success = false;
        UploadFile upload = this.getFile();
        String fileName = upload.getOriginalFileName();

        File file = upload.getFile();
        String contentType = upload.getContentType();


        String webRootPath = PathKit.getWebRootPath();//得到web路径

        PropKit.use("myconfig.properties");//从配置文件中读取保存路径
//            String saveFilePathforimage = PropKit.get("saveFilePathforimage");
        String saveFilePathforimage = webRootPath + "\\template\\newImg\\";
        String filename = file.getName();
        String savaFileName = filename;

        System.out.println("保存路径=" + saveFilePathforimage);
        String saveNme = saveFilePathforimage + savaFileName;

        String mysql_save_Path = "/template/newImg/" + savaFileName;


        File Direction = new File(saveFilePathforimage);
        //判断文件夹是否存在 如果不存在 就创建文件夹
        if (!Direction.exists()) {
            Direction.mkdirs();
        }

        File t = new File(saveNme);
        try {
            t.createNewFile();
            success = true;
        } catch (Exception e) {
            e.printStackTrace();
            LogKit.error("上传失败，原因是：" + e.getMessage());
        }
        fileChannelCopy(file, t);
        file.delete();


        String message = success ? "上传成功" : "上传失败";
        Kv result = Kv.by("errno", 0).set("url", mysql_save_Path);
        renderJson(result);
    }

    public void fileChannelCopy(File s, File t) {
        FileInputStream fi = null;
        FileOutputStream fo = null;
        FileChannel in = null;
        FileChannel out = null;
        try {
            fi = new FileInputStream(s);
            fo = new FileOutputStream(t);
            in = fi.getChannel();//得到对应的文件通道
            out = fo.getChannel();
            in.transferTo(0, in.size(), out);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                fi.close();
                in.close();
                fo.close();
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public void display() {
        List<Test> tests = Test.dao.find("select * from test ");
        setAttr("test", tests.get(0));
        renderFreeMarker("info.ftl");
    }


    public void uploadCoverPic() {
//    setAttr("topicId",tempID);
        renderFreeMarker("uploadCoverPic.ftl");
    }

    public static int tempID = -1;

    //保存传入的新闻
    public void saveNew() {
        String title = getPara("title");
        String contetnt = getPara("content");
        String link = getPara("link");
        String linkName = getPara("linkName");

        //通过模型判断所属类别
        Integer categoryId = 1;
        /**
         * 待补充
         *
         *
         *
         * **/


        Date date = new Date();
        Admin admin = getSessionAttr("user");
        Topic topic = new Topic();

        List<Record> records = Db.find("select max(id) as maxId from topic");
        System.out.println("最大值ID=" + records.get(0).getStr("maxId"));

        int id = Integer.parseInt(records.get(0).getStr("maxId"));
        System.out.println("存入的ID=" + id);

        topic.setAdminId(admin.getId());
        topic.setCategoryId(categoryId);
        topic.setPubDate(date);
        topic.setContent(contetnt);
        topic.setTitle(title);
        topic.setCoverPic("null");
        topic.setLink(link);
        topic.setId(id + 1);
        topic.setLinkName(linkName);
        tempID = id + 1;
        topic.save();

        Boolean success = true;
        String message = success ? "成功" : "失败";
        Kv result = Kv.by("success", success).set("message", message);
        renderJson(result);
    }


    public void index() {
        renderFreeMarker("adminMainPage.ftl");
    }
}
