<%@ page import="java.util.List" %>
<%@ page import="com.model.Student" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Hostel Students</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #1c1c3c, #2b2b6f);
            color: white;
        }

        .container {
            width: 90%;
            margin: 30px auto;
            background-color: rgba(0, 0, 0, 0.7);
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.5);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            font-size: 28px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            text-align: center;
            background-color: rgba(255, 255, 255, 0.1);
            color: white;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        th {
            background-color: rgba(255, 255, 255, 0.2);
        }

        .status {
            text-align: center;
            margin-bottom: 15px;
            font-weight: bold;
        }

        .success {
            color: #00ff00;
        }

        .error {
            color: #ff4444;
        }

        .btn-back {
            display: block;
            margin: 25px auto 0;
            padding: 8px 16px;
            background-color: black;
            color: white;
            text-decoration: none;
            border-radius: 15px;
            font-size: 14px;
            width: fit-content;
        }

        .btn-back:hover {
            background-color: #444;
        }
    </style>
</head>
<body>

<div class="container">
    <% 
        List<Student> students = (List<Student>) request.getAttribute("students");
        String status = (String) request.getAttribute("status");
        if (status != null) {
    %>
        <div class="status <%= "error".equals(status) ? "error" : "success" %>">
            <%= "added".equals(status) ? "Student added successfully!" :
                 "updated".equals(status) ? "Student updated successfully!" :
                 "deleted".equals(status) ? "Student deleted successfully!" :
                 "error".equals(status) ? "An error occurred." : "" %>
        </div>
    <% } %>

    <h2>All Hostel Students</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Room</th>
            <th>Admission Date</th>
            <th>Fees Paid</th>
            <th>Pending Fees</th>
        </tr>
        <%
            if (students != null && !students.isEmpty()) {
                for (Student s : students) {
        %>
                    <tr>
                        <td><%= s.getStudentID() %></td>
                        <td><%= s.getStudentName() %></td>
                        <td><%= s.getRoomNumber() %></td>
                        <td><%= s.getAdmissionDate() %></td>
                        <td><%= s.getFeesPaid() %></td>
                        <td><%= s.getPendingFees() %></td>
                    </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="6">No students found.</td>
            </tr>
        <%
            }
        %>
    </table>

    <a href="index.jsp" class="btn-back">Home</a>
</div>

</body>
</html>
