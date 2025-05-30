<%@ page import="java.util.List" %>
<%@ page import="com.model.Student" %>
<!DOCTYPE html>
<html>
<head>
    <title>Hostel Reports</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 50%, #6a11cb 100%);
            height: 100vh;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .container {
            background: rgba(0, 0, 0, 0.75);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border-radius: 10px;
            padding: 40px 50px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.5);
            max-width: 800px;
            width: 100%;
            color: white;
            overflow-y: auto;
            max-height: 90vh;
        }
        h2 {
            text-align: center;
            margin-bottom: 25px;
            font-weight: 700;
        }
        select, input[type="text"], input[type="date"], button {
            margin: 10px 0;
            padding: 8px;
            border-radius: 8px;
            border: none;
            width: 100%;
            max-width: 300px;
        }
        select, input[type="text"], input[type="date"] {
            font-size: 16px;
        }
        button {
            background-color: #000;
            color: white;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s ease;
            max-width: 320px;
            margin-top: 15px;
        }
        button:hover {
            background-color: #333;
        }
        table {
            width: 100%;
            margin-top: 25px;
            border-collapse: collapse;
            color: white;
        }
        th, td {
            border: 1px solid #fff;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #4a3c8c;
        }
        td {
            background-color: rgba(255,255,255,0.1);
        }
        .back-btn {
            display: inline-block;
            background-color: #000;
            color: #fff;
            padding: 10px 25px;
            border-radius: 50px;
            text-decoration: none;
            text-align: center;
            font-weight: 600;
            margin-top: 30px;
            transition: background-color 0.3s ease;
        }
        .back-btn:hover {
            background-color: #333;
        }
    </style>

    <script>
        function showForm() {
            const reportType = document.getElementById("reportType").value;
            document.getElementById("pendingForm").style.display = "none";
            document.getElementById("roomForm").style.display = "none";
            document.getElementById("dateForm").style.display = "none";

            if (reportType === "pending") {
                document.getElementById("pendingForm").style.display = "block";
            } else if (reportType === "room") {
                document.getElementById("roomForm").style.display = "block";
            } else if (reportType === "date") {
                document.getElementById("dateForm").style.display = "block";
            }
        }

        window.onload = function() {
            showForm();
        };
    </script>
</head>
<body>

<div class="container">
    <h2>Select Report Type</h2>

    <select id="reportType" onchange="showForm()" name="reportType">
        <option value="">--Select--</option>
        <option value="pending" <%= "pending".equals(request.getParameter("report")) ? "selected" : "" %>>Students with Pending Fees</option>
        <option value="room" <%= "room".equals(request.getParameter("report")) ? "selected" : "" %>>Students by Room</option>
        <option value="date" <%= "date".equals(request.getParameter("report")) ? "selected" : "" %>>Students Admitted in Date Range</option>
    </select>

    <!-- Pending Fees Form -->
    <form id="pendingForm" action="ReportServlet" method="post" style="display:none;">
        <input type="hidden" name="report" value="pending">
        <button type="submit">Show Report</button>
    </form>

    <!-- Room Form -->
    <form id="roomForm" action="ReportServlet" method="post" style="display:none;">
        <label>Enter Room Number:</label>
        <input type="text" name="roomNumber" required value="<%= request.getParameter("roomNumber") != null ? request.getParameter("roomNumber") : "" %>">
        <input type="hidden" name="report" value="room">
        <button type="submit">Show Report</button>
    </form>

    <!-- Date Range Form -->
    <form id="dateForm" action="ReportServlet" method="post" style="display:none;">
        <label>Start Date:</label>
        <input type="date" name="startDate" required value="<%= request.getParameter("startDate") != null ? request.getParameter("startDate") : "" %>">
        <label>End Date:</label>
        <input type="date" name="endDate" required value="<%= request.getParameter("endDate") != null ? request.getParameter("endDate") : "" %>">
        <input type="hidden" name="report" value="date">
        <button type="submit">Show Report</button>
    </form>

    <hr style="margin: 30px 0; border-color: rgba(255,255,255,0.3);" />

    <%-- Display Results --%>
    <%
        String reportType = request.getParameter("report");
        List<Student> list = null;

        if ("pending".equals(reportType)) {
            list = (List<Student>) request.getAttribute("pendingFeesList");
    %>
        <h3>Students with Pending Fees</h3>
    <% } else if ("room".equals(reportType)) {
            list = (List<Student>) request.getAttribute("roomList");
    %>
        <h3>Students in Room <%= request.getAttribute("roomNumber") %></h3>
    <% } else if ("date".equals(reportType)) {
            list = (List<Student>) request.getAttribute("dateRangeList");
    %>
        <h3>Students Admitted from <%= request.getAttribute("startDate") %> to <%= request.getAttribute("endDate") %></h3>
    <% }

        if (list != null && !list.isEmpty()) {
    %>
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Room</th>
                <th>Admission Date</th>
                <th>Fees Paid</th>
                <th>Pending Fees</th>
            </tr>
            </thead>
            <tbody>
            <% for (Student s : list) { %>
                <tr>
                    <td><%= s.getStudentID() %></td>
                    <td><%= s.getStudentName() %></td>
                    <td><%= s.getRoomNumber() %></td>
                    <td><%= s.getAdmissionDate() %></td>
                    <td><%= s.getFeesPaid() %></td>
                    <td><%= s.getPendingFees() %></td>
                </tr>
            <% } %>
            </tbody>
        </table>
    <% } else if (reportType != null) { %>
        <p style="text-align:center; margin-top:20px;">No records found.</p>
    <% } %>

    <div style="text-align:center;">
        <a class="back-btn" href="index.jsp">Home</a>
    </div>
</div>

</body>
</html>
