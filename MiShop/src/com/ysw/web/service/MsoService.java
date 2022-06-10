package com.ysw.web.service;


import com.ysw.web.dao.MsoDao;
import com.ysw.web.entity.*;

import java.util.List;

public class MsoService {

    MsoDao msoDao = new MsoDao();

    //提交订单的方法
    public void submitMso(Mso mso){
        //添加mso对象的方法
        msoDao.addMso(mso);
        //存储orderItem
        for (Msoxq xq: mso.getMsoxqs()) {
            msoDao.addMsoxq(xq);
        }
        //修改库存与销量
        msoDao.updateProNum(mso);
    }

    /**
     * 根据userid返回一个产品集合
     *
     * @param userid
     * @return
     */
    public List<UserMso> findMsoByUserId(Integer userid){
        return msoDao.findMsoByUserId(userid);
    }

    /**
     * 根据msoid查询list集合
     *
     * @param msoid
     * @return
     */
    public List<UserMso> findMsoByMsoId(String msoid){
        return msoDao.findMsoByMsoId(msoid);
    }

    /**
     * 根据msoid来修改指定订单的付款状态
     *
     * @param msoid
     * @return
     */
    public Integer updateMsoPayState(String msoid){
        return msoDao.updateMsoPayState(msoid);
    }

    /**
     * 根据msoid来修改指定的订单发货状态
     *
     * @param msoid
     * @return
     */
    public Integer yiFahuo(String msoid){
        return msoDao.yiFahuo(msoid);
    }

    /**
     * 根据msoid删除msoxq中的订单数据
     *
     * @param msoid
     * @return
     */
    public Integer deleteMsoxqByMsoid(String msoid){
        return msoDao.deleteMsoxqByMsoid(msoid);
    }

    /**
     * 根据msoid删除mso中的订单数据
     *
     * @param msoid
     * @return
     */
    public Integer deleteMsoByMsoid(String msoid){
        return msoDao.deleteMsoByMsoid(msoid);
    }

    /**
     * 根据传进来的订单号，将已发货变成已收货
     *
     * @param msoid
     * @return
     */
    public Integer querenShouhuo(String msoid){
        return msoDao.querenShouhuo(msoid);
    }

    /**
     * 根据msoid进行分页查询，如果没有msoid就直接分页
     *
     * @param msoid
     * @param currentPage
     * @param pageSize
     * @return
     */
    public PageBeanMso searchMsoPage(String msoid,Integer currentPage,Integer pageSize){

        PageBeanMso pageBeanMso = new PageBeanMso();

        //设置当前的页数
        pageBeanMso.setCurrentPage(currentPage);
        //设置每一页的记录数
        pageBeanMso.setPageSize(pageSize);
        //根据条件返回一个带有数据的集合
        List<Mso> msos = msoDao.findAllMso(msoid,currentPage,pageSize);
        //最后得到返回的集合放入pageBean中去
        pageBeanMso.setMsos(msos);
        //返回总记录数，如果msoid为空的话就返回总记录数，否则只返回一个订单数
        Integer count = msoDao.countByMsoid(msoid);
        pageBeanMso.setCount(count);
        //总页数 = 总记录数 / 每一页的记录数,有余数就向上取整
        pageBeanMso.setTotalPage((int)(Math.ceil(count*1.0/pageSize)));

        return pageBeanMso;
    }

}
