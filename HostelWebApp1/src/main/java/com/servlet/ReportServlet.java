package com.servlet;

import com.dao.HostelDAO;
import com.model.Student;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HostelDAO dao = new HostelDAO();

        try {
            String report = request.getParameter("report");

            if ("pending".equals(report)) {
                List<Student> pendingStudents = dao.getStudentsWithPendingFees();
                request.setAttribute("pendingFeesList", pendingStudents);

            } else if ("room".equals(report)) {
                String room = request.getParameter("roomNumber");
                if (room == null || room.trim().isEmpty()) {
                    room = "203"; // default room if none provided
                }
                List<Student> roomStudents = dao.getStudentsByRoom(room);
                request.setAttribute("roomNumber", room);
                request.setAttribute("roomList", roomStudents);

            } else if ("date".equals(report)) {
                String startDate = request.getParameter("startDate");
                String endDate = request.getParameter("endDate");
                if (startDate == null || startDate.trim().isEmpty()) {
                    startDate = "2024-01-01"; // default start date
                }
                if (endDate == null || endDate.trim().isEmpty()) {
                    endDate = "2025-12-31"; // default end date
                }
                List<Student> dateRangeStudents = dao.getStudentsByDateRange(startDate, endDate);
                request.setAttribute("startDate", startDate);
                request.setAttribute("endDate", endDate);
                request.setAttribute("dateRangeList", dateRangeStudents);

            } else {
                // No valid report type selected; you may choose to handle this case as needed
            }

            RequestDispatcher rd = request.getRequestDispatcher("reports.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("reports.jsp?status=error");
        }
    }
}
