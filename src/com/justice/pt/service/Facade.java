package com.justice.pt.service;

import com.justice.dsj.service.UserService;

public interface Facade {
	AuthorService getAuthorService();
	UserService getUserService();
}
