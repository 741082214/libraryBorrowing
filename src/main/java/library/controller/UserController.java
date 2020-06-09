package library.controller;

import library.domain.AdminBean;
import library.domain.BorrowBean;
import library.domain.UserInfoBean;
import library.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("RegisterServlet")
    public ModelAndView RegisterServlet(HttpServletRequest request){
        ModelAndView model=new ModelAndView();
        String Uname = request.getParameter("username");
        String Upsw = request.getParameter("Upsw");
        String UidCard = request.getParameter("idcard");
        String Utel = request.getParameter("phone");
        String UserId = request.getParameter("UserId");
        String age=request.getParameter("age");
        Integer Uage = Integer.valueOf(age);
        UserInfoBean user=new UserInfoBean(Uname,Uage,UidCard,Utel,UserId,new Date(),Upsw);
        int n = userService.addUser(user);
        if (n != 0) {
            model.setViewName("login");
            return model;
        } else {
            model.setViewName("register");
            return model;
        }
    }

    @RequestMapping("LoginServlet")
    public void LoginServlet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        session.setAttribute("userService",userService);
        PrintWriter out = response.getWriter();
        String isType=request.getParameter("type");
        //判断是否选择了登录类型
        if (isType !=null) {
            int type = Integer.parseInt(isType);
                // 从页面获取信息
                String id = request.getParameter("userid");
                String password = request.getParameter("password");
                UserInfoBean user = null;
                AdminBean admin=null;
                if (type == 1) {
                    user =userService.findCheckLogin(id,password);
                    if (user == null)// 普通用户用户名或密码错误
                    {
                        out.print("<script>alert('用户名或密码错误');window.location.href='login.jsp';</script>");
                    }
                    else {
                        session.setAttribute("user", user);
                        response.sendRedirect("SearchBookServlet");
                    }
                } else if (type == 2) {
                    admin = userService.findCheckAdminLogin(id,password);
                    if (admin == null)// 管理员用户名或密码错误
                    {
                        out.print("<script>alert('用户名或密码错误');window.location.href='login.jsp';</script>");
                    }
                    else {
                        session.setAttribute("admin", admin);
                        response.sendRedirect("ManageBooksServlet");
                    }
                }
        } else {
            out.print("<script>alert('请选择登录类型！');location.href='login.jsp';</script>");
        }
    }

    @RequestMapping("UpdateInfoServlet")
    public void UpdateInfoServlet(HttpServletRequest request,HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String userId = ((UserInfoBean) (session.getAttribute("user"))).getUserId();
        String newName = request.getParameter("newname");
        String newTel = request.getParameter("newtel");
        int n=userService.updateUser(userId,newName,newTel);
        UserInfoBean user =userService.findUserById(userId);
        session.setAttribute("user", user);
        if (newName.length()<1||newTel.length()<1){
            out.print("<script>alert('请输入姓名或电话！');location.href='UserInfoServlet';</script>");
        }else if (n ==1){
            out.print("<script>alert('更新用户成功！');location.href='UserInfoServlet';</script>");
        }
    }

    @RequestMapping("UpdatePswServlet")
    public void UpdatePswServlet(HttpServletRequest request,HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        String userId = ((UserInfoBean) (session.getAttribute("user"))).getUserId();
        UserInfoBean user = userService.findUserById(userId);
        String oldpsw1=request.getParameter("oldpsw");//从页面获取的原密码
        String oldpsw2=user.getUpsw();//从数据库获取的原密码
        // 从页面传入参数,判断2次输入的新设密码是否一样
        String psw1 = request.getParameter("newpsw");
        String psw2 = request.getParameter("conforim");
        if (psw1.length()<6){
            out.print("<script>alert('密码长度不得小于6位！');location.href='UserInfoServlet';</script>");
        }else if (!oldpsw1.equals(oldpsw2)){
            out.print("<script>alert('原密码不正确，请重写输入！');location.href='UserInfoServlet';</script>");
        }else if (psw1.equals(psw2)) {
            int n=userService.updatePsw(userId,psw1);
            UserInfoBean newUser=userService.findUserById(userId);
            session.setAttribute("user", newUser);
            if (n != 0) {
                session.invalidate();
                out.print("<script>alert('修改密码成功');location.href='login.jsp';</script>");
            }else {

                out.print("<script>alert('修改密码失败');location.href='UserInfoServlet';</script>");
            }
        } else {
            out.print("<script>alert('两次密码不一样，请重新输入！');location.href='UserInfoServlet';</script>");
        }
    }

    @RequestMapping("MessageServlet")
    public void MessageServlet(HttpServletRequest request,HttpServletResponse response) throws IOException{
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session=request.getSession();
        PrintWriter out = response.getWriter();
        String userId=((UserInfoBean)session.getAttribute("user")).getUserId();
        String name=request.getParameter("name");
        String email=request.getParameter("email");
        String comment=request.getParameter("comment");
        int n=userService.addMessage(userId,name,email,comment);
        if (n!=0) {
            out.print("<script>alert('留言成功，我们已经收到留言！');location.href='ContactServlet';</script>");
        }
    }

    @GetMapping("ManageUserServlet")
    public String ManageUserServlet(Model model) {
        List<UserInfoBean> users=userService.findAllUsers();
        model.addAttribute("allUser", users);
        return "manageuser";
    }

    @GetMapping("LogoutServlet")
    public String LogoutServlet(HttpSession session){
        session.invalidate();
        return "redirect:login.jsp";
    }

    @RequestMapping("DeleteUserServlet")
    public void DeleteUserServlet(@RequestParam("utid")String utid,HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        int n=userService.deleteUser(utid);
        PrintWriter out=response.getWriter();
        if (n != 0) {
            out.print("<script>alert('删除用户成功!');location.href='ManageUserServlet';</script>");
        }
    }

    /*
    * 由于用了拦截器，下面页面没有对应的控制器方法，所以进行添加
    * */

    @RequestMapping("ContactServlet")
    public String ContactServlet(){
        return "contact";
    }

    @RequestMapping("DonateServlet")
    public String DonateServlet(){
        return "donatebook";
    }

    @RequestMapping("AdminhomeServlet")
    public String AdminhomeServlet(){
        return "adminhome";
    }

    @RequestMapping("AdminaboutServlet")
    public String AdminaboutServlet(Model model){
        List<BorrowBean> allBorrowUsers = userService.findAllBorrowUsers();
        model.addAttribute("allBorrowUsers",allBorrowUsers);
        return "adminabout";
    }

    @RequestMapping("EdittypeJspServlet")
    public String EdittypeJspServlet(String typename, String btid, HttpSession session) throws ServletException, IOException {
        session.setAttribute("typeName",typename);
        session.setAttribute("typeId",btid);
        return "redirect:EdittypeForwardServlet";
    }
    @RequestMapping("EdittypeForwardServlet")
    public String EdittypeForwardServlet(HttpSession session, Model model){
        String typeName=(String) session.getAttribute("typeName");
        String typeId=(String) session.getAttribute("typeId");
        session.removeAttribute("typeName");
        session.removeAttribute("typeId");
        model.addAttribute("typeName",typeName);
        model.addAttribute("typeId",typeId);
        return "edittype";
    }



}
