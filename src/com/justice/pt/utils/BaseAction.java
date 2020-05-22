package com.justice.pt.utils;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.lang.StringUtils;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionServlet;
import org.springframework.util.Assert;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import com.ebiz.ssi.util.EncryptUtils;
import com.ebiz.ssi.web.struts.BaseSsiAction;
import com.justice.pt.service.Facade;

public abstract class BaseAction extends BaseSsiAction {
	
	private Facade facade;

	protected Facade getFacade() {
		return this.facade;
	}

	public void setServlet(ActionServlet actionServlet) {
		super.setServlet(actionServlet);
		Assert.notNull(actionServlet, "ActionServlet is can not be null");
		ServletContext servletContext = actionServlet.getServletContext();
		WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(servletContext);
		this.facade = (Facade) wac.getBean("facade");
	}

	protected Object getSessionAttribute(HttpServletRequest request, String name) {
		HttpSession session = request.getSession(false);
		return (session != null ? session.getAttribute(name) : null);
	}
	
	public ActionForward toExcels(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {

		response.setCharacterEncoding("utf-8");

		String name = request.getParameter("hiddenName");
		String html = request.getParameter("hiddenHtml");

		try {
			response.setContentType("application/vnd.ms-excel");

			response.addHeader("Content-Disposition", "attachment; filename=\"" + URLEncoder.encode(name, "UTF-8"));
			// response.setContentType("application/vnd.ms-word");
			// response.addHeader("Content-Disposition", "attachment;
			// filename=\"" + URLEncoder.encode(name, "UTF-8")
			// + ".doc\"");

			PrintWriter out = response.getWriter();
			out.println("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">");
			out.println("<html xmlns=\"http://www.w3.org/1999/xhtml\">");
			out.println("<head>");
			out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />");
			out.println("<meta http-equiv=\"MSThemeCompatible\" content=\"no\" />");
			out.println("<meta name=\"MSSmartTagsPreventParsing\" content=\"true\" />");
			out.println("<title>" + name + "</title>");
			out.println("</head>");

			html = html.replace("border=0", "border=1");

			out.println(html);
			out.println("</body>");
			out.println("</html>");
			out.println("<body>");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	protected void renderExcel(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String hiddenHtml = StringUtils.lowerCase(request.getParameter("hiddenHtml"));

		hiddenHtml = StringUtils.replace(hiddenHtml, "border=0", "border=1");
		hiddenHtml = StringUtils.replace(hiddenHtml, "border=\"0\"", "border=\"1\"");

		String fname = EncryptUtils.encodingFileName(request.getParameter("hiddenName"));

		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment;filename=" + fname);

		PrintWriter out = response.getWriter();
		out.println(hiddenHtml);

		out.flush();
		out.close();
	}

	protected String getIpAddr(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}

	public ActionForward callPubMethod(HttpServletRequest request, HttpServletResponse response) {
		String mod_id = (String) request.getParameter("mod_id");// 获取模块ID
		this.setNaviString(request, response, mod_id);

		return null;
	}

	public ActionForward setNaviString(HttpServletRequest request, HttpServletResponse response, String mod_id) {
		String mod_name = "";
		String nav_name = "";
		if (StringUtils.isNotBlank(mod_id)) {
		   // 补充  mod_name 和 nav_name	
		}
		request.setAttribute("mod_name", mod_name);
		request.setAttribute("nav_name", nav_name);
		HttpSession session = request.getSession(false);
		String skin_css = (String) session.getAttribute("skin_css");
		request.setAttribute("skin_css", skin_css);
		return null;
	}

	public ActionForward invalidOperAndShowMsg(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		String msg = super.getMessage(request, "popedom.check.invalid");
		super.renderJavaScript(response, "alert('".concat(msg).concat("');history.back();"));
		return null;
	}

	public void ShowMessageDialog(HttpServletResponse response, String alert) throws IOException {
		response.setContentType("text/html; charset=UTF-8"); // 转码
		PrintWriter out = response.getWriter();
		out.flush();
		out.println("<script>alert('" + alert + "');</script>");
	}	
}