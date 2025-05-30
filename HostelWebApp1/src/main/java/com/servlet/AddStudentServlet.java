
package com.servlet;

import com.dao.HostelDAO;
import com.model.Student;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/AddStudentServlet")

public class AddStudentServlet extends HttpServlet {
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
            dao.addStudent(s);
            response.sendRedirect("DisplayStudentsServlet?status=added");

        } catch (Exception e) {
                e.printStackTrace(); // Logs error in Tomcat console
                response.sendRedirect("studentadd.jsp?status=error");
            }
    
    }
}
