package com.servlet;

import com.dao.HostelDAO;
import com.model.Student;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/DisplayStudentsServlet")
public class DisplayStudentsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HostelDAO dao = new HostelDAO();
            List<Student> students = dao.getAllStudents();
            request.setAttribute("students", students);

            // pass status message if any
            String status = request.getParameter("status");
            if(status != null) {
                request.setAttribute("status", status);
            }

            RequestDispatcher rd = request.getRequestDispatcher("studentdisplay.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("index.jsp?status=error");
        }
    }
}
