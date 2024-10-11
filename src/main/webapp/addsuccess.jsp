<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Success</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #e0f7fa, #b9fbc0);
            color: #333;
            text-align: center;
            margin: 0;
            padding: 20px;
        }
        h1 {
            color: #2e7d32;
            margin-bottom: 20px;
            font-size: 2em;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.2);
        }
        .message {
            font-size: 1.2em;
            color: #4caf50;
            margin: 20px 0;
            padding: 15px;
            border: 1px solid #4caf50;
            border-radius: 5px;
            background-color: #e8f5e9;
            display: inline-block;
        }
        a {
            text-decoration: none;
            font-size: 1em;
            color: #ffffff;
            background-color: #2e7d32;
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        a:hover {
            background-color: #1b5e20;
        }
    </style>
</head>
<body>
    <h1>Success!</h1>
    <div class="message">
        <c:out value="${message}"></c:out>
    </div>
    <br><br>
    <a href="addemp">Add Another Employee</a>&nbsp;&nbsp;
    <a href="viewallemps">View All Employees</a>
</body>
</html>
