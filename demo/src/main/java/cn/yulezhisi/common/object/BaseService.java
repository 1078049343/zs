package cn.yulezhisi.common.object;

import com.github.pagehelper.PageInfo;
import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.util.Sqls;

import java.util.List;

/**
 * @author yulezhisi
 **/

public interface BaseService <T>{
    T add(T t);
    
    void delete(T t);
    
    int deleteByIds(List<Integer> ids);
    
    int update(T t);
    
    int batchUpdate(T record, Integer[] ids, Object properties);
    
    T queryOne(T t);
    
    T queryOneByFiled(Sqls where, String orderByField, String... fields);
    
    List<T> queryListByFiled(Sqls where, String orderByField, String... fields);
    
    PageInfo<T> queryListByPageAadFiled(Integer pageNo, Integer pageSize, Sqls where, String orderByField, String... fields);
    
    List<T> queryByFiledBase(Integer pageNo, Integer pageSize, Sqls where, String orderByField, String... fields);
    
    List<T> queryList(T t);
    
    PageInfo<T> queryListByPage(T t, int pageNo, int pageSize);
    
    Class<T> getTypeArguement();
    
    Mapper getMapper();
}
