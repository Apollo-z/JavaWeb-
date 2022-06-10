package com.ysw.web.dao;

import com.ysw.web.entity.Mso;
import com.ysw.web.entity.Msoxq;
import com.ysw.web.entity.UserMso;
import com.ysw.web.utils.JDBCUtils;
import com.ysw.web.utils.TimeUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 订单的dao层
 */
public class MsoDao extends JDBCUtils {

    //想数据库中插入订单
    public Integer addMso(Mso mso){

        String sql = "insert into mso(msoid,msoname,telephone,msoTime,paystate," +
                "subtotal,address,userid) values(?,?,?,?,?,?,?,?)";
        Object[] params = {mso.getMsoid(),mso.getMsoname(),mso.getTelephone(),mso.getMsoTime(),
                    mso.getPayState(),mso.getSubtotal(),mso.getAddress(),mso.getUserid()};
        return myExecuteUpdate(sql,params);
    }

    //向msoxq表插入数据
    public Integer addMsoxq(Msoxq msoxq){
        String sql = "insert into msoxq(msoid,count,proid,subtotal,pImg,pSn) " +
                "values(?,?,?,?,?,?)";
        Object[] params = {msoxq.getMso().getMsoid(),msoxq.getCount(),msoxq.getPro().getId(),
                msoxq.getPro().getiPrice()*msoxq.getCount(),msoxq.getpImg(),msoxq.getPro().getpSn()};
        return myExecuteUpdate(sql,params);
    }

    //新增一个修改库存的dao层方法
    public void updateProNum(Mso mso){
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            //初始化一个集合用于接收我们的msoxq对象
            List<Msoxq> orderItems = mso.getMsoxqs();
            //创建资源链接对象
            conn = getConnection();
            //定义sql
            String sql = "update pro set pNum = pNum-?,isHot=isHot+? where id = ?";
            //创建sql执行对象
            pstmt = conn.prepareStatement(sql);
            for (int i = 0; i < orderItems.size(); i++) {
                pstmt.setInt(1,orderItems.get(i).getCount());
                pstmt.setInt(2,orderItems.get(i).getCount());
                pstmt.setInt(3,orderItems.get(i).getPro().getId());
                pstmt.addBatch();
            }
            pstmt.executeBatch();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(null,pstmt,conn);
        }
    }

    //根据用户的id展示用户的订单详情
    public List<UserMso> findMsoByUserId(Integer userid){

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        //初始化一个集合用于保存对象
        List<UserMso> list = new ArrayList<>();

        try {
            //创建资源连接对象
            conn =getConnection();
            //定义sql
            String sql = "SELECT * FROM mso LEFT OUTER JOIN msoxq ON mso.msoid = msoxq.msoid WHERE userid = ? ORDER BY msoxq.id ASC";
            //创建sql执行对象
            pstmt = conn.prepareStatement(sql);
            //给参数赋值
            pstmt.setInt(1,userid);

            //执行sql
            rs = pstmt.executeQuery();
            while (rs.next()) {

                UserMso userMso = new UserMso();

                userMso.setId(rs.getInt("id"));
                userMso.setMsoid(rs.getString("msoid"));
                userMso.setMsoname(rs.getString("msoname"));
                userMso.setTelephone(rs.getString("telephone"));
                userMso.setMsoTime(rs.getString("msoTime"));
                userMso.setPaystate(rs.getString("paystate"));
                userMso.setSubtotal(rs.getDouble(7));
                userMso.setAddress(rs.getString("address"));
                userMso.setUserid(rs.getString("userid"));
                userMso.setDeliveryState(rs.getString("deliveryState"));
                userMso.setCount(rs.getInt("count"));
                userMso.setProid(rs.getInt("proid"));
                userMso.setSingleprototal(rs.getDouble(15));
                userMso.setpImg(rs.getString("pImg"));
                userMso.setpSn(rs.getString("pSn"));

                list.add(userMso);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs,pstmt,conn);
        }
        return list;
    }

    //根据msoid展示订单详情
    public List<UserMso> findMsoByMsoId(String msoid){

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        //初始化一个集合用于保存对象
        List<UserMso> list = new ArrayList<>();

        try {
            //创建资源连接对象
            conn =getConnection();
            //定义sql
            String sql = "SELECT * FROM mso LEFT OUTER JOIN msoxq ON mso.msoid = msoxq.msoid WHERE mso.msoid = ? ORDER BY msoxq.id ASC";
            //创建sql执行对象
            pstmt = conn.prepareStatement(sql);
            //给参数赋值
            pstmt.setString(1,msoid);

            //执行sql
            rs = pstmt.executeQuery();
            while (rs.next()) {

                UserMso userMso = new UserMso();

                userMso.setId(rs.getInt("id"));
                userMso.setMsoid(rs.getString("msoid"));
                userMso.setMsoname(rs.getString("msoname"));
                userMso.setTelephone(rs.getString("telephone"));
                userMso.setMsoTime(rs.getString("msoTime"));
                userMso.setPaystate(rs.getString("paystate"));
                userMso.setSubtotal(rs.getDouble(7));
                userMso.setAddress(rs.getString("address"));
                userMso.setUserid(rs.getString("userid"));
                userMso.setDeliveryState(rs.getString("deliveryState"));
                userMso.setCount(rs.getInt("count"));
                userMso.setProid(rs.getInt("proid"));
                userMso.setSingleprototal(rs.getDouble(15));
                userMso.setpImg(rs.getString("pImg"));
                userMso.setpSn(rs.getString("pSn"));

                list.add(userMso);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs,pstmt,conn);
        }
        return list;
    }

    /**
     * 根据msoid订单号修改订单的支付状态
     *
     * @param msoid
     * @return
     */
    public Integer updateMsoPayState(String msoid){
        String sql = "update mso set paystate = '已付款' where msoid = ?";
        Object[] params = {msoid};
        return myExecuteUpdate(sql,params);
    }

    /**
     * 根据msoid删除mso表中的订单数据
     *
     * @param msoid
     * @return
     */
    public Integer deleteMsoByMsoid(String msoid){
        String sql = "delete from mso where msoid = ?";
        Object[] params = {msoid};
        return myExecuteUpdate(sql,params);
    }

    /**
     * 根据msoid删除msoxq中的订单数据
     *
     * @param msoid
     * @return
     */
    public Integer deleteMsoxqByMsoid(String msoid){
        String sql = "delete from msoxq where msoid = ?";
        Object[] params = {msoid};
        return myExecuteUpdate(sql,params);
    }

    /**
     * 根据传进来的msoid来进行确认收货操作
     *
     * @param msoid
     * @return
     */
    public Integer querenShouhuo(String msoid){
        String sql = "update mso set deliveryState = '已收货' where msoid = ?";
        Object[] param = {msoid};
        return myExecuteUpdate(sql,param);
    }

    /**
     * 根据msoid更新货物当前的状态为已发货
     *
     * @param msoid
     * @return
     */
    public Integer yiFahuo(String msoid){
        String sql = "update mso set deliveryState = '已发货' where msoid = ?";
        Object[] param = {msoid};
        return myExecuteUpdate(sql,param);
    }

    /**
     * 动态多条件分页查询所有的mso
     * 然后再根据msoid查询所有的msoxq
     *
     * @param msoid             订单id
     * @param currentPage       当前页码
     * @param pageSize          每一页的总记录数
     * @return
     */
    public List<Mso> findAllMso(String msoid,Integer currentPage,Integer pageSize){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        //初始化一个集合用于保存对象
        List<Mso> msos = new ArrayList<>();
        //按照list集合顺序插入我们的数据，用于存储参数
        List list = new ArrayList();

        try {
            //创建资源链接对象
            conn = getConnection();
            //定义sql
            String sql = "select * from mso where 1 = 1 ";

            //如果前端传过来的msoid不为0则说明当前有参数传过来
            if (msoid != null && !"".equals(msoid)) {
                sql = sql + " and msoid like ?";
                //加入条件
                list.add("%" + msoid + "%");
            }

            //根据id进行排序并进行分页操作
            sql = sql + " ORDER BY id ASC limit ? , ?";
            //第一个参数是开始索引的位置
            list.add((currentPage - 1)*pageSize);
            //第二个参数是每一页的记录数
            list.add(pageSize);

            //执行sql
            pstmt = conn.prepareStatement(sql);

            //这里要给我们 ? 进行赋值,当我们集合里面有参数的时候
            if (list.size() > 0) {
                //遍历集合
                for (int i = 0; i < list.size(); i++) {
                    //给我们的第 i + 1 个参数赋值,赋值为集合里面存储的数据
                    pstmt.setObject(i + 1, list.get(i));
                }
            }

            rs = pstmt.executeQuery();
            while (rs.next()){

                Mso mso = new Mso();
                mso.setId(rs.getInt("id"));
                mso.setMsoid(rs.getString("msoid"));
                mso.setMsoname(rs.getString("msoname"));
                mso.setTelephone(rs.getString("telephone"));
                mso.setAddress(rs.getString("address"));
                mso.setMsoTime(rs.getString("msoTime"));
                mso.setMsostate(rs.getString("deliveryState"));     //发货状态
                mso.setSubtotal(rs.getDouble("subtotal"));
                mso.setPayState(rs.getString("paystate"));
                mso.setUserid(rs.getInt("userid"));

                //把mso对象放入msos集合进行返回
                msos.add(mso);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs,pstmt,conn);
        }
        return msos;
    }

    /**
     * 根据订单号返回总个数
     *
     * @param msoid
     * @return
     */
    public Integer countByMsoid(String msoid){

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        Integer num = 0;

        List list = new ArrayList();

        try {
            //创建资源链接对象
            conn = getConnection();
            //定义sql
            String sql = "select count(*) from mso where 1 = 1 ";

            if (msoid != null && !"".equals(msoid)){
                sql = sql + " and msoid like ?";
                list.add("%" + msoid + "%");
            }

            sql = sql + " ORDER BY id ASC";

            //创建sql执行对象
            pstmt = conn.prepareStatement(sql);

            //这里要给我们 ? 进行赋值,当我们集合里面有参数的时候
            if (list.size() > 0) {
                //遍历集合
                for (int i = 0; i < list.size(); i++) {
                    //给我们的第 i + 1 个参数赋值,赋值为集合里面存储的数据
                    pstmt.setObject(i + 1 , list.get(i));
                }
            }

            rs = pstmt.executeQuery();

            while (rs.next()){
                num = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs,pstmt,conn);
        }
        //最后返回总记录个数
        return num;
    }

//    public static void main(String[] args) {
//
//        MsoDao msoDao = new MsoDao();
//        System.out.println(msoDao.countByMsoid("2020"));
//
//    }

}
