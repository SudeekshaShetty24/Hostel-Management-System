<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Hostel Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 50%, #6a11cb 100%);
            height: 100vh;
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .overlay {
            background: rgba(0, 0, 0, 0.75); /* Dark black with transparency */
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border-radius: 10px;
            padding: 80px 80px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.5);
            max-width: 800px;
            width: 100%;
            text-align: center;
            color: white;
        }

        h1 {
            font-weight: 700;
            font-size: 3rem;
            margin-bottom: 25px;
            letter-spacing: 1.2px;
            color: white;
            text-shadow: none;
        }

        p {
            font-size: 1.3rem;
            margin-bottom: 40px;
            color: white;
        }

        .btn-custom {
            margin: 10px;
            width: 160px;
            padding: 12px;
            border-radius: 50px;
            font-weight: 500;
            transition: all 0.3s ease-in-out;
            background-color: #000;
            color: #fff;
            border: 2px solid #000;
            text-decoration: none;
        }

        .btn-custom:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 16px rgba(0,0,0,0.2);
            background-color: #333;
            border-color: #333;
        }

        @media (max-width: 600px) {
            .overlay {
                padding: 50px 30px;
            }
            h1 {
                font-size: 2rem;
            }
            .btn-custom {
                width: 140px;
                padding: 10px;
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>

    <div class="overlay">
        <h1>Welcome to Hostel Management System</h1>
        
        <div class="d-flex flex-wrap justify-content-center">
            <a href="studentadd.jsp" class="btn btn-primary btn-custom">Add Student</a>
            <a href="DisplayStudentsServlet" class="btn btn-success btn-custom">View Students</a>
            <a href="ReportServlet" class="btn btn-warning btn-custom">Reports</a>
            <a href="studentupdate.jsp" class="btn btn-info btn-custom text-white">Update Student</a>
            <a href="studentdelete.jsp" class="btn btn-danger btn-custom">Delete Student</a>
        </div>
    </div>

</body>
</html>
