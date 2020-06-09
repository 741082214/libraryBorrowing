package library.controller;

import library.domain.*;
import library.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

@Controller
public class BookController {
    @Autowired
    private BookService bookService;

    @RequestMapping("/UserInfoServlet")
    public String UserInfoServlet(HttpSession session,Model model){
        String userId = ((UserInfoBean) (session.getAttribute("user"))).getUserId();
        List<BorrowBean> listrecord = bookService.findBorrowRecord(userId);
        model.addAttribute("listborrowrecord", listrecord);
        return "userinfo";
    }

    @RequestMapping("/TypeBooksServlet")
    public String TypeBooksServlet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String type = request.getParameter("type");
        if (session.getAttribute("type") == null && type != null) {
            session.setAttribute("type", type);
        } else if (session.getAttribute("type") != null && type == null) {
            type = (String) session.getAttribute("type");
        } else if (session.getAttribute("type") != null && type != null) {
            type = request.getParameter("type");// 取得图书种类编号
            session.setAttribute("type", type);
        }
        String typename = bookService.findTypeName(type);
        request.setAttribute("typename", typename);
        List<BookInfoBean> list = null;
        String page = request.getParameter("page"); // 从页面获得要显示的页码
        int pageNum = 1; // 显示第几页
        int pageTotal = 0; // 总页数
        int pageContent = 10; // 每页显示记录条数
        int count = 0; // 数据库总记录数
        try {
            count = bookService.findCount(type); // 通过模型类的方法获得数据库记录总数
            if (count > 0) {
                pageTotal = count / pageContent; // 计算页数
                if (pageTotal * pageContent != count) { // 处理余数
                    pageTotal = pageTotal + 1;
                }
            }
            if (page != null) { // 如果获得的显示页码值不为空
                pageNum = Integer.parseInt(page); // 做数据类型的转换
            }
            int startNum = (pageNum - 1) * pageContent;
            list = bookService.findPageList(startNum, pageContent, type);// 调用模型，进行分页查询，返回分页显示的数据
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("choosebooks", list);
        request.setAttribute("pageTotal", pageTotal);
        return "bookdetail";
    }

    @RequestMapping("/RenewBookServlet")
    public void RenewBookServlet(HttpServletRequest request,HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String pathadd = request.getContextPath();
        PrintWriter out = response.getWriter();
        String userId = ((UserInfoBean) (session.getAttribute("user"))).getUserId();
        String ISBN = request.getParameter("bookid");
        try {
            int n = bookService.renewBook(ISBN,userId,bookService.getAfter30Date());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        out.print("<script>alert('续借成功！');location.href='" + pathadd
                + "/UserInfoServlet';</script>");
    }

    @RequestMapping("ReaderSearchServlet")
    public String ReaderSearchServlet(@RequestParam("search") String search,Model model){
        List<BookInfoBean> list=bookService.findFuzzyBooks(search);
        model.addAttribute("searchresult", list);
        return "rsearchbookresult";
    }

    @RequestMapping("onBookServlet")
    public void onBookServlet(HttpServletRequest request,HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        String pathadd = request.getContextPath();
        PrintWriter out = response.getWriter();
        String bookId = request.getParameter("bookId");
        String shelves = request.getParameter("shelves");
        int c=bookService.onBooks(bookId,shelves);
        bookService.onAdminBooks(bookId,shelves);
        if (c!=0&&shelves.equals("block")) {
            out.print("<script>alert('上架成功！');location.href='" + pathadd
                    + "/ManageBooksServlet';</script>");
        }else if (c!=0&&shelves.equals("none")){
            out.print("<script>alert('下架成功！');location.href='" + pathadd
                    + "/ManageBooksServlet';</script>");
        }else{
            out.print("<script>alert('操作出现异常，请重新操作！');location.href='" + pathadd
                    + "/ManageBooksServlet';</script>");
        }
    }

    @RequestMapping("ManageBooksServlet")
    public String ManageBooksServlet(Model model){

        List<BookTypeBean> allNames = bookService.findAllTypeName();
        int n=allNames.size();
        List<ManageStockpile> listBooks=null;
        for (int i=0;i<n;i++){
            listBooks=bookService.findKindsBooks(1001+i);
            model.addAttribute(1001+i+"",listBooks);
        }
        model.addAttribute("allNames", allNames);
        return "managebooks";
    }

    @RequestMapping("EditTypeServlet")
    public void EditTypeServlet(HttpServletRequest request,HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        String pathadd = request.getContextPath();
        PrintWriter out = response.getWriter();
        String typeid = request.getParameter("typeid");
        String newname=request.getParameter("newname");
        int n=bookService.updateKindsbooks(typeid,newname);
        if (n != 0){
            out.print("<script>alert('修改图书类名成功');location.href='"
                    + pathadd + "/ManageBooksServlet';</script>");
        }
    }

    @RequestMapping("DonateBookServlet")
    public void DonateBookServlet(HttpServletRequest request,HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        String pathadd = request.getContextPath();
        PrintWriter out = response.getWriter();
        BookInfoBean bookInfo = null;
        String ISBN = request.getParameter("ISBN");
        String typeId = request.getParameter("typeId");
        String bookname = request.getParameter("bookname");
        String writer = request.getParameter("writer");
        String publisher = request.getParameter("publisher");
        String stringDate=request.getParameter("date");
        String stringPrice=request.getParameter("price");
        if(ISBN.length()<1||bookname.length()<1||writer.length()<1||publisher.length()<1||stringDate.length()<1|| stringPrice.length()<1){
            out.print("<script>alert('捐献书籍信息不允许为空！');location.href='"
                    + pathadd + "/DonateServlet';</script>");
        }
        StringBuilder date = new StringBuilder(stringDate);
        BigDecimal price=new BigDecimal(stringPrice);
        if (date.length()<=7){
            date.append("-01");
        }
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        try {
            bookInfo=new BookInfoBean(ISBN, typeId, bookname, writer, publisher, sdf.parse(String.valueOf(date)), price ,"none");
        } catch (ParseException e) {
            out.print("<script>alert('捐赠图书失败，出版时间格式有误！');location.href='"
                    + pathadd + "/DonateServlet';</script>");
            e.printStackTrace();
        }
        int n=bookService.addBooks(bookInfo);
        if (n ==1) {
            out.print("<script>alert('捐赠图书成功！');location.href='"
                    + pathadd + "/DonateServlet';</script>");
        }else{
            out.print("<script>alert('捐赠图书失败，请检查后重写提交');location.href='"
                    + pathadd + "/DonateServlet';</script>");
        }
    }

    @RequestMapping("DeleteBookServlet")
    public void DeleteBookServlet(HttpServletRequest request,HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        String pathadd = request.getContextPath();
        PrintWriter out = response.getWriter();
        String btid = request.getParameter("btid");
        int stock = bookService.findBookStock(btid);
        int all=bookService.findBookAllStock(btid);
        if ((all-stock)==0) {
            bookService.offBooks(btid);
            bookService.offAdminBooks(btid);
            int n = bookService.deleteBooks(btid);
            int c=bookService.delNewStocks(btid);
            if (n != 0&&c!=0) {
                out.print("<script>alert('删除图书成功！');location.href='"
                        + pathadd + "/ManageBooksServlet';</script>");
            }
        } else {
            out.print("<script>alert('此书尚有读者未归还,无法删除！');location.href='"
                    + pathadd + "/ManageBooksServlet';</script>");
        }
    }

    @RequestMapping("SearchBookServlet")
    public String SearchBookServlet(Model model){
        Map<String,String> shelvesMap=new HashMap<>();
        List<BookShelvesBean> shelves=bookService.findShelves();
        for (BookShelvesBean shelve:shelves){
            shelvesMap.put(shelve.getISBN(),shelve.getShelves());
        }
        model.addAttribute("shelvesMap",shelvesMap);
        return "searchbooks";
    }

    @RequestMapping("BorrowServlet")
    public void BorrowServlet(HttpServletRequest request,HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        String pathadd = request.getContextPath();
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        String userId = ((UserInfoBean) (session.getAttribute("user"))).getUserId();
        String ISBN = request.getParameter("isbn");
        String bookName=bookService.findName(ISBN);
        int n = bookService.findBookStock(ISBN);
        String shelve=bookService.findOneShelve(ISBN);
        BorrowBean borrowBean=null;
        try {
            borrowBean=new BorrowBean(ISBN,bookName,userId,0,bookService.getDate(),bookService.getAfter30Date());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        if ("none".equals(shelve)){
            out.print("<script>alert('您所借阅的图书已经下架！');location.href='"
                    + pathadd + "/SearchBookServlet';</script>");
        }
        // 如果没有库存
        if (n == 0) {
            out.print("<script>alert('您所借阅的图书目前没有库存！');location.href='"
                    + pathadd + "/SearchBookServlet';</script>");
        }else if (n>0) {
            bookService.borrowBook(borrowBean);
            bookService.reduceBookStock(ISBN);
            out.print("<script>alert('借阅成功！');location.href='SearchBookServlet';</script>");
        }
    }

    @RequestMapping("BackBookServlet")
    public void BackBookServlet(HttpServletRequest request,HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String pathadd = request.getContextPath();
        PrintWriter out = response.getWriter();
        String userId = ((UserInfoBean) (session.getAttribute("user"))).getUserId();
        String bookId = request.getParameter("bookid");
        int n = 0;
        try {
            n = bookService.backBook(bookId,userId,bookService.getDate());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        if (n==1){
            bookService.addBookStock(bookId);
            out.print("<script>alert('归还成功！');location.href='"+pathadd+"/UserInfoServlet';</script>");
        }else{
            out.print("<script>alert('归还失败！');location.href='"+pathadd+"/UserInfoServlet';</script>");
        }
    }

}
