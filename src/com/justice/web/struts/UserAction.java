package com.justice.web.struts;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.DynaBean;
import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.ebiz.ssi.web.struts.bean.Pager;
import com.justice.dsj.domain.User;
import com.justice.pt.utils.BaseAction;

public class UserAction extends BaseAction {
	
	public ActionForward unspecified(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		return this.list(mapping, form, request, response);
	}

	public ActionForward list(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		super.callPubMethod(request, response);

		DynaBean dynaBean = (DynaBean) form;
		Pager pager = (Pager) dynaBean.get("pager");

		User entity = new User();

		super.copyProperties(entity, form);

		Long recordCount = super.getFacade().getUserService().getUserCount(entity);
		pager.init(Long.valueOf(recordCount), pager.getPageSize(), pager.getRequestPage());
		entity.getRow().setFirst(pager.getFirstRow());
		entity.getRow().setCount(pager.getRowCount());

		List<User> entityList = getFacade().getUserService().getUserPaginatedList(entity);
		request.setAttribute("entityList", entityList);

		return mapping.findForward("list");
	}

	public ActionForward add(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		saveToken(request);
		super.callPubMethod(request, response);
		return mapping.findForward("input");
	}

	public ActionForward view(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		super.callPubMethod(request, response);
		
		DynaBean dynaBean = (DynaBean) form;
		String id = (String) dynaBean.get("id");
		if (StringUtils.isBlank(id)) {
			this.saveError(request, "errors.parm", new String[] { id });
			return mapping.findForward("list");
		}
		User entity = new User();
		entity.setId(Long.valueOf(id));
		entity = getFacade().getUserService().getUser(entity);

		super.copyProperties(dynaBean, entity);
		return mapping.findForward("view");
	}

	public ActionForward save(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		if (isCancelled(request)) {
			return list(mapping, form, request, response);
		}
		if (!isTokenValid(request)) {
			saveError(request, "errors.token");
			return list(mapping, form, request, response);
		}
		
		DynaBean dynaBean = (DynaBean) form;
		String id = (String) dynaBean.get("id");
		String mod_id = (String) dynaBean.get("mod_id");

		User entity = new User();
		super.copyProperties(entity, form);

		if (StringUtils.isBlank(id)) {// insert
			super.getFacade().getUserService().createUser(entity);
			saveMessage(request, "entity.inserted");
		} else {// update
			User User = new User();
			User.setId(entity.getId());
			User = getFacade().getUserService().getUser(User);
			if (null != User) {
				getFacade().getUserService().modifyUser(entity);
				saveMessage(request, "entity.updated");
			} else {
				saveError(request, "entity.missing");
			}
		}

		// the line below is added for pagination
		StringBuffer pathBuffer = new StringBuffer();
		pathBuffer.append(mapping.findForward("success").getPath());
		pathBuffer.append("&mod_id=" + mod_id);
		pathBuffer.append("&");
		pathBuffer.append(super.encodeSerializedQueryString(entity.getQueryString()));
		ActionForward forward = new ActionForward(pathBuffer.toString(), true);
		// end
		return forward;
	}

	public ActionForward edit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		saveToken(request);
		super.callPubMethod(request, response);

		DynaBean dynaBean = (DynaBean) form;
		String id = (String) dynaBean.get("id");

		if (StringUtils.isBlank(id)) {
			this.saveError(request, "errors.long", new String[] { id });
			return mapping.findForward("list");
		}

		User entity = new User();
		entity.setId(Long.valueOf(id));
		entity = super.getFacade().getUserService().getUser(entity);
		if (null == entity) {
			saveMessage(request, "entity.missing");
			return mapping.findForward("list");
		}
		// the line below is added for pagination
		entity.setQueryString(super.serialize(request, "id", "method"));
		// end
		super.copyProperties(form, entity);
		return mapping.findForward("input");
	}

	public ActionForward delete(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		DynaBean dynaBean = (DynaBean) form;

		String id = (String) dynaBean.get("id");
		String mod_id = (String) dynaBean.get("mod_id");
		String[] pks = (String[]) dynaBean.get("pks");

		if (!StringUtils.isBlank(id)) {
			User entity = new User();
			entity.setId(Long.valueOf(id));
			super.getFacade().getUserService().removeUser(entity);
			saveMessage(request, "entity.deleted");
		} else if (!ArrayUtils.isEmpty(pks)) {
			User entity = new User();
			entity.getMap().put("pks", pks);
			super.getFacade().getUserService().removeUser(entity);
			saveMessage(request, "entity.deleted");
		}
		// the line below is added for pagination
		StringBuffer pathBuffer = new StringBuffer();
		pathBuffer.append(mapping.findForward("success").getPath());
		pathBuffer.append("&mod_id=" + mod_id);
		pathBuffer.append("&");
		pathBuffer.append(super.encodeSerializedQueryString(super.serialize(request, "id", "pks", "method")));
		ActionForward forward = new ActionForward(pathBuffer.toString(), true);
		// end
		return forward;
	}

}