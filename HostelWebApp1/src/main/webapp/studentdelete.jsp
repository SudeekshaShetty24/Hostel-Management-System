<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Delete Student - Hostel Management System</title>
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
            max-width: 500px;
            width: 100%;
            color: white;
            text-align: center;
        }

        h2 {
            margin-bottom: 30px;
            font-weight: 700;
            color: white;
        }

        label {
            font-weight: 500;
            margin-bottom: 5px;
            display: block;
            color: white;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
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
            margin-bottom: 15px;
        }

        input[type="submit"]:hover {
            background-color: #333;
        }

        .back-button {
            display: inline-block;
            background-color: #000;
            color: #fff;
            padding: 10px 25px;
            border-radius: 50px;
            text-decoration: none;
            transition: 0.3s ease;
        }

        .back-button:hover {
            background-color: #333;
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
        <h2>Delete Student</h2>
        <form action="DeleteStudentServlet" method="post">
            <label for="studentID">Enter Student ID:</label>
            <input type="text" name="studentID" id="studentID" required>
            <input type="submit" value="Delete Student">
        </form>

        <a href="index.jsp" class="back-button">Back to Home</a>
    </div>

</body>
</html>
