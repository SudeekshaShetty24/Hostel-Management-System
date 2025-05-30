package com.servlet;

import com.dao.HostelDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
@WebServlet("/DeleteStudentServlet")

public class DeleteStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int studentID = Integer.parseInt(request.getParameter("studentID"));

        try {
            HostelDAO dao = new HostelDAO();
            dao.deleteStudent(studentID);
            response.sendRedirect("DisplayStudentsServlet?status=deleted");


        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("studentdelete.jsp?status=error");
        }
    }
}
