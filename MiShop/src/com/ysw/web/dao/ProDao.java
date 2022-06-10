package com.ysw.web.dao;

import com.ysw.web.entity.Mso;
import com.ysw.web.entity.Pro;
import com.ysw.web.utils.JDBCUtils;
import com.ysw.web.utils.TimeUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

// 产品的dao层
public class ProDao extends JDBCUtils {

    /**
     * 这里我先做一个根据cid进行查询
     * 返回的是商品集合
     * @param cid   产品类别号
     * @param currentPage   当前页数
     * @param pageSize      每一页的有多少条数据
     * @return
     */
    public List<Pro> findProsByCid(Integer cid,Integer currentPage,Integer pageSize){

        //初始化pro集合
        List<Pro> pros = new ArrayList<>();
        Pro pro = null;

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try{
            //获取资源链接对象
            conn = getConnection();
            //定义sql
            String sql = "select * from pro where cid = ?  ORDER BY id ASC limit ? , ?";
            //创建sql执行对象
            pstmt = conn.prepareStatement(sql);
            //给?,?进行赋值,第一个是当前开始索引的记录位置,第二个是索引的条数
            //第一个参数是（当前页数-1）*每一页记录数，代表开始索引的位置
            //第二个参数是每一页的记录数
            pstmt.setInt(1,cid);    //类别的id
            pstmt.setInt(2,(currentPage - 1)*pageSize); //开始索引的位置
            pstmt.setInt(3,pageSize);       //索引的条数
            //执行sql
            rs = pstmt.executeQuery();
            while (rs.next()){
                //初始化pro集合
                pro = new Pro();
                pro.setId(rs.getInt("id"));
                pro.setpName(rs.getString("pName"));
                pro.setpSn(rs.getString("pSn"));
                pro.setpNum(rs.getInt("pNum"));
                pro.setmPrice(rs.getDouble("mPrice"));
                pro.setiPrice(rs.getDouble("iPrice"));
                pro.setpDesc(rs.getString("pDesc"));
                pro.setpImg(rs.getString("pImg"));
                pro.setPubTime(rs.getString("pubTime"));
                pro.setIsShow(rs.getInt("isShow"));
                pro.setIsHot(rs.getInt("isHot"));
                pro.setCid(rs.getInt("cid"));
                pro.setXqImg(rs.getString("xqImg"));

                //把所有查询出来的对象都放入list集合中去
                pros.add(pro);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs,pstmt,conn);
        }
        //返回一个带有数据的集合
        return pros;
    }

    /**
     * 根据cid返回总记录数
     *
     * @param cid
     * @return
     */
    public Integer countPros(Integer cid){

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        Integer num = 0;

        try {
            conn = getConnection();
            String sql = "select count(*) from pro where cid = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,cid);
            rs = pstmt.executeQuery();
            while (rs.next()){
                //获取第一行第一列的数字给num
                num = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs,pstmt,conn);
        }
        return num;
    }

    //这里要实现一个动态分页查询的功能，要写两个dao
    public List<Pro> searchPagePros(Double maxprice,Double minprice,Integer cid,
                                    String pName,Integer currentPage,Integer pageSize){

        //难点：初始化一个list集合，用于存储数据
        List<Pro> pros = new ArrayList<>();
        //这个用于存储查询的条件
        //  因为list集合是按顺序插入的,有序排列,所以这里可以用来存储参数
        List list = new ArrayList();

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {

            //创建资源连接对象
            conn = getConnection();
            String sql = "select * from pro where 1 = 1";

            //网站价格iPrice < 最高价格
            if (maxprice != 0.0) {
                sql = sql + " and iPrice < ?";
                list.add(maxprice); //放入第一个参数
            }

            //网站最低价 < iPrice
            if (minprice != 0.0) {
                sql = sql + " and iPrice > ?";
                list.add(minprice);
            }

            //如果有类别号的话，就
            if (cid != 0) {
                sql = sql + " and cid = ?";
                list.add(cid);
            }

            //用户所查询的商品名不为空的时候，也要加入条件
            if (pName != null && !"".equals(pName.trim())) {
                sql = sql + " and pName like ?";
                list.add("%" + pName.trim() + "%");
            }

            sql = sql + " ORDER BY id ASC limit ? , ?";
            //第一个参数是开始索引的位置
            list.add((currentPage - 1)*pageSize);
            //第二个参数是每一页的记录数
            list.add(pageSize);

            //创建sql执行对象
            pstmt = conn.prepareStatement(sql);

            //这里要给我们 ? 进行赋值,当我们集合里面有参数的时候
            if (list.size() > 0) {
                //遍历集合
                for (int i = 0; i < list.size(); i++) {
                    //给我们的第 i + 1 个参数赋值,赋值为集合里面存储的数据
                    pstmt.setObject(i + 1, list.get(i));
                }
            }

            //执行sql
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Pro pro = new Pro();

                pro.setId(rs.getInt("id"));
                pro.setpName(rs.getString("pName"));
                pro.setpSn(rs.getString("pSn"));
                pro.setpNum(rs.getInt("pNum"));
                pro.setmPrice(rs.getDouble("mPrice"));
                pro.setiPrice(rs.getDouble("iPrice"));
                pro.setpDesc(rs.getString("pDesc"));
                pro.setpImg(rs.getString("pImg"));
                pro.setPubTime(rs.getString("pubTime"));
                pro.setIsShow(rs.getInt("isShow"));
                pro.setIsHot(rs.getInt("isHot"));
                pro.setCid(rs.getInt("cid"));
                pro.setXqImg(rs.getString("xqImg"));

                //把带有数据的集合存入pros集合
                pros.add(pro);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs,pstmt,conn);
        }
        //最终返回一个带有数据的集合
        return pros;
    }

    /**
     * 查询动态分页查询的总记录数
     *
     * @param maxprice
     * @param minprice
     * @param cid
     * @param pName
     * @param currentPage
     * @param pageSize
     * @return
     */
    public Integer countSearchPagePro(Double maxprice,Double minprice,Integer cid,
                                      String pName,Integer currentPage,Integer pageSize){

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        Integer num = 0;

        List list = new ArrayList();

        try {
            //创建资源链接对象
            conn = getConnection();
            String sql = "select count(*) from pro where 1 = 1 ";

            //网站价格iPrice < 最高价格
            if (maxprice != 0.0) {
                sql = sql + " and iPrice <= ?";
                list.add(maxprice); //放入第一个参数
            }

            //网站最低价 < iPrice
            if (minprice != 0.0) {
                sql = sql + " and iPrice >= ?";
                list.add(minprice);
            }

            //如果有类别号的话，就
            if (cid != 0) {
                sql = sql + " and cid = ?";
                list.add(cid);
            }

            //用户所查询的商品名不为空的时候，也要加入条件
            if (pName != null && !"".equals(pName.trim())) {
                sql = sql + " and pName like ?";
                list.add("%" + pName.trim() + "%");
            }

            sql = sql + " ORDER BY id ASC";

            //创建sql执行对象
            pstmt = conn.prepareStatement(sql);

            //这里要给我们 ? 进行赋值,当我们集合里面有参数的时候
            if (list.size() > 0) {
                //遍历集合
                for (int i = 0; i < list.size(); i++) {
                    //给我们的第 i + 1 个参数赋值,赋值为集合里面存储的数据
                    pstmt.setObject(i + 1, list.get(i));
                }
            }

            //执行sql
            rs = pstmt.executeQuery();

            while (rs.next()) {
                //把第一行数据提取出来
                num = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs,pstmt,conn);
        }
        //返回查询到的记录总数
        return num;
    }

    /**
     * 根据用户名查询,返回一个带有数据的集合
     *
     * @param pName
     * @return
     */
    public List<Pro> findProsByName(String pName){

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        List<Pro> pros = new ArrayList<>();

        try {
            //创建资源连接对象
            conn = getConnection();
            //定义sql
            String sql = "select * from pro where pName like ?";
            //创建sql执行对象
            pstmt = conn.prepareStatement(sql);
            //给参数赋值
            pstmt.setString(1,"%" + pName + "%");
            //执行sql
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Pro pro = new Pro();

                pro.setId(rs.getInt("id"));
                pro.setpName(rs.getString("pName"));
                pro.setpSn(rs.getString("pSn"));
                pro.setpNum(rs.getInt("pNum"));
                pro.setmPrice(rs.getDouble("mPrice"));
                pro.setiPrice(rs.getDouble("iPrice"));
                pro.setpDesc(rs.getString("pDesc"));
                pro.setpImg(rs.getString("pImg"));
                pro.setPubTime(rs.getString("pubTime"));
                pro.setIsShow(rs.getInt("isShow"));
                pro.setIsHot(rs.getInt("isHot"));
                pro.setCid(rs.getInt("cid"));
                pro.setXqImg(rs.getString("xqImg"));

                //把带有数据的集合存入pros集合
                pros.add(pro);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rs,pstmt,conn);
        }
        return pros;
    }

    /**
     * 根据id查询我们的pro产品对象
     *
     * @param id
     * @return
     */
    public Pro findById(Integer id){
        Pro pro = new Pro();

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            //创建资源链接对象
            conn = getConnection();
            //定义sql
            String sql = "select * from pro where id = ?";
            //创建sql执行对象
            pstmt = conn.prepareStatement(sql);
            //给参数进行赋值
            pstmt.setInt(1,id);
            rs = pstmt.executeQuery();
            while (rs.next()){

                pro.setId(rs.getInt("id"));
                pro.setpName(rs.getString("pName"));
                pro.setpSn(rs.getString("pSn"));
                pro.setpNum(rs.getInt("pNum"));
                pro.setmPrice(rs.getDouble("mPrice"));
                pro.setiPrice(rs.getDouble("iPrice"));
                pro.setpDesc(rs.getString("pDesc"));
                pro.setpImg(rs.getString("pImg"));
                pro.setPubTime(rs.getString("pubTime"));
                pro.setIsShow(rs.getInt("isShow"));
                pro.setIsHot(rs.getInt("isHot"));
                pro.setCid(rs.getInt("cid"));
                pro.setXqImg(rs.getString("xqImg"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        //是带有封装好数据的pro
        return pro;
    }

    /**
     * 根据产品名查询所有产品，进行动态多条件分页查询
     *
     * @param pName
     * @param currentPage
     * @param pageSize
     * @return
     */
    public List<Pro> findAllPro(String pName,Integer currentPage,Integer pageSize){

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        //初始化一个集合用于保存对象
        List<Pro> pros = new ArrayList<>();
        //按照list集合顺序插入我们的数据，用于存储参数
        List list = new ArrayList();

        try {
            //创建资源链接对象
            conn = getConnection();
            //定义sql
            String sql = "select * from pro where 1 = 1 ";

            //如果用户名不为空的话，就加入作为参数条件
            if (pName != null && !"".equals(pName)) {
                sql = sql + " and pName like ? ";
                list.add("%" + pName + "%");
            }

            //加入分页条件并按id进行排序
            sql = sql + " order by id asc limit ? , ?";
            list.add((currentPage - 1)*pageSize);
            list.add(pageSize);

            //创建sql执行对象
            pstmt = conn.prepareStatement(sql);

            //给?进行赋值操作
            if (list.size() > 0) {
                for (int i = 0; i < list.size(); i++) {
                    //给我们第i+1个参数进行赋值操作，赋值为list集合里面保存的数据
                    pstmt.setObject(i + 1 , list.get(i));
                }
            }

            rs = pstmt.executeQuery();
            while (rs.next()){
                Pro pro = new Pro();

                pro.setId(rs.getInt("id"));
                pro.setpName(rs.getString("pName"));
                pro.setpSn(rs.getString("pSn"));
                pro.setpNum(rs.getInt("pNum"));
                pro.setPubTime(rs.getString("pubTime"));
                pro.setiPrice(rs.getDouble("iPrice"));
                pro.setpImg(rs.getString("pImg"));
                pro.setIsHot(rs.getInt("isHot"));
                pro.setCid(rs.getInt("cid"));

                pros.add(pro);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs,pstmt,conn);
        }
        //返回一个带有数据的pro集合对象
        return pros;
    }

    /**
     * 根据产品名查询所有产品，进行动态多条件分页查询
     *
     * @param pName
     * @return
     */
    public Integer getAllProCount(String pName){

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        //按照list集合顺序插入我们的数据，用于存储参数
        List list = new ArrayList();
        //返回影响行数
        Integer num = 0;

        try {
            //创建资源链接对象
            conn = getConnection();
            //定义sql
            String sql = "select count(*) from pro where 1 = 1 ";

            //如果用户名不为空的话，就加入作为参数条件
            if (pName != null && !"".equals(pName)) {
                sql = sql + " and pName like ? ";
                list.add("%" + pName + "%");
            }

            //创建sql执行对象
            pstmt = conn.prepareStatement(sql);

            //给?进行赋值操作
            if (list.size() > 0) {
                for (int i = 0; i < list.size(); i++) {
                    //给我们第i+1个参数进行赋值操作，赋值为list集合里面保存的数据
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
        //返回一个带有数据的pro集合对象
        return num;
    }

    /**
     * 新增产品的方法
     *
     * @param pro
     * @return
     */
    public Integer addPro(Pro pro){
        String sql = "insert into pro(pName,pSn,pNum,mPrice,iPrice,pImg,pubTime,isShow,isHot,cid) values (?,?,?,?,?,?,?,?,?,?)";
        Object[] params = {pro.getpName(),pro.getpSn(),pro.getpNum(),pro.getmPrice(),pro.getiPrice(),
                            "proimages/" + pro.getpImg(), TimeUtils.getTime(),1,0,pro.getCid()};
        return myExecuteUpdate(sql,params);
    }

    /**
     * 新增产品的方法
     *
     * @param pro
     * @return
     */
    public Integer updatePro(Pro pro){
        String sql = "update pro set pName = ?,pSn = ?,pNum = ?,mPrice = ?,iPrice = ?,pImg = ?,pubTime = ?,isShow = ?,isHot = ?,cid = ? where id = ?";
        Object[] params = {pro.getpName(),pro.getpSn(),pro.getpNum(),pro.getmPrice(),pro.getiPrice(),
                "proimages/" + pro.getpImg(), TimeUtils.getTime(),1,0,pro.getCid(),pro.getId()};
        return myExecuteUpdate(sql,params);
    }

    /**
     * 根据id进行产品的删除
     *
     * @param id
     * @return
     */
    public Integer deletePro(Integer id){
        String sql = "delete from pro where id = ?";
        Object[] params = {id};
        return myExecuteUpdate(sql,params);
    }

}
