package com.justice.dsj.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.justice.dsj.dao.UserDao;
import com.justice.dsj.domain.User;
import com.justice.dsj.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Resource
	private UserDao userDao;
	
	public Long createUser(User t) {
		return this.userDao.insertEntity(t);
	}

	public User getUser(User t) {
		return this.userDao.selectEntity(t);
	}

	public Long getUserCount(User t) {
		return this.userDao.selectEntityCount(t);
	}

	public List<User> getUserList(User t) {
		return this.userDao.selectEntityList(t);
	}

	public int modifyUser(User t) {
		return this.userDao.updateEntity(t);
	}

	public int removeUser(User t) {
		return this.userDao.deleteEntity(t);
	}

	public List<User> getUserPaginatedList(User t) {
		return this.userDao.selectEntityPaginatedList(t);
	}
}
