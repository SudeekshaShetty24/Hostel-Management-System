package com.servlet;

import com.dao.HostelDAO;
import com.model.Student;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
@WebServlet("/UpdateStudentServlet")

public class UpdateStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Student s = new Student();
        s.setStudentID(Integer.parseInt(request.getParameter("studentID")));
        s.setStudentName(request.getParameter("studentName"));
        s.setRoomNumber(request.getParameter("roomNumber"));
        s.setAdmissionDate(request.getParameter("admissionDate"));
        s.setFeesPaid(Double.parseDouble(request.getParameter("feesPaid")));
        s.setPendingFees(Double.parseDouble(request.getParameter("pendingFees")));

        try {
            HostelDAO dao = new HostelDAO();
            dao.updateStudent(s);
            response.sendRedirect("DisplayStudentsServlet");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("studentupdate.jsp?status=updateerror");
        }
    }
}
