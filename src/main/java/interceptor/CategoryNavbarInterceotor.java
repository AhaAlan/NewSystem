package interceptor;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import model.Category;

import java.util.List;

public class CategoryNavbarInterceotor implements Interceptor{
    @Override
    public void intercept(Invocation invocation) {
        Controller c = invocation.getController();
        String sql = Db.getSql("getAllCategories");
        List<Category> categories =Category.dao.find(sql);
        c.setAttr("categories",categories);
        invocation.invoke();
    }
}
