package com.ysw.web.service;

import com.ysw.web.dao.ProDao;
import com.ysw.web.entity.PageBean;
import com.ysw.web.entity.Pro;

import java.util.List;

public class ProService {

    ProDao proDao = new ProDao();

    /**
     * 根据cid和分页情况来返回集合
     *
     * @param cid
     * @param currentPage
     * @param pageSize
     * @return
     */
    public PageBean findProsByCid(Integer cid,Integer currentPage,Integer pageSize){

        PageBean pageBean = new PageBean();
        //当前页码
        pageBean.setCurrentPage(currentPage);
        //每一页的数据条数
        pageBean.setPageSize(pageSize);

        //根据cid、currentPage、pageSize返回一个集合
        List<Pro> pros = proDao.findProsByCid(cid,currentPage,pageSize);
        pageBean.setPros(pros);     //把带有数据的集合返回带给pageBean

        //总记录数
        Integer count = proDao.countPros(cid);
        pageBean.setCount(count);

        //总页数 = 总记录数 / 每一页的数据数，向上取整
        pageBean.setTotalPage((int)(Math.ceil(count*1.0/pageSize)));

        //返回一个封装好数据的pageBean对象
        return pageBean;
    }


    /**
     * 根据条件进行动态多条件分页查询(重点)
     *
     * @param maxprice
     * @param minprice
     * @param cid
     * @param pName
     * @param currentPage
     * @param pageSize
     * @return
     */
    public PageBean searchProsPage(Double maxprice,Double minprice,Integer cid,
                                   String pName,Integer currentPage,Integer pageSize){
        PageBean pageBean = new PageBean();

        //设置当前页数
        pageBean.setCurrentPage(currentPage);
        //设置每一页的数据条数
        pageBean.setPageSize(pageSize);
        //根据条件进行查询返回一个带有数据的集合
        List<Pro> pros = proDao.searchPagePros(maxprice,minprice,cid,pName,currentPage,pageSize);
        //把pros这个带有数据的集合放进去
        pageBean.setPros(pros);
        //总记录数
        Integer count = proDao.countSearchPagePro(maxprice,
                minprice,cid,pName,currentPage,pageSize);
        pageBean.setCount(count);
        //总页数 = 总记录数 / 每一页的记录数,有余数就向上取整
        pageBean.setTotalPage((int)(Math.ceil(count*1.0/pageSize)));
        //返回一个带有数据的集合
        return pageBean;
    }

    /**
     * 根据产品名进行模糊查询,返回一个集合
     *
     * @param pName
     * @return
     */
    public List<Pro> findProsByName(String pName){
        return proDao.findProsByName(pName);
    }

    /**
     * 根据id查询产品
     *
     * @param id
     * @return
     */
    public Pro findById(Integer id){
        return proDao.findById(id);
    }

    /**
     * 对商品进行动态多条件分页查询
     *
     * @param pName
     * @param currentPage
     * @param pageSize
     * @return
     */
    public PageBean adminSearchProPage(String pName,Integer currentPage,Integer pageSize){
        PageBean pageBean = new PageBean();

        //设置当前页码
        pageBean.setCurrentPage(currentPage);
        //设置每一页的数据条数
        pageBean.setPageSize(pageSize);
        //根据条件查询返回一个集合给List集合进行封装
        List<Pro> pros = proDao.findAllPro(pName,currentPage,pageSize);
        //把这个集合放入pro对象的集合容器中去
        pageBean.setPros(pros);
        //根据用户名返回总记录数
        Integer count = proDao.getAllProCount(pName);
        //设置总记录数
        pageBean.setCount(count);
        //总页数 = 总记录数 / 每一页的记录数,有余数就向上取整
        pageBean.setTotalPage((int)(Math.ceil(count*1.0/pageSize)));
        //返回一个带有数据的集合
        return pageBean;
    }

    /**
     * 根据传入的pro对象插入数据库
     *
     * @param pro
     * @return
     */
    public Integer addPro(Pro pro){
        return proDao.addPro(pro);
    }

    /**
     * 根据传入的pro对象修改数据库
     *
     * @param pro
     * @return
     */
    public Integer updatePro(Pro pro){
        return proDao.updatePro(pro);
    }

    /**
     * 根据id进行产品的删除
     *
     * @param id
     * @return
     */
    public Integer deletePro(Integer id){
        return proDao.deletePro(id);
    }

}
