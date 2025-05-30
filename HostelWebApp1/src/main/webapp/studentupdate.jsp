<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Student - Hostel Management System</title>
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
            background: rgba(0, 0, 0, 0.75);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border-radius: 10px;
            padding: 50px 60px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.5);
            max-width: 600px;
            width: 100%;
            color: white;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            font-weight: 700;
            color: white;
        }

        label {
            font-weight: 500;
            display: block;
            margin-top: 10px;
            margin-bottom: 5px;
            color: white;
        }

        input[type="text"], input[type="date"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background-color: #fff;
            color: #000;
        }

        input[type="submit"] {
            background-color: #000;
            color: #fff;
            padding: 10px 25px;
            border: none;
            border-radius: 50px;
            cursor: pointer;
            transition: 0.3s ease;
            margin-top: 15px;
        }

        input[type="submit"]:hover {
            background-color: #333;
        }

        .back-button {
            margin-top: 15px;
            background-color: #000;
            color: #fff;
            padding: 8px 18px;
            border-radius: 50px;
            text-decoration: none;
            transition: 0.3s ease;
            display: inline-block;
        }

        .back-button:hover {
            background-color: #333;
        }

        .text-center {
            text-align: center;
        }

        @media (max-width: 600px) {
            .overlay {
                padding: 40px 20px;
            }
        }
    </style>
</head>
<body>

<div class="overlay">
    <h2>Update Student Details</h2>
    <form action="UpdateStudentServlet" method="post">
        <label>ID (unchanged):</label>
        <input type="text" name="studentID" required>

        <label>Name:</label>
        <input type="text" name="studentName">

        <label>Room:</label>
        <input type="text" name="roomNumber">

        <label>Admission Date:</label>
        <input type="date" name="admissionDate">

        <label>Fees Paid:</label>
        <input type="text" name="feesPaid">

        <label>Pending Fees:</label>
        <input type="text" name="pendingFees">

        <div class="text-center">
            <input type="submit" value="Update Student">
        </div>
    </form>

    <div class="text-center">
        <a href="index.jsp" class="back-button">Home</a>
    </div>
</div>

</body>
</html>
