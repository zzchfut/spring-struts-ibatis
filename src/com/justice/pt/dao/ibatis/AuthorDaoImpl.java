package com.justice.pt.dao.ibatis;

import org.springframework.stereotype.Service;

import com.ebiz.ssi.dao.ibatis.EntityDaoSqlMapImpl;
import com.justice.pt.dao.AuthorDao;
import com.justice.pt.domain.Author;

@Service
public class AuthorDaoImpl extends EntityDaoSqlMapImpl<Author> implements AuthorDao {

}
