package com.work.servlet;

import java.io.IOException;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.work.model.Empolyess;
import com.work.oper.EmpolyessOper;

public class RegisterServlet extends HttpServlet {


    private static final long serialVersionUID = 1L;

    /**
     * Constructor of the object.
     */
    public RegisterServlet() {
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
        Empolyess m = new Empolyess();
        m.setUser_name(request.getParameter("username"));
        m.setUser_pass("123456a");
        m.setBirthday(request.getParameter("brithday"));
        m.setTelphone(request.getParameter("contact"));
        m.setGender(request.getParameter("mansex"));
        m.setEmail(request.getParameter("email"));
        m.setMsn(request.getParameter("msn"));
        m.setLimits(Integer.parseInt((request.getParameter("limit") + "")));

        EmpolyessOper eo = new EmpolyessOper();
        boolean flag = eo.register(m);
        Logger.getGlobal().info("register:" + flag);
        request.getRequestDispatcher("register.html").forward(request, response);

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
