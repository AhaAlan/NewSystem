package interceptor;

import com.jfinal.core.Controller;
import com.jfinal.kit.Kv;
import com.jfinal.validate.Validator;

/**、
 * 注册参数检测
 * 2022.6.11
 */
public class RegisterValidator extends Validator {
    private String errorKey="error";
    @Override
    protected void validate(Controller c) {
        if(c.getPara("username").isEmpty()){
            addError(errorKey,"用户名不能为空");
        }
        if(c.getPara("password").isEmpty()){
            addError(errorKey,"密码不能为空");
        }
        if(c.getPara("password2").isEmpty()){
            addError(errorKey,"请重新输入密码");
        }
        if(c.getPara("nickName").isEmpty()){
            addError(errorKey,"请输入昵称");
        }
        if(c.getPara("email").isEmpty()){
            addError(errorKey,"请输入邮箱地址");
        }
        if(c.getPara("tel").isEmpty()){
            addError(errorKey,"请输入电话");
        }
    }

    @Override
    protected void handleError(Controller c) {
        String message=c.getAttr(errorKey);
        Kv result=  Kv.by("success",false).set("message",message);
        c.renderJson(result);
    }
}
