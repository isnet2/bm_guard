package com.isnetis.util;

import java.util.Enumeration;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;

import com.isnetis.user.domain.SessionUserVO;

public class SessionUtil {

	Logger logger = Logger.getLogger(this.getClass());

	HttpSession session = null;

	private static final int MAXSESSIONTIME = 60 * 60 * 3;

	public SessionUtil() {

	}

	public SessionUtil(HttpServletRequest req, HttpServletResponse res) {
		session = req.getSession();
		session.setMaxInactiveInterval(MAXSESSIONTIME);
	}

	public SessionUtil(HttpServletRequest req) {
		session = req.getSession();
		session.setMaxInactiveInterval(MAXSESSIONTIME);
	}

	public SessionUtil(HttpServletRequest req, SessionUserVO sessionUserVo) {
		session = req.getSession();
		session.setMaxInactiveInterval(MAXSESSIONTIME);
		create("loginUser", sessionUserVo);

		logger.info("viewSession : " + viewSession());

	}

	public SessionUserVO getLoginUser() {
		return (SessionUserVO) get("loginUser");
	}

	public void create(String key, Object value) {
		session.setAttribute(key, value);

	}

	public Object get(String key) {
		return session.getAttribute(key);
	}

	public void remove(String key) {
		session.removeAttribute(key);
	}

	public void invalidate() {

		session.invalidate();
		session.setMaxInactiveInterval(0);
		this.session = null;
	}

	public HttpSession getSession() {
		return session;
	}

	public boolean isLogin() {
		if (get("loginUser") == null || "".equals(get("loginUser"))) {
			return false;
		}
		return true;
	}


	public String viewSession() {
		StringBuffer sessionAll = new StringBuffer();
		Enumeration enumer = null;
		try {
			enumer = session.getAttributeNames();
			sessionAll.append("\n=================  session Start ===================");
			while (enumer.hasMoreElements()) {
				String key = enumer.nextElement().toString();
				sessionAll.append("\n " + key + " : " + session.getAttribute(key).toString());
			}
			sessionAll.append("\n=================  session End ===================");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sessionAll.toString();
	}

}