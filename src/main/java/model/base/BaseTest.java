package model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings({"serial", "unchecked"})
public abstract class BaseTest<M extends BaseTest<M>> extends Model<M> implements IBean {

	public M setId(java.lang.Integer id) {
		set("id", id);
		return (M)this;
	}
	
	public java.lang.Integer getId() {
		return getInt("id");
	}

	public M setTitle(java.lang.String title) {
		set("title", title);
		return (M)this;
	}
	
	public java.lang.String getTitle() {
		return getStr("title");
	}

	public M setInfo(java.lang.String info) {
		set("info", info);
		return (M)this;
	}
	
	public java.lang.String getInfo() {
		return getStr("info");
	}

	public M setAvatar(java.lang.String avatar) {
		set("avatar", avatar);
		return (M)this;
	}
	
	public java.lang.String getAvatar() {
		return getStr("avatar");
	}

}
