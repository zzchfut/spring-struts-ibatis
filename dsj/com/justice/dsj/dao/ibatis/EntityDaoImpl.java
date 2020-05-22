package com.justice.dsj.dao.ibatis;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.dao.DataAccessException;

import com.ebiz.ssi.dao.EntityDao;
import com.ibatis.sqlmap.client.SqlMapClient;

@Deprecated
public class EntityDaoImpl<T> implements EntityDao<T>{
	
	  @Resource(name = "sqlMapClientDsj") 
	  private SqlMapClient sqlMapClient; 
	
	  public SqlMapClient getSqlMapClient(){
		  return this.sqlMapClient;
	  }

	  public static final String PREFIX_INSERT = "insert";
	  public static final String PREFIX_UPDATE = "update";
	  public static final String PREFIX_DELETE = "delete";
	  public static final String PREFIX_SELECT = "select";
	  public static final String SUFFIX_COUNT = "Count";
	  public static final String SUFFIX_LIST = "List";
	  public static final String SUFFIX_PAGINATED_LIST = "PaginatedList";

	  public Long insertEntity(T t) throws DataAccessException
	  {
	    String statement = "insert" + t.getClass().getSimpleName();
	    try {
			return (Long)getSqlMapClient().insert(statement, t);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	    return null;
	  }

	  public int updateEntity(T t) throws DataAccessException {
	    String statement = "update" + t.getClass().getSimpleName();
	    try {
			return getSqlMapClient().update(statement, t);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	    return 0;
	  }

	  public int deleteEntity(T t) throws DataAccessException {
	    String statement = "delete" + t.getClass().getSimpleName();
	    try {
			return getSqlMapClient().update(statement, t);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	    return 0;
	  }

	  public T selectEntity(T t) throws DataAccessException
	  {
	    String statement = "select" + t.getClass().getSimpleName();
	    try {
			return (T) getSqlMapClient().queryForObject(statement, t);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	    return null;
	  }

	  public Long selectEntityCount(T t) throws DataAccessException {
	    String statement = "select" + t.getClass().getSimpleName() + 
	      "Count";
	    try {
			return (Long) getSqlMapClient().queryForObject(statement, t);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	    return null;
	  }

	  public List<T> selectEntityList(T t) throws DataAccessException
	  {
	    String statement = "select" + t.getClass().getSimpleName() + 
	      "List";
	    try {
			return getSqlMapClient().queryForList(statement, t);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	    return null;
	  }

	  public List<T> selectEntityPaginatedList(T t) throws DataAccessException
	  {
	    String statement = "select" + t.getClass().getSimpleName() + 
	      "PaginatedList";
	    try {
			return getSqlMapClient().queryForList(statement, t);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	    return null;
	  }
}
