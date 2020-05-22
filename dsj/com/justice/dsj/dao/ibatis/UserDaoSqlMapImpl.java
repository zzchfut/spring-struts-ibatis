package com.justice.dsj.dao.ibatis;

import org.springframework.stereotype.Service;

import com.ebiz.ssi.dao.ibatis.EntityDaoSqlMapImpl;
import com.justice.dsj.dao.UserDao;
import com.justice.dsj.domain.User;

@Service
public class UserDaoSqlMapImpl extends EntityDaoSqlMapImpl<User> implements UserDao {

}
