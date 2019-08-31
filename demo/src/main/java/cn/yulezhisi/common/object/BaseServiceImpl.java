package cn.yulezhisi.common.object;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.util.Sqls;

import java.lang.reflect.ParameterizedType;
import java.util.Arrays;
import java.util.List;

/**
 * 基本Service
 */

public class BaseServiceImpl <T> implements BaseService<T>{
    
    @Autowired
    Mapper<T> mapper;
    
    private Class<T> cache = null;  //缓存子类泛型类型
    
    /**
     * 添加
     */
    @Override
    public T add(T t) {
        System.out.println(t);
        int i = mapper.insertSelective(t);
        if (i > 0) {
            return t;
        } else {
            return null;
        }
    }
    
    /**
     * 删除 by 主键key
     *
     * @param t
     */
    @Override
    public void delete(T t) {
        mapper.deleteByPrimaryKey(t);
    }
    
    /**
     * 通过主键集合批量删除
     * 数据库主键名必须为id
     *
     * @param ids
     */
    @Override
    public int deleteByIds(List<Integer> ids) {
        Example example = Example.builder(getTypeArguement())
                                 .where(Sqls.custom()
                                            .andIn("id", ids))
                                 .build();
        return mapper.deleteByExample(example);
    }
    
    /**
     * 更新
     */
    @Override
    public int update(T t) {
        return mapper.updateByPrimaryKeySelective(t);
    }
    
    @Override
    public int batchUpdate(T record, Integer[] ids, Object properties) {
        Example example = Example.builder(getTypeArguement())
                                 .where(Sqls.custom()
                                            .andIn("id", Arrays.asList(ids)))
                                 .build();
        return mapper.updateByExample(record, example);
    }
    
    /**
     * 查询一条数据
     */
    @Override
    public T queryOne(T t) {
        return mapper.selectOne(t);
    }
    
    /**
     * 通用查询指定字段service
     *
     * @param where 查询条件
     * @param orderByField 排序字段
     * @param fields 实体类名
     * @return
     */
    @Override
    public T queryOneByFiled(Sqls where, String orderByField, String... fields) {
        return (T) queryByFiledBase(null, null, where, orderByField, fields).get(0);
    }
    
    /**
     * 通过查询字段获取集合
     *
     * @param where where查询条件
     * @param orderByField 排序字段
     * @param fields 检索字段
     */
    @Override
    public List<T> queryListByFiled(Sqls where, String orderByField, String... fields) {
        return queryByFiledBase(null, null, where, orderByField, fields);
    }
    
    /**
     * 通过字段查询分页
     *
     * @param pageNo 起始页
     * @param pageSize 页大小
     * @param where 查询条件
     * @param orderByField 排序字段
     * @param fields 查询字段
     * @return pageInfo 分页对象
     */
    @Override
    public PageInfo<T> queryListByPageAadFiled(Integer pageNo, Integer pageSize, Sqls where, String orderByField, String... fields) {
        return new PageInfo<T>(queryByFiledBase(pageNo, pageSize, where, orderByField, fields));
    }
    
    /**
     * 通过字段查询依托通用方法
     *
     * @param pageNo 起始页
     */
    
    @Override
    public List<T> queryByFiledBase(Integer pageNo, Integer pageSize, Sqls where, String orderByField, String... fields) {
        Example.Builder builder = null;
        if (null == fields || fields.length == 0) {
            //查询所有
            builder = Example.builder(getTypeArguement());
            
        } else {
            //查询指定字段
            builder = Example.builder(getTypeArguement())
                             .select(fields);
        }
        if (where != null) {
            builder = builder.where(where);
        }
        
        if (orderByField != null) {
            builder = builder.orderByDesc(orderByField);
        }
        Example example = builder.build();
        
        if (pageNo != null && pageSize != null) {
            PageHelper.startPage(pageNo, pageSize);    //分页插件
        }
        List list = getMapper().selectByExample(example);
        return list;
    }
    
    /**
     * 查询多条结果
     *
     * @param t 查询条件
     * @return
     */
    @Override
    public List<T> queryList(T t) {
        return mapper.select(t);
    }
    
    /**
     * 分页查询
     *
     * @param t 条件
     * @param pageNo 当前页
     * @param pageSize 页大小
     * @return
     */
    @Override
    public PageInfo<T> queryListByPage(T t, int pageNo, int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        List<T> select = mapper.select(t);
        PageInfo<T> pageInfo = new PageInfo<>(select);
        return pageInfo;
    }
    
    /**
     * 获取子类泛型类型
     *
     */
    @Override
    public Class<T> getTypeArguement() {
        if (cache == null) {
            cache = (Class<T>) ((ParameterizedType) this.getClass()
                                                        .getGenericSuperclass()).getActualTypeArguments()[0];
        }
        return cache;
    }
    
    @Override
    public Mapper getMapper() {
        return mapper;
    }
}
