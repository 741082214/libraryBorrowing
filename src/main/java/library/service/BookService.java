package library.service;

import library.domain.*;
import org.apache.ibatis.annotations.Select;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

public interface BookService {
    /*
     * 查询所有图书
     * */
    List<BookInfoBean> findAllBook();

    /*
     * 根据ISBN查找书名
     * */
    String findName(String ISBN);
    /**
     * 更新图书种类
     */
    int updateKindsbooks(String typeId,String typeName);


    /**
     * 捐献图书，数据保存在图书捐献表
     */
    int addBooks(BookInfoBean bookInfo);

    /**
     * 删除图书
     */
    int deleteBooks(String ISBN);

    /*
        上架/下架图书
     */
    int onBooks( String ISBN,String shelves);
    int onAdminBooks( String ISBN,String shelves);
    /*
        下架图书（在删除的时候）
     */
    int offBooks(String ISBN);

    int offAdminBooks(String ISBN);
    /**
     * 借阅书籍记录
     */
    int borrowBook(BorrowBean borrowBean);
    /*
     *  减少书籍库存
     * */
    void reduceBookStock(String ISBN);

    /**
     * 归还图书
     */
    int backBook(String bookISBN,String userId,String backDate);
    /*
     *  增加书籍库存
     * */
    void addBookStock(String ISBN);
    /**
     * 续借图书
     */
    int renewBook(String ISBN,String userId,String backDate);


    /**
     * 查询库存量
     */
    int findBookStock(String ISBN);

    /**
     * 查询原来总库存量
     */
    int findBookAllStock(String ISBN);

    /**
     * 删除图书库存量
     */
    int delNewStocks(String ISBN);

    /*
     * 查询某用户的借阅记录
     * */
    List<BorrowBean> findBorrowRecord(String userId);

    /*
     * 查询某种类的所有书，用于管理列
     * */
    List<ManageStockpile> findKindsBooks(int typeId);

    /*
     * 查询所有书籍的上下架情况
     * */
    List<BookShelvesBean> findShelves();

    /*
     * 根据ISBN查询库存列表并进行封装
     * */
    List<ManageStockpile> findStockpileList();

    /*
     * 通过书籍号查询当前书籍上下架情况
     * */
    String findOneShelve(String ISBN);

    /**
     * 模糊查询图书
     */
    List<BookInfoBean> findFuzzyBooks(String value);

    /*
     * 分页查询书籍
     * */
    List<BookInfoBean> findPageList(int startNum,int pageContent,String typeId);

    /**
     * 查询某一种类书籍名
     */
    String findTypeName(String typeId);

    /**
     * 查询某一种类书的个数
     */
    int findCount(String typeId);

    /**
     * 查询所有种类书籍名
     */
    List<BookTypeBean> findAllTypeName();


    default String getDate() throws ParseException {
        return new SimpleDateFormat("yyyy-MM-dd").format(new Date());
    }

    default String getAfter30Date() throws ParseException {
        GregorianCalendar gc = new GregorianCalendar();
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
        gc.setTime(new Date());
        gc.add(5, 30);
        return sf.format(gc.getTime());
    }
}
