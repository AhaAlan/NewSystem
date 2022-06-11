package common;

import com.jfinal.config.*;
import com.jfinal.core.Controller;
import com.jfinal.core.JFinal;
import com.jfinal.ext.handler.ContextPathHandler;
import com.jfinal.ext.interceptor.SessionInViewInterceptor;
import com.jfinal.kit.PathKit;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.activerecord.dialect.MysqlDialect;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.template.Engine;
import controller.*;
import jfinal.ext.freemarker.FreemarkerHelper;
import model._MappingKit;

/**
 * 启动文件
 * 可以看做是Jfinal项目的启动文件
 * 2022.6.11
 */

public class MainConfig extends JFinalConfig {
    @Override
    public void configConstant(Constants constants) {
        //加载配置文件，文件路径/resources
        loadPropertyFile("myconfig.properties");
        //设置开发模式，读取配置文件中的设置值，若无则为false
        constants.setDevMode(getPropertyToBoolean("devMode", false));
        //注册freemarker扩展标签，实现模板继承
        FreemarkerHelper.registerExtensionTag();
    }

    @Override
    public void configRoute(Routes routes) {
        //设置模板文件的根目录路径， 从webapp开始    /template 表明模板要放到template目录中
        routes.setBaseViewPath("/template");
        /*注册一个路由   /开头的url由MainController处理，viewPath参数设置该控制器的模板子目录
        从BaseViewPath开始的路径 默认为controllerKey*/
        routes.add("/category", CategoryController.class,"category");//模板路径 /template/category
        //routes.add("/category", CategoryController.class); 第三个参数//模板路径 /template
        routes.add("/", MainController.class, "");
//        routes.add("/topic",TopicController.class,"");
        routes.add("/user", UserController.class,"user");
        routes.add("/admin", AdminController.class,"admin");
        routes.add("/topic", TopicController.class,"topic");

    }

    //模板引擎模块
    //项目升级如果不使用Template Engine该方法可以留空。
    @Override
    public void configEngine(Engine engine) {

    }

    // 配置了两个插件：DruidPlugin与ActiveRecordPlugin，前者是druid数据源插件，后者是ActiveRecrod支持插件
    @Override
    public void configPlugin(Plugins plugins) {
        //1.创建druid数据源插件
        //从myconfig.properties中读取数据库jdbc连接信息 建立一个Druid数据库连接池插件
        DruidPlugin dp = new DruidPlugin(getProperty("jdbcUrl"), getProperty("user", "root"), getProperty("password", "password"));
        plugins.add(dp);

        //2.创建ActiveRecord插件
        //ActiveReceord 中定义了 addMapping()方法，该方法建立了数据库表名到 Model 的映射关系。
        ActiveRecordPlugin arp = new ActiveRecordPlugin(dp);
        arp.setDialect(new MysqlDialect());//设置SQL方言为MySQL
        _MappingKit.mapping(arp);
        arp.setBaseSqlTemplatePath(PathKit.getRootClassPath());
        arp.addSqlTemplate("sql.jtl");
        plugins.add(arp);

    }

    //添加Session拦截器，可以在模板中使用会话
    @Override
    public void configInterceptor(Interceptors interceptors) {
        interceptors.add(new SessionInViewInterceptor());
    }

    //添加上下文handler，可以在模板中使用${base}获取应用上下文路径
    @Override
    public void configHandler(Handlers handlers) {
        handlers.add(new ContextPathHandler("base"));
    }

    //启动程序
    //使用Jetty运行Jfinal项目，port参数为端口默认8080， context为上下文路径
    //完整的项目URL   http://server_or_ip:port/context/controller-key
    public static void main(String[] args) {
        JFinal.start("src/main/webapp", 8080, "/");
    }
}
