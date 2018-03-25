package com.work.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.work.model.Diary;
import com.work.model.Empolyess;
import com.work.oper.DiaryOper;
import com.work.oper.EmpolyessOper;
import com.work.tools.ArticlesDAO;
import com.work.tools.PageBean;

public class EmployessServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * Constructor of the object.
     */
    public EmployessServlet() {
        super();
    }

    /**
     * Destruction of the servlet. <br>
     */
    @Override
    public void destroy() {
        super.destroy(); // Just puts "destroy" string in log
        // Put your code here
    }

    /**
     * The doGet method of the servlet. <br>
     *
     * This method is called when a form has its tag value method equals to get.
     * 
     * @param request the request send by the client to the server
     * @param response the response send by the server to the client
     * @throws ServletException if an error occurred
     * @throws IOException if an error occurred
     */
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        this.doPost(request, response);
    }

    /**
     * The doPost method of the servlet. <br>
     *
     * This method is called when a form has its tag value method equals to post.
     * 
     * @param request the request send by the client to the server
     * @param response the response send by the server to the client
     * @throws ServletException if an error occurred
     * @throws IOException if an error occurred
     */
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        String username = request.getParameter("user_name");
        String userpwd = request.getParameter("user_pass");
        Empolyess m = new Empolyess();
        m.setUser_name(username);
        m.setUser_pass(userpwd);
        EmpolyessOper oper = new EmpolyessOper();
        Empolyess m2 = oper.login(m);
        if (m2 != null) {
            request.setAttribute("memberModel", m2);
            ArticlesDAO dd = new ArticlesDAO();
            PageBean diary_page = new PageBean();
            diary_page.setPage(1);
            diary_page.setPageSize(10);
            diary_page.setTotalCount(dd.count("t_diary", " "));
            List<Diary> diary_list = new ArrayList<>();
            DiaryOper doper = new DiaryOper();
            String diary_where = "";
            if (m2.getLimits() > 1) {
                PageBean emp_page = new PageBean();
                emp_page.setPage(1);
                emp_page.setPageSize(10);
                emp_page.setTotalCount(dd.count("t_employee", " "));
                List<Empolyess> emp_list = new ArrayList<>();
                emp_list = oper.selectMember(" 1=1 ", " order by user_id ", emp_page);

                request.setAttribute("emp_list", emp_list);
                request.setAttribute("emp_page", emp_page);
                diary_where = " 1=1 ";
            } else {
                diary_where = " user_name='" + m2.getUser_name() + "' ";
            }
            diary_list = doper.selectDiary(diary_where, " order by dia_date desc", diary_page);
            request.setAttribute("diary_list", diary_list);
            request.setAttribute("diary_page", diary_page);
            request.getRequestDispatcher("member.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("admin.html").forward(request, response);
        }

    }

    /**
     * Initialization of the servlet. <br>
     *
     * @throws ServletException if an error occurs
     */
    @Override
    public void init() throws ServletException {
        // Put your code here
    }

}
