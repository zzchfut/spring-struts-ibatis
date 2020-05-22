package com.justice.pt.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.justice.dsj.service.UserService;
import com.justice.pt.service.AuthorService;
import com.justice.pt.service.Facade;

@Service("facade")
public class FacadeImpl implements Facade{
	
	@Resource 
	AuthorService authorService;	
	public AuthorService getAuthorService(){
		return this.authorService;
	}

	@Resource
	UserService userService;	
	public UserService getUserService() {
		return this.userService;
	}

}
