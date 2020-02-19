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
import model.Reply;
import model.Topic;
import model.User;

import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2018/5/18 0018.
 */
@Before(CategoryNavbarInterceotor.class)
public class TopicController extends Controller {
    @Before(Login.class)
    public void CancelCollectTopic(){
        Integer topicId  = getParaToInt(0, -1);
        Integer userId  = getParaToInt(1, -1);
        Db.delete("delete from collection where topicId=? AND userId=?",topicId,userId);
        Topic topic = Topic.dao.findById(topicId);

        if (topic == null) {
            renderHtml("指定的帖子不存在！");
            return;
        } else {


            String findConllectionByTopicId = Db.getSql("FindConllectionByTopicId");
            List<Collection> collections = Collection.dao.find(findConllectionByTopicId, topicId,userId);
            setAttr("collections",collections);

            setAttr("topic", topic);
            Integer pageNumber = getParaToInt("page", 1);//从ftl页面传回第几页，为了实现下一页上一页功能
            SqlPara sqlPara = Db.getSqlPara("ReplyTopic");
            sqlPara.addPara(topicId);//ReplyTopic中有一个问号，代表一个参数
            Page<Reply> page = Reply.dao.paginate(pageNumber, 5, sqlPara);//分页显示方法
            setAttr("page", page);
            renderFreeMarker("view.ftl");
        }
    }
    @Before(Login.class)
    public void DoCollectTopic(){

        Integer topicId  = getParaToInt(0, -1);
        Integer userId  = getParaToInt(1, -1);
        Collection collection = new Collection();
        Date date = new Date();
        collection.setTopicId(topicId);
        collection.setUserId(userId);
        collection.setCollectionTime(date);
        collection.save();


        Topic topic = Topic.dao.findById(topicId);

        if (topic == null) {
            renderHtml("指定的帖子不存在！");
            return;
        } else {


            String findConllectionByTopicId = Db.getSql("FindConllectionByTopicId");
            List<Collection> collections = Collection.dao.find(findConllectionByTopicId, topicId, userId);
            setAttr("collections", collections);


            setAttr("topic", topic);
            Integer pageNumber = getParaToInt("page", 1);//从ftl页面传回第几页，为了实现下一页上一页功能
            SqlPara sqlPara = Db.getSqlPara("ReplyTopic");
            sqlPara.addPara(topicId);//ReplyTopic中有一个问号，代表一个参数
            Page<Reply> page = Reply.dao.paginate(pageNumber, 5, sqlPara);//分页显示方法
            setAttr("page", page);
            renderFreeMarker("view.ftl");
        }

    }

    @Before({CategoryNavbarInterceotor.class,Login.class})
    public void deleteReply() {
        Integer replyId = getParaToInt(0, -1);
        Db.delete("delete  from reply where id =?", replyId);

        Integer replyTopicId = getParaToInt(1, -1);


        Topic topic = Topic.dao.findById(replyTopicId);

        if (topic == null) {
            renderHtml("指定的帖子不存在！");
            return;
        } else {

            setAttr("topic", topic);
            Integer pageNumber = getParaToInt("page", 1);//从ftl页面传回第几页，为了实现下一页上一页功能
            SqlPara sqlPara = Db.getSqlPara("ReplyTopic");
            sqlPara.addPara(replyTopicId);//ReplyTopic中有一个问号，代表一个参数
            Page<Reply> page = Reply.dao.paginate(pageNumber, 5, sqlPara);//分页显示方法
            setAttr("page", page);
            renderFreeMarker("view.ftl");
        }
    }



    public void index() {



        Integer id = getParaToInt(0, 1);

        User user = getSessionAttr("user");


        if (user != null) {
            String findConllectionByTopicId = Db.getSql("FindConllectionByTopicId");
            List<Collection> collections = Collection.dao.find(findConllectionByTopicId, id, user.getId());
            setAttr("collections",collections);
        }



        Topic topic = Topic.dao.findById(id);

        if (topic == null) {
            renderHtml("指定的帖子不存在！");
            return;
        } else {

            setAttr("topic", topic);

            Integer pageNumber = getParaToInt("page", 1);//从ftl页面传回第几页，为了实现下一页上一页功能
            SqlPara sqlPara = Db.getSqlPara("ReplyTopic");
            sqlPara.addPara(id);//ReplyTopic中有一个问号，代表一个参数
            Page<Reply> page = Reply.dao.paginate(pageNumber, 5, sqlPara);//分页显示方法
            setAttr("page", page);
            renderFreeMarker("view.ftl");

        }


    }

@Before(Login.class)
    public void reply() {
        boolean success = false;
        Integer userId = getParaToInt("user_id", -1);
        String content = getPara("content", "");
        Integer topicId = getParaToInt("topic_id", -1);
        Reply reply = new Reply();
        Date date = new Date();

        reply.setTopicId(topicId);
        reply.setUserId(userId);
        reply.setContent(content);
        reply.setPubDate(date);
        reply.setStatus(0);
        reply.save();
        success = true;
        String message = success ? "回复成功" : "回复失败";
        Kv result = Kv.by("success", success).set("message", message);
        renderJson(result);
    }
}
