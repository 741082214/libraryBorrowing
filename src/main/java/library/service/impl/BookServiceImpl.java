package library.service.impl;

import library.dao.BookDao;
import library.domain.*;
import library.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("bookService")
public class BookServiceImpl implements BookService {

    @Qualifier("bookDao")
    @Autowired
    BookDao bookDao;

    @Override
    public List<BookInfoBean> findAllBook() {
        return bookDao.findAllBook();
    }

    @Override
    public String findName(String ISBN) {
        return bookDao.findName(ISBN);
    }

    @Override
    public int updateKindsbooks(String typeId, String typeName) {
        return bookDao.updateKindsbooks(typeId,typeName);
    }

    @Override
    public int addBooks(BookInfoBean bookInfo) {
        return bookDao.addBooks(bookInfo);
    }

    @Override
    public int deleteBooks(String ISBN) {
        return bookDao.deleteBooks(ISBN);
    }

    @Override
    public int onBooks(String ISBN, String shelves) {
        return bookDao.onBooks(ISBN,shelves);
    }

    @Override
    public int onAdminBooks(String ISBN, String shelves) {
        return bookDao.onAdminBooks(ISBN,shelves);
    }

    @Override
    public int offBooks(String ISBN) {
        return bookDao.offBooks(ISBN);
    }

    @Override
    public int offAdminBooks(String ISBN) {
        return bookDao.offAdminBooks(ISBN);
    }

    @Override
    public int borrowBook(BorrowBean borrowBean) {
        return bookDao.borrowBook(borrowBean);
    }

    @Override
    public void reduceBookStock(String ISBN) {
        bookDao.reduceBookStock(ISBN);
    }

    @Override
    public int backBook(String bookISBN, String userId, String backDate) {
        return bookDao.backBook(bookISBN,userId,backDate);
    }

    @Override
    public void addBookStock(String ISBN) {
        bookDao.addBookStock(ISBN);
    }

    @Override
    public int renewBook(String ISBN, String userId, String backDate) {
        return bookDao.renewBook(ISBN,userId,backDate);
    }

    @Override
    public List<ManageStockpile> findStockpileList(){
        return bookDao.findStockpileList();
    }

    @Override
    public int findBookStock(String ISBN) {
        return bookDao.findBookStock(ISBN);
    }

    @Override
    public int findBookAllStock(String ISBN) {
        return bookDao.findBookAllStock(ISBN);
    }

    @Override
    public int delNewStocks(String ISBN) {
        return bookDao.delNewStocks(ISBN);
    }

    @Override
    public List<BorrowBean> findBorrowRecord(String userId) {
        return bookDao.findBorrowRecord(userId);
    }

    @Override
    public List<ManageStockpile> findKindsBooks(int typeId) {
        return bookDao.findKindsBooks(typeId);
    }

    @Override
    public List<BookShelvesBean> findShelves() {
        return bookDao.findShelves();
    }

    @Override
    public String findOneShelve(String ISBN) {
        return bookDao.findOneShelve(ISBN);
    }

    @Override
    public List<BookInfoBean> findFuzzyBooks(String value) {
        return bookDao.findFuzzyBooks(value);
    }

    @Override
    public List<BookInfoBean> findPageList(int startNum, int pageContent, String typeId) {
        return bookDao.findPageList(startNum,pageContent,typeId);
    }

    @Override
    public String findTypeName(String typeId) {
        return bookDao.findTypeName(typeId);
    }

    @Override
    public int findCount(String typeId) {
        return bookDao.findCount(typeId);
    }

    @Override
    public List<BookTypeBean> findAllTypeName() {
        return bookDao.findAllTypeName();
    }



}
