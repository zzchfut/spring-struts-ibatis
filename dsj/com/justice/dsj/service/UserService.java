package com.justice.dsj.service;

import java.util.List;

import com.justice.dsj.domain.User;

public interface UserService {

	Long createUser(User t);

	int modifyUser(User t);

	int removeUser(User t);

	User getUser(User t);

	List<User> getUserList(User t);

	Long getUserCount(User t);

	List<User> getUserPaginatedList(User t);

}