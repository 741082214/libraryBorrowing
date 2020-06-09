
package library.dao;

import library.domain.*;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;
import java.util.List;

/**
 * 关于图书的操作
 */
@CacheNamespace(blocking = true)
@Repository("bookDao")
public interface BookDao {
	/*
	* 查询所有图书
	* */
	@Select("select * from tb_bookinfo")
	List<BookInfoBean> findAllBook();

	/*
	 * 根据ISBN查找书名
	 * */
	@Select("select bookname from tb_bookinfo where ISBN=#{ISBN}")
	String findName(String ISBN);
	/**
	 * 更新图书种类
	 */
	@Update("update tb_booktype set type=#{typeName} where btid=#{typeId}")
	int updateKindsbooks(@Param("typeId") String typeId, @Param("typeName") String typeName);


	/**
	 * 捐献图书，数据保存在图书捐献表
	 */
	@Insert("insert into tb_donatebook(ISBN,typeId,bookname,writer,publisher,date,price,shelves) " +
			"values(#{ISBN},#{typeId},#{bookname},#{writer},#{publ elves})")
	int addBooks(BookInfoBean bookInfo);

	/**
	 * 删除图书
	 */
	@Delete("delete from tb_bookinfo where ISBN=#{ISBN}")
	int deleteBooks(String ISBN);

	/*
		上架/下架图书
	 */
	@Update("update tb_bookinfo set shelves=#{shelves} where ISBN=#{ISBN}")
	int onBooks(@Param("ISBN") String ISBN,@Param("shelves") String shelves);

	@Update("update tb_stockpile set shelves=#{shelves} where ISBN=#{ISBN}")
	int onAdminBooks(@Param("ISBN") String ISBN,@Param("shelves") String shelves);
	/*
		下架图书（在删除的时候）
	 */
	@Update("update tb_bookinfo set shelves='none' where ISBN=#{ISBN}")
	int offBooks(String ISBN);
	/*
    下架图书（在删除的时候）
 	*/
	@Update("update tb_stockpile set shelves='none' where ISBN=#{ISBN}")
	int offAdminBooks(String ISBN);
	/**
	 * 借阅书籍记录
	 */
	@Insert("insert into tb_borrow (bookISBN,bookname, userId, borrowDate,backDate, isback) values" +
			"(#{bookISBN},#{bookName},#{userId},#{borrowDate},#{backDate},#{isback})")
	int borrowBook(BorrowBean borrowBean);
	/*
	 *  减少书籍库存
	 * */
	@Update("update tb_stockpile set amount=amount-1 where ISBN=#{ISBN}")
	void reduceBookStock(String ISBN);

	/**
	 * 归还图书
	 */
	@Update("update tb_borrow t1 inner join (select min(borrowId) as minBorrowId from tb_borrow where bookISBN=#{bookISBN} and userId=#{userId} and isback=0) t2 " +
			"set isback=1,backDate=#{backDate} where t1.borrowId=t2.minBorrowId")
	int backBook(@Param("bookISBN") String bookISBN,@Param("userId") String userId,@Param("backDate") String backDate);
	/*
	 *  增加书籍库存
	 * */
	@Update("update tb_stockpile set amount=amount+1 where ISBN=#{ISBN}")
	void addBookStock(String ISBN);
	/**
	 * 续借图书
	 */
	@Update("update tb_borrow set backDate=#{backDate} where bookISBN=#{ISBN} and userId=#{userId}")
	int renewBook(@Param("ISBN") String ISBN,@Param("userId") String userId,@Param("backDate") String backDate);


	/**
	 * 查询库存量
	 */
	@Select("select amount from tb_stockpile where ISBN=#{ISBN}")
	int findBookStock(String ISBN);

	/*
	* 查询图书原有总量
	* */
	@Select("select allAccount from tb_stockpile where ISBN=#{ISBN}")
	int findBookAllStock(String ISBN);

	/*
	* 查询库存列表并进行封装
	* */
	@Select("select * from tb_stockpile")
	List<ManageStockpile> findStockpileList();

	/**
	 * 删除图书库存量
	 */
	@Delete("delete from tb_stockpile where ISBN=#{ISBN}")
	int delNewStocks(String ISBN);

	/*
	 * 查询某用户的借阅记录
	 * */
	@Select("select * from tb_borrow where userId=#{userId} and isback=0")
	List<BorrowBean> findBorrowRecord(String userId);

	/*
	 * 查询某种类的所有书,用于管理页
	 * */
	@Select("select * from tb_stockpile where typeId=#{typeId}")
	List<ManageStockpile> findKindsBooks(int typeId);

	/*
	 * 查询所有书籍的上下架情况
	 * */
	@Select("select ISBN,shelves from tb_bookinfo")
	List<BookShelvesBean> findShelves();

	/*
	* 通过书籍号查询当前书籍上下架情况
	* */
	@Select("select shelves from tb_bookinfo where ISBN=#{ISBN}")
	String findOneShelve(String ISBN);

	/**
	 * 模糊查询图书
	 */
	@Select("select * from tb_bookinfo left join tb_booktype on typeId=btid where ISBN like '%${value}%' or type like '%${value}%'" +
			"or bookname like '%${value}%' or writer like '%${value}%' or publisher like '%${value}%'")
	List<BookInfoBean> findFuzzyBooks(String value);

	/*
	 * 分页查询书籍
	 * */
	@Select("select ISBN,typeId,bookname,writer,publisher,date,price,shelves from tb_bookinfo where shelves='block' and typeId=#{typeId} limit #{startNum},#{pageContent}")
	List<BookInfoBean> findPageList(@Param("startNum") int startNum,@Param("pageContent") int pageContent,@Param("typeId") String typeId);

	/**
	 * 查询某一种类书籍名
	 */
	@Select("select type from tb_booktype where btid=#{typeId}")
	String findTypeName(String typeId);

	/**
	 * 查询某一种类书的个数
	 */
	@Select("select count(*) from tb_bookinfo where typeId=#{typeId}")
	int findCount(String typeId);

	/**
	 * 查询所有种类书籍名
	 */
	@Select("select * from tb_booktype")
	List<BookTypeBean> findAllTypeName();





}